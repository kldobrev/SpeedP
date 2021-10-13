#include <gb/gb.h>
#include <rand.h>
#include "pongbkgtiles.c"
#include "ponggameMap.c"
#include "pongspritetiles.c"
#include "paddle.c"
#include "ball.c"



const UINT8 startballposxy = 84;
UINT8 framecnt;
UINT8 ballmvframe; // controlls the ball's speed, 4 for auto
UINT8 padheight;
UINT8 padspeed; // Slow is 2, normal is 3, fast is 4
UINT8 padsectors[3]; // Holds px values for 25%, 50% and 75% of paddle height
UINT8 padinity;
Paddle pdlpl1;
Paddle pdlcpu;
Ball ball;
UINT8 tileind;
UINT8 difficulty; // 0 - easy, 1 - normal, 2 - hard
UINT8 itr, randindx, randindy; // used in loops
UINT8 pl1score, cpuscore;
const UINT8 difficulty_px[3] = {139, 126, 84};
const INT8 stspeedpoolx[2] = {-4, 4};
const INT8 stspeedpooly[5] = {-4, -2, 0, 2, 4};
const UINT8 bkgborderup = 32;
const UINT8 bkgborderdown = 144;
UBYTE exitgameflg;
UBYTE autospeedflg;  // Default: on
INT8 chspeedflgdir; // For autospeed mode; holds current ball x direction
UINT8 paddlehitscnt;
const UINT8 speedchframes[3] = {6, 12, 36}; // Number of paddles hit before speed increase in auto mode
UINT8 speedind;
UINT8 roundlimit;
UINT8 roundcnt;


void default_settings();
void set_pad_sectors();
void move_ball(Paddle * ppl1, Paddle * pcpu);
void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy);
void prep_next_round();
void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp);
void move_paddle(Paddle * pdl, INT8 pdlsp);
void auto_speed_adj();
void init_game();
void begin_round();
void start_game();
UBYTE hits_walls(UINT8 nexty, UINT8 objheight);
UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl);
UBYTE is_round_over();
INT8 get_bounce_off_dir_y(Paddle * pad);



void set_pad_sectors() {
    // Dividing the paddle height into 4 equal sectors
    // and setting the borders between them
    padsectors[0] = padheight * 2; // 25%
    padsectors[1] = padheight * 4; // 50%
    padsectors[2] = padheight * 6; // 75%
}

UBYTE hits_walls(UINT8 nexty, UINT8 objheight) {
    return nexty < bkgborderup || nexty + objheight > bkgborderdown;
}

UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl) {
    return (nextx < pdl->x + 8 && pdl->x < nextx + 8) &&
    (nexty < pdl->y + (padheight * 8) && pdl->y < nexty + 8);
}

INT8 get_bounce_off_dir_y(Paddle * pad) {
    // Recalculate vertical direction after collision with paddle
    UINT8 ballcentery = ball.y + 4;
    if(ballcentery < pad->y + padsectors[0]) { // < 25%
        return -4;
    } else if(ballcentery < pad->y + padsectors[1]) { // < 50%
        return -2;
    } else if(ballcentery == pad->y + padsectors[1]) { // == 50%
        return 0;
    } else if(ballcentery > pad->y + padsectors[2]) { // > 75%
        return 4;
    } else if(ballcentery > pad->y + padsectors[1]) { // > 50%
        return 2;
    }
    return ball.speedy; // Just getting rid of a compiler warning
}

void move_ball(Paddle * ppl1, Paddle * pcpu) {
    UINT8 nextballposx = ball.x + ball.speedx;
    UINT8 nextballposy = ball.y + ball.speedy;
    if(hits_walls(nextballposy, 8)) {
        ball.speedy *= -1;
    }
    if(hits_paddle(nextballposx, nextballposy, ppl1)) {
        ball.speedx *= -1;
        ball.speedy = get_bounce_off_dir_y(ppl1);
    } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
        ball.speedx *= -1;
        ball.speedy = get_bounce_off_dir_y(pcpu);
    }
    ball.x += ball.speedx;
    ball.y += ball.speedy;
    scroll_sprite(0, ball.speedx, ball.speedy);
}

void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {

    //Initialize paddle with first tile number and x/y coordinates
    pdl->x = posx;
    pdl->y = posy;
    pdl->firsttile = firsttilenum;

    if(padheight - 1 == 0) { // Paddle is made of 1 tile only
        set_sprite_tile(firsttilenum, 1);
        move_sprite(firsttilenum, posx, posy);
        return;
    }
    set_sprite_tile(firsttilenum, 2);
    move_sprite(firsttilenum, posx, posy);

    tileind = firsttilenum + 1;
    itr = 1;
    while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
        set_sprite_tile(tileind, 3);
        move_sprite(tileind, posx, posy + itr * 8);
        tileind++;
        itr++;
    }

    set_sprite_tile(tileind, 2);
    set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
    move_sprite(tileind, posx, posy + (padheight - 1) * 8);
    
}

