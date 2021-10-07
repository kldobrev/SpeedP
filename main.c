#include <gb/gb.h>
#include "pongbkgtiles.c"
#include "ponggameMap.c"
#include "pongspritetiles.c"
#include "paddle.c"
#include <rand.h>


INT8 ballspeedx;
INT8 ballspeedy;
UINT8 ballposx = 84;
UINT8 ballposy = 84;
UINT8 framecnt = 0;
UINT8 ballmvframe = 2; // controlls the ball's speed
UINT8 padheight = 4;
UINT8 padspeed = 3; // Slow is 2, normal is 3, fast is 4
UINT8 padsectors[3]; // Holds px values for 25%, 50% and 75% of paddle height
Paddle pdlpl1;
Paddle pdlcpu;
UINT8 tileind = 0;
UINT8 difficulty = 0; // 0 - easy, 1 - normal, 2 - hard
UINT8 itr, randindx, randindy; // used in loops
const UINT8 difficulty_px[3] = {84, 42, 8};
const INT8 stspeedpoolx[2] = {-4, 4};
const INT8 stspeedpooly[5] = {-4, -2, 0, 2, 4};
const UINT8 bkgborderup = 32;
const UINT8 bkgborderdown = 144;


void set_pad_sectors();
void move_ball(Paddle * ppl1, Paddle * pcpu);
void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy);
void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp);
void move_paddle(Paddle * pdl, INT8 pdlsp);
void auto_speed_adj();
void manual_speed_adj();
void init_playfield();
void begin_round();
UBYTE hits_walls(UINT8 nexty, UINT8 objheight);
UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl);
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
    UINT8 ballcentery = ballposy + 4;
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
    return ballspeedy; // Just getting rid of a compiler warning
}

void move_ball(Paddle * ppl1, Paddle * pcpu) {
    UINT8 nextballposx = ballposx + ballspeedx;
    UINT8 nextballposy = ballposy + ballspeedy;
    if(hits_walls(nextballposy, 8)) {
        ballspeedy *= -1;
    }
    if(hits_paddle(nextballposx, nextballposy, ppl1)) {
        ballspeedx *= -1;
        ballspeedy = get_bounce_off_dir_y(ppl1);
    } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
        ballspeedx *= -1;
        ballspeedy = get_bounce_off_dir_y(pcpu);
    }
    ballposx += ballspeedx;
    ballposy += ballspeedy;
    scroll_sprite(0, ballspeedx, ballspeedy);
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
        UINT8 adjspd = pdlspd < 0 ? bkgborderup - pdl->y : bkgborderdown - (pdl->y + padheight * 8);
        scroll_paddle_tiles(pdl, adjspd);
        pdl->y += adjspd;
    }
}

void action_cpu() {
    if(ballposx > difficulty_px[difficulty]) { // Determine when the cpu will react to the ball's position
        move_paddle(&pdlcpu, pdlcpu.y < ballposy ? padspeed : -padspeed);
    }
}

void init_playfield() {
    set_bkg_data(0, 7, pongbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, ponggamemap);

    set_sprite_data(0, 5, pongspritetiles);
    set_sprite_tile(0, 4);
    move_sprite(0, ballposx, ballposy); // Move ball to the middle of the playing field

    // Calculating the initial paddle y position based on the given paddle height
    // using screen height, paddle height in px and adding the y axis offset
    UINT8 padinity = 16 + (144 - (padheight * 8)) / 2;
    init_paddle(&pdlpl1, 2, 16, padinity);
    init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
    set_pad_sectors();

    move_sprite(1, 24, 80);
}

void begin_round() {

    while(1) {  // When called regularly, initrand always returns the same values, idk why
        initrand(DIV_REG);
        if(joypad() & J_START) {
            break;
        }
    }

    randindx = rand() % 2; // Random number between 0 and 1
    initrand(DIV_REG);
    randindy = rand() % 5; // Random number between 0 and 4
    ballspeedx = stspeedpoolx[randindx];
    ballspeedy = stspeedpooly[randindy];

    while(1) {
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

        wait_vbl_done();
    }
}

void auto_speed_adj() {
    // TO-DO: Implement
}

void manual_speed_adj() {
    // TO-DO: Implement
}

void main() {

    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    init_playfield();
    begin_round();



}