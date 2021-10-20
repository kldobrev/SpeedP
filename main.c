#include <gb/gb.h>
#include <rand.h>
#include "pongbkgtiles.c"
#include "ponggameMap.c"
#include "pongspritetiles.c"
#include "paddle.c"
#include "ball.c"
#include "pongfonttiles.c"



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
UINT8 i, j, randindx, randindy; // used in loops
UINT8 pl1score, cpuscore;
const UINT8 difficulty_px[3] = {130, 110, 84};
const INT8 stspeedpoolx[2] = {-4, 4};
const INT8 stspeedpooly[5] = {-4, -2, 0, 2, 4};
const UINT8 bkgborderup = 32;
const UINT8 bkgborderdown = 144;
UBYTE exitgameflg;
UBYTE autospeedflg;  // Default: on
INT8 chspeedflgdir; // For autospeed mode; holds current ball x direction
UINT8 paddlehitscnt;
const UINT8 speedchframes[3] = {6, 12, 42}; // Number of paddles hit before speed increase in auto mode
UINT8 speedind;
UINT8 roundlimit;
UINT8 roundcnt;
UINT8 rounddisploffset;
unsigned char hud[19] = {0x1C, 0x18, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1C, 0x21};
unsigned char rounddispl[9] = {0x1E, 0x1B, 0x21, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00};
unsigned char numtiles[3]; // Tiles for 3 digit numbers for reuse
const unsigned char presst[11] = {0x1C, 0x1E, 0x11, 0x1F, 0x1F, 0x00, 0x1F, 0x20, 0x0D, 0x1E, 0x20};


void set_playfield_bkg();
void default_settings();
void center_ball();
void move_ball(Paddle * ppl1, Paddle * pcpu);
UBYTE hits_walls(UINT8 nexty, UINT8 objheight);
void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy);
void set_pad_sectors();
void move_paddle(Paddle * pdl, INT8 pdlsp);
void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp);
void action_cpu();
UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl);
INT8 get_bounce_off_dir_y(Paddle * pad);
void auto_speed_adj();
void upd_number_tiles_arr(UINT8 num);
void trim_blank_num_tiles();
void upd_round_tiles();
void upd_score_tiles();
void display_round_num();
void erase_round_num();
void upd_hud();
void increment_score();
void init_game();
void prep_next_round();
UBYTE is_round_over();
void begin_round();
void start_game();



void set_playfield_bkg() {
    set_bkg_data(0, 41, pongfonttiles);
    set_bkg_data(41, 7, pongbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, ponggamemap);
}


void default_settings() {
    // Most balanced starting settings imho
    autospeedflg = 1;
    roundlimit = 10;
    difficulty = 1;
    padheight = 3;
    padspeed = 3;
}


void center_ball() {
    ball.x = ball.y = startballposxy;
    move_sprite(0, ball.x, ball.y);
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


UBYTE hits_walls(UINT8 nexty, UINT8 objheight) {
    return nexty < bkgborderup || nexty + objheight > bkgborderdown;
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
    i = 1;
    while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
        set_sprite_tile(tileind, 3);
        move_sprite(tileind, posx, posy + i * 8);
        tileind++;
        i++;
    }

    set_sprite_tile(tileind, 2);
    set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
    move_sprite(tileind, posx, posy + (padheight - 1) * 8);
    
}


void set_pad_sectors() {
    // Dividing the paddle height into 4 equal sectors
    // and setting the borders between them
    padsectors[0] = padheight * 2; // 25%
    padsectors[1] = padheight * 4; // 50%
    padsectors[2] = padheight * 6; // 75%
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


void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp) {
        for(i = 0; i != padheight; i++) {
            scroll_sprite(pdl->firsttile + i, 0, pdlsp);
        }
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


void upd_number_tiles_arr(UINT8 num) { // Updates numtiles array for displaying purposes
    numtiles[0] = num / 100 == 0 ? 0 : (num / 100) + 3; // blank if num < 100
    numtiles[1] = numtiles[0] == 0 && num / 10 % 10 == 0 ? 0 : (num / 10 % 10) + 3; // blank if num < 10
    numtiles[2] = num % 10 + 3;
}


void trim_blank_num_tiles() { // Shifts values so that the blanks go to the back of the array
    if(numtiles[0] == 0) {
        i = 1;
        while(numtiles[i] == 0) {
            i++;
        }
        for(j = 0; i < 3; i++, j++) {
            numtiles[j] = numtiles[i];
            numtiles[i] = 0;
        }
    }
}


void upd_round_tiles() {
    upd_number_tiles_arr(roundcnt);
    trim_blank_num_tiles();
    rounddispl[6] = numtiles[0];
    rounddispl[7] = numtiles[1];
    rounddispl[8] = numtiles[2];
}


void upd_score_tiles() {
    upd_number_tiles_arr(pl1score);
    hud[6] = numtiles[0];
    hud[7] = numtiles[1];
    hud[8] = numtiles[2];

    upd_number_tiles_arr(cpuscore);
    trim_blank_num_tiles();
    hud[10] = numtiles[0];
    hud[11] = numtiles[1];
    hud[12] = numtiles[2];
}


void display_round_num() {
    rounddisploffset = roundcnt < 10 ? 0 : 1;
    set_bkg_tiles(7 - rounddisploffset, 5, 9, 1, rounddispl);
    set_bkg_tiles(5, 12, 11, 1, presst);
}


void erase_round_num() {
    fill_bkg_rect(7 - rounddisploffset, 5, 9, 1, 0x00);
    fill_bkg_rect(5, 12, 11, 1, 0x00);
}


void upd_hud() {
    set_win_tiles(0, 0, 19, 1, hud);
    move_win(12, 134);
}


void increment_score() {
    if(ball.speedx < 0) { // Check the direction of the ball
        cpuscore++;
    } else {
        pl1score++;
    }
}


void init_game() {
    set_playfield_bkg();
    upd_hud();

    set_sprite_data(0, 5, pongspritetiles);
    set_sprite_tile(0, 4);  // Ball sprite tile
    center_ball();

    // Calculating the initial paddle y position based on the given paddle height
    // using screen height, paddle height in px and adding the y axis offset
    padinity = 16 + (144 - (padheight * 8)) / 2;
    init_paddle(&pdlpl1, 1, 16, padinity);
    init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
    set_pad_sectors();

    pl1score = cpuscore = 0;
    roundcnt = 1;
    framecnt  = 0;
    upd_score_tiles();
    upd_round_tiles();
    if(autospeedflg) {
        speedind = 0;
        paddlehitscnt = 0;
        ballmvframe = 4;
    }
}


void prep_next_round() {

    // Recenter paddles
    scroll_paddle_tiles(&pdlpl1, padinity - pdlpl1.y);
    scroll_paddle_tiles(&pdlcpu, padinity - pdlcpu.y);
    pdlpl1.y = pdlcpu.y = padinity;
    roundcnt++;
    upd_round_tiles();
    framecnt = 0;
    
    center_ball();

    // Resetting the ball speed when set to auto
    if(autospeedflg) {
        speedind = 1;
        ballmvframe = 3;
        paddlehitscnt = speedchframes[0];
    }
}


UBYTE is_round_over() {
    return ball.x + 8 < pdlpl1.x - 8 || ball.x > pdlcpu.x + 16;
}


void begin_round() {

    display_round_num();
    while(1) {  // Start round or return to titlescreen
        initrand(DIV_REG);
        if(joypad() & J_START) {
            erase_round_num();
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
            increment_score();
            upd_score_tiles();
            upd_hud();
            break;
        }
        wait_vbl_done();
    }
}


void start_game() {
    
    exitgameflg = 0;
    init_game();
    SHOW_WIN;
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