void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp) {
        for(itr = 0; itr != padheight; itr++) {
            scroll_sprite(pdl->firsttile + itr, 0, pdlsp);
        }
}

void move_paddle(Paddle * pdl, INT8 pdlspd) {
    UINT8 nextpdly = pdl->y + pdlspd;
    if(!hits_walls(nextpdly, padheight * 8)) {
        scroll_paddle_tiles(pdl, pdlspd);
        pdl->y += pdlspd;
    } else if(pdl->y > bkgborderup || pdl->y + padheight * 8 < bkgborderdown) {
        // Adjustment for different scroll speeds when paddle is near the edge of the field
        INT8 adjspd = pdlspd < 0 ? bkgborderup - pdl->y : bkgborderdown - (pdl->y + padheight * 8);
        scroll_paddle_tiles(pdl, adjspd);
        pdl->y += adjspd;
    }
}

void action_cpu() {
    if(ball.x > difficulty_px[difficulty]) { // Determine when the cpu will react to the ball's position
        move_paddle(&pdlcpu, pdlcpu.y < ball.y ? padspeed : -padspeed);
    }
}


void auto_speed_adj() {
    if(chspeedflgdir == -ball.speedx) {
        // Changing speed after hitting paddle only (for max player/cpu reaction time)
        paddlehitscnt++;
        chspeedflgdir = ball.speedx; // New ball horizontal direction
        if(speedind != 3 && paddlehitscnt == speedchframes[speedind]) {
            speedind++; // Checking for next speed threshold
            ballmvframe--; // Speed up
            framecnt--; // Preventing overflow when calculating next framecnt
        }
    }
}


void init_game() {
    set_bkg_data(0, 7, pongbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, ponggamemap);

    set_sprite_data(0, 5, pongspritetiles);
    set_sprite_tile(0, 4);
    ball.x = ball.y = startballposxy;
    move_sprite(0, ball.x, ball.y); // Move ball to the middle of the playing field

    // Calculating the initial paddle y position based on the given paddle height
    // using screen height, paddle height in px and adding the y axis offset
    padinity = 16 + (144 - (padheight * 8)) / 2;
    init_paddle(&pdlpl1, 2, 16, padinity);
    init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
    set_pad_sectors();

    move_sprite(1, 24, 80);
    pl1score = cpuscore = 0;
    roundcnt = 1;
    framecnt  = 0;
    if(autospeedflg) {
        speedind = 0;
        paddlehitscnt = 0;
        ballmvframe = 4;
    }
}

void prep_next_round() {
    // Recenter ball
    ball.x = ball.y = startballposxy;
    move_sprite(0, ball.x, ball.y);

    // Recenter paddles
    scroll_paddle_tiles(&pdlpl1, padinity - pdlpl1.y);
    scroll_paddle_tiles(&pdlcpu, padinity - pdlcpu.y);
    pdlpl1.y = pdlcpu.y = padinity;
    roundcnt++;
    framecnt  = 0;

    // Resetting the ball speed when set to auto
    if(autospeedflg) {
        speedind = 1;
        ballmvframe = 3;
        paddlehitscnt = speedchframes[0];
    }
}

void begin_round() {

    while(1) {  // Start round or return to titlescreen
        initrand(DIV_REG);
        if(joypad() & J_START) {
            break;
        } else if(joypad() & J_SELECT) {
                exitgameflg = 1;
                return;
        }
    }

    randindx = rand() % 2; // Random number between 0 and 1
    initrand(DIV_REG);
    randindy = rand() % 5; // Random number between 0 and 4
    ball.speedx = stspeedpoolx[randindx];
    ball.speedy = stspeedpooly[randindy];
    chspeedflgdir = ball.speedx;

    while(1) {
        if(autospeedflg) {
            auto_speed_adj();
        }

        framecnt += framecnt != ballmvframe ? 1 : -ballmvframe + 1; // Resetting the frame counter

        switch(joypad()) {
            case J_UP:
                move_paddle(&pdlpl1, -padspeed);
                break;
            case J_DOWN:
                move_paddle(&pdlpl1, padspeed);
                break;
        }

        if(framecnt == ballmvframe) {
            move_ball(&pdlpl1, &pdlcpu);
        }

        action_cpu();
        if(is_round_over()) {
            if(ball.x < startballposxy) { // Compare to the middle of the field x
                pl1score++;
            } else {
                cpuscore++;
            }
            break;
        }
        wait_vbl_done();
    }
}

UBYTE is_round_over() {
    return ball.x + 8 < pdlpl1.x - 8 || ball.x > pdlcpu.x + 16;
}


void default_settings() {
    // Most balanced starting settings imho
    autospeedflg = 1;
    roundlimit = 25;
    difficulty = 1;
    padheight = 3;
    padspeed = 3;
}

void start_game() {
    
    exitgameflg = 0;
    init_game();
    while(1) {
        begin_round();
        if(exitgameflg || roundcnt == roundlimit) {
            break;
        }
        prep_next_round();
    }
}

void main() {

    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    default_settings();
    start_game();

}