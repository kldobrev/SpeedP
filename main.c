#include <gb/gb.h>
#include "pongbkgtiles.c"
#include "ponggameMap.c"
#include "pongspritetiles.c"
#include "paddle.c"

INT8 ballspeedx = 4;
INT8 ballspeedy = 4;
UINT8 ballposx = 84;
UINT8 ballposy = 84;
UINT8 framecnt = 0;
UINT8 ballmvframe = 1; // controlls the ball's speed
UINT8 padheight = 3; // actual height - 1 for ease of calculation
UINT8 tileind = 0;
UINT8 itr; // simple iterator for loops

const UINT8 bkgborderup = 32;
const UINT8 bkgborderdown = 144;

UBYTE collides_with_walls(UINT8 nexty) {
    return nexty < bkgborderup || nexty + 8 > bkgborderdown;
}

void move_ball() {
    UINT8 nextballposx = ballposx + ballspeedx;
    UINT8 nextballposy = ballposy + ballspeedy;
    if(collides_with_walls(nextballposy)) {
        ballspeedy *= -1; // Bounce off wall
    }
    ballposx = nextballposx;
    ballposy += ballspeedy;
    scroll_sprite(0, ballspeedx, ballspeedy);
}

void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {

    //Initialize paddle with first tile number and x/y coordinates
    pdl->x = posx;
    pdl->y = posy;
    pdl->firsttile = firsttilenum;

    if(padheight == 0) { // Paddle is made of 1 tile only
        set_sprite_tile(firsttilenum, 1);
        move_sprite(firsttilenum, posx, posy);
        return;
    }
    set_sprite_tile(firsttilenum, 2);
    move_sprite(firsttilenum, posx, posy);

    tileind = firsttilenum + 1;
    itr = 1;
    while(tileind != firsttilenum + padheight) { // Config tiles between the first and the last
        set_sprite_tile(tileind, 3);
        move_sprite(tileind, posx, posy + itr * 8);
        tileind++;
        itr++;
    }

    set_sprite_tile(tileind, 2);
    set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
    move_sprite(tileind, posx, posy + padheight * 8);
    
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

    set_bkg_data(0, 7, pongbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, ponggamemap);

    set_sprite_data(0, 5, pongspritetiles);
    set_sprite_tile(0, 4);
    move_sprite(0, ballposx, ballposy); // Move ball to the middle of the playing field

    Paddle pdlpl1;
    Paddle pdlcpu;
    padheight = 2; // Actual size on screen is 3
    init_paddle(&pdlpl1, 2, 24, 80);
    init_paddle(&pdlcpu, pdlpl1.firsttile + padheight + 1, 144, 80);

    move_sprite(1, 24, 80);

    while(1) {
        framecnt += framecnt != ballmvframe ? 1 : -ballmvframe + 1; // Resetting the frame counter

        if(framecnt == ballmvframe) {
            move_ball();
        }

        wait_vbl_done();
    }

}