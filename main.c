#include <gb/gb.h>
#include <rand.h>
#include "speedpbkgtiles.c"
#include "speedpgameMap.c"
#include "speedpspritetiles.c"
#include "paddle.c"
#include "ball.c"
#include "speedpfonttiles.c"
#include "speedptitlescreenmap.c"
#include "speedpcointiles.c"
#include "speedpoptionsscreen.c"
#include "speedptitlelogo.c"
#include "speedpcuptiles.c"
#include "speedpcupmap.c"



const UINT8 startballposxy = 84;
const UINT8 blanktile = 0x00;
UINT8 framecnt;
UINT8 ballmvframe; // controlls the ball's speed, 4 for auto
UINT8 padheight;
UINT8 padspeed; // Slug is 1, Slow is 2, normal is 3, fast is 4
UINT8 padsectors[3]; // Holds px values for 25%, 50% and 75% of paddle height
UINT8 padinity;
Paddle pdlpl1;
Paddle pdlcpu;
Ball ball;
UINT8 tileind;
UINT8 difficulty; // 0 - easy, 1 - normal, 2 - hard
UINT8 i, j, k, randindx, randindy, fontind; // used in loops
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
UINT8 roundlimit, roundcnt, rounddisploffset;
UINT8 cointile;
INT8 cointileincr;
const UINT8 coinspinframe = 5, plnamecursframe = 5;
unsigned char hud[19] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1C, 0x21};
unsigned char rounddispl[9] = {0x1E, 0x1B, 0x21, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00};
unsigned char numtiles[3]; // Tiles for 3 digit numbers for reuse
const unsigned char presst[11] = {0x1C, 0x1E, 0x11, 0x1F, 0x1F, 0x00, 0x1F, 0x20, 0x0D, 0x1E, 0x20};
const UINT8 menuentriesx[10] = {42, 42, 18, 18, 18, 18, 18, 18, 18, 66};
const UINT8 menuentriesy[10] = {112, 128, 24, 40, 56, 72, 88, 104, 128, 144};
UINT8 crntmenuentry; // Tracks currently selected option in the menu
const unsigned char normoption[4] = {0x1A, 0x1B, 0x1E, 0x19};
const unsigned char easyoption[4] = {0x11, 0x0D, 0x1F, 0x25};
const unsigned char hardoption[4] = {0x14, 0x0D, 0x1E, 0x10};
const unsigned char autooption[4] = {0x0D, 0x21, 0x20, 0x1B};
const unsigned char slugoption[4] = {0x1F, 0x18, 0x21, 0x13};
const unsigned char slowoption[4] = {0x1F, 0x18, 0x1B, 0x23};
const unsigned char fastoption[4] = {0x12, 0x0D, 0x1F, 0x20};
const unsigned char * cpuoptions[3] = {easyoption, normoption, hardoption};
const unsigned char * padspoptions[4] = {slugoption, slowoption, normoption, fastoption};
const unsigned char * ballspoptions[5] = {autooption, slugoption, slowoption, normoption, fastoption};
UINT8 ballspoptind;
const unsigned char introcreated[7] = {0x0F, 0x1E, 0x11, 0x0D, 0x20, 0x11, 0x10};
const unsigned char introby[2] = {0x0E, 0x25};
const UINT8 intronamesprites[16] = {23, 27, 26, 31, 32, 13, 26, 32, 21, 26, 16, 27, 14, 30, 17, 34};
const unsigned char introyear[4] = {0x05, 0x03, 0x05, 0x04};
const unsigned char congrats[16] = {0x0F, 0x1B, 0x1A, 0x13, 0x1E, 0x0D, 0x20, 0x21, 0x18, 0x0D, 0x20, 0x15, 0x1B, 0x1A, 0x1F, 0x29};
const unsigned char toobad[7] = {0x20, 0x1B, 0x1B, 0x00, 0x0E, 0x0D, 0x10};
const unsigned char youwin[7] = {0x25, 0x1B, 0x21, 0x00, 0x23, 0x15, 0x1A};
const unsigned char youlose[8] = {0x25, 0x1B, 0x21, 0x00, 0x18, 0x1B, 0x1F, 0x11};
const unsigned char cpuname[3] = {0x0F, 0x1C, 0x21};
unsigned char plname[3] = {0x1C, 0x18, 0x04};
UINT8 plnameind, plnameflashval;



void set_game_font();
void set_playfield_bkg();
void default_settings();
void custom_delay(UINT16 cycles);
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
void ltrim_blank_num_tiles();
void upd_round_tiles();
void upd_score_tiles();
void display_round_num();
void erase_round_num();
void update_hud();
void increment_score();
void init_game();
void prep_next_round();
UBYTE is_round_over();
void incr_frame_counter(UINT8 framelimit);
void begin_round();
void start_game();
void intro_screen();
void animate_coin_spin();
void move_coin_cursor(INT8 direction, UINT8 fstmenuind, UINT8 lastmenuind);
void main_menu();
void options_menu();
void change_property(INT8 units, UINT8 menuentry);
void display_all_opts_values();
void change_player_name();
void change_letter_in_name(INT8 step, UINT8 limit);
void move_to_next_letter(INT8 step, UINT8 limit);
void change_cpu(INT8 units);
void change_num_rounds(INT8 units);
void change_pad_height(INT8 units);
void change_pad_speed(INT8 units);
void change_ball_speed(INT8 units);
void reset_to_default();
void fade_to_black();
void fade_from_black();
void clear_sprite_tiles();
void results_sequence();
void pl_score_sound();
void cpu_score_sound();
void paddle_hit_sound();
void wall_hit_sound();
void serve_ball_sound();
void move_menu_sound();
void choose_menu_sound();
void change_prop_sound();


void set_game_font() {
    set_bkg_data(0, 42, speedpfonttiles);
}


void set_playfield_bkg() {
    set_bkg_data(42, 6, speedpbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, speedpgamemap);
}


void default_settings() {
    // Most balanced starting settings imho
    autospeedflg = 1;
    ballspoptind = 0;
    roundlimit = 10;
    difficulty = 1;
    padheight = 3;
    padspeed = 3;
}


void custom_delay(UINT16 cycles) {
    for(i = 0; i < cycles; i++) {
        wait_vbl_done();
    }
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
        wall_hit_sound();
    }
    if(hits_paddle(nextballposx, nextballposy, ppl1)) {
        ball.speedx *= -1;
        ball.speedy = get_bounce_off_dir_y(ppl1);
        paddle_hit_sound();
    } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
        ball.speedx *= -1;
        ball.speedy = get_bounce_off_dir_y(pcpu);
        paddle_hit_sound();
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
    set_sprite_prop(firsttilenum, 0x00); // Making sure a flipped tile glitch doesn't occur after changing paddle height

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


void ltrim_blank_num_tiles() { // Shifts values so that the blanks go to the back of the array
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
    ltrim_blank_num_tiles();
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
    ltrim_blank_num_tiles();
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
    fill_bkg_rect(7 - rounddisploffset, 5, 9, 1, blanktile);
    fill_bkg_rect(5, 12, 11, 1, blanktile);
}


void update_hud() {
    set_win_tiles(0, 0, 19, 1, hud);
    move_win(12, 134);
}


void increment_score() {
    if(ball.speedx < 0) { // Check the direction of the ball
        cpuscore++;
        cpu_score_sound();
    } else {
        pl1score++;
        pl_score_sound();
    }
}


void init_game() {
    set_playfield_bkg();
    set_sprite_data(0, 5, speedpspritetiles);
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
    for(k = 0; k < 3; k++) { // Display player name
        hud[k] = plname[k];
    }
    upd_score_tiles();
    upd_round_tiles();
    update_hud();
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


void incr_frame_counter(UINT8 framelimit) {
    if(framecnt == framelimit) {
        framecnt = 1; // Resetting the frame counter
    } else {
        framecnt++;
    }
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
    serve_ball_sound();

    while(1) {
        if(autospeedflg) {
            auto_speed_adj();
        }
        incr_frame_counter(ballmvframe);

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
            update_hud();
            break;
        }
        wait_vbl_done();
    }
}


void start_game() {
    exitgameflg = 0;
    init_game();
    SHOW_WIN;
    fade_from_black();
    while(1) {
        begin_round();
        if(exitgameflg || roundcnt == roundlimit) {
            break;
        }
        prep_next_round();
    }
    fade_to_black();
    HIDE_WIN; // Remove HUD before going back to the main menu
    clear_sprite_tiles();
}


void intro_screen() {
    fill_bkg_rect(0, 0, 20, 18, blanktile);
    set_bkg_tiles(6, 3, 7, 1, introcreated);
    set_bkg_tiles(9, 5, 2, 1, introby);
    set_sprite_data(0, 36, speedpfonttiles);
    move_sprite(0, 168, 80);

    for(i = 0; i < 16; i++) {
        set_sprite_tile(i, intronamesprites[i]);
        set_sprite_prop(i, 0x20);
        if(i < 10) {
            move_sprite(i, 168, 80);
            j = i + 5;
        } else {
            move_sprite(i, 168, 96);
            j = i - 3;
        }

        while(j < 20) {
            scroll_sprite(i, -8, 0);
            wait_vbl_done();
            j++;
        }
    }
    for(k = 0; k < 16; k++) {
        set_sprite_prop(k, 0x00);
        custom_delay(4);
    }

    custom_delay(20);
    set_bkg_tiles(8, 14, 4, 1, introyear);
    custom_delay(60);
    fade_to_black();
    clear_sprite_tiles();
}


void animate_coin_spin() {
    if(framecnt == coinspinframe) {
        cointile += cointileincr;
        set_sprite_tile(0, cointile);
        if(cointile == 4) {
            cointileincr = -1;
        } else if(cointile == 1 && cointileincr == -1) {
            cointileincr = 1;
        }
    }
}


void move_coin_cursor(INT8 direction, UINT8 fstmenuind, UINT8 lastmenuind) {
    if(crntmenuentry == lastmenuind && direction == 1) {
        crntmenuentry = fstmenuind;
    } else if(crntmenuentry == fstmenuind && direction == -1) {
        crntmenuentry = lastmenuind;
    } else {
        crntmenuentry += direction;
    }
    move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
    move_menu_sound();
    custom_delay(9);
}


void main_menu() {
    set_bkg_data(42, 51, speedptitlelogo);
    set_bkg_tiles(0, 0, 20, 18, speedptitlescreenmap);
    set_sprite_data(0, 5, speedpcointiles);
    move_sprite(0, menuentriesx[0], menuentriesy[0]);
    crntmenuentry = 0;
    fade_from_black();

    while(1) {
        incr_frame_counter(coinspinframe);
        animate_coin_spin();
        switch(joypad()) {
            case(J_UP):
                move_coin_cursor(-1, 0, 1);
                break;
            case(J_DOWN):
                move_coin_cursor(1, 0, 1);
                break;
        }
        if(joypad() & J_START) {
            choose_menu_sound();
            fade_to_black();
            break; // End function execution and check selected entry
        }
        wait_vbl_done();
    }
}


void options_menu() {
    set_bkg_tiles(0, 0, 20, 18, speedpoptionsscreen);
    display_all_opts_values();
    crntmenuentry = 2;
    move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
    fade_from_black();

    while(1) {
        incr_frame_counter(coinspinframe);
        animate_coin_spin();

        switch(joypad()) {
            case J_UP:
                move_coin_cursor(-1, 2, 9);
                break;
            case J_DOWN:
                move_coin_cursor(1, 2, 9);
                break;
            case J_LEFT:
                change_property(-1, crntmenuentry);
                break;
            case J_RIGHT:
                change_property(1, crntmenuentry);
                break;
            case J_A:
                if(crntmenuentry == 4) {
                    change_property(10, crntmenuentry);
                }
                break;
            case J_B:
                if(crntmenuentry == 4) {
                    change_property(-10, crntmenuentry);
                }
                break;
        }
        if(joypad() & (J_START | J_A)) {
            if(crntmenuentry == 2) {
                custom_delay(9);
                choose_menu_sound();
                change_player_name();
            }
            else if(crntmenuentry == 8) {
                reset_to_default();
                change_prop_sound();
            } else if(crntmenuentry == 9) {
                choose_menu_sound();
                custom_delay(9);
                break; // Back to main menu
            }
        }
        wait_vbl_done();
    }
    fade_to_black();
}


void change_property(INT8 units, UINT8 menuentry) {
    switch(menuentry) {
        case 3:
            change_cpu(units);
            break;
        case 4:
            change_num_rounds(units);
            break;
        case 5:
            change_pad_height(units);
            break;
        case 6:
            change_pad_speed(units);
            break;
        case 7:
            change_ball_speed(units);
            break;
    }
    change_prop_sound();
    custom_delay(6);
}


void display_all_opts_values() {
    set_bkg_tiles(15, 1, 3, 1, plname);
    set_bkg_tiles(15, 3, 4, 1, cpuoptions[difficulty]);
    upd_number_tiles_arr(roundlimit);
    ltrim_blank_num_tiles();
    set_bkg_tiles(15, 5, 3, 1, numtiles);
    upd_number_tiles_arr(padheight);
    ltrim_blank_num_tiles();
    set_bkg_tiles(15, 7, 3, 1, numtiles);
    set_bkg_tiles(15, 9, 4, 1, padspoptions[padspeed - 1]);
    set_bkg_tiles(15, 11, 4, 1, ballspoptions[ballspoptind]);
}


void change_player_name() {
    HIDE_SPRITES;
    plnameind = 0;
    UINT8 coinframecntprev = framecnt; // Saving current frame count
    framecnt = 0;
    plnameflashval = 0x02;
    fontind = plname[0];
    while(1) {
        incr_frame_counter(plnamecursframe);
        if(framecnt == plnamecursframe) {
            plnameflashval = plnameflashval == 0x02 ? plname[plnameind] : 0x02;
            set_bkg_tile_xy(15 + plnameind, 1, plnameflashval);
        }
        switch(joypad()) {
            case J_UP:
                change_letter_in_name(-1, 3);
                break;
            case J_DOWN:
                change_letter_in_name(1, 38);
                break;
            case J_LEFT:
                move_to_next_letter(-1, 0);
                break;
            case J_RIGHT:
                move_to_next_letter(1, 2);
                break;
        }
        if(joypad() & (J_START | J_A)) {
            break;
        }
        custom_delay(6);
    }
    custom_delay(9);
    set_bkg_tiles(15, 1, 3, 1, plname);
    framecnt = coinframecntprev;
    choose_menu_sound();
    SHOW_SPRITES;
}


void change_letter_in_name(INT8 step, UINT8 limit) {
    fontind += fontind == limit ? 0 : step;
    plname[plnameind] = fontind;
    set_bkg_tile_xy(15 + plnameind, 1, plname[plnameind]);
    change_prop_sound();
}


void move_to_next_letter(INT8 step, UINT8 limit) {
    set_bkg_tile_xy(15 + plnameind, 1, plname[plnameind]);
    plnameind += plnameind == limit ? 0 : step;
    fontind = plname[plnameind];
    move_menu_sound();
}


void change_cpu(INT8 units) {
    if(difficulty + units >= 0 && difficulty + units < 3) {
        difficulty += units;
        set_bkg_tiles(15, 3, 4, 1, cpuoptions[difficulty]);
    }
}


void change_num_rounds(INT8 units) {
    if(roundlimit + units > 0 && roundlimit + units <= 255) {
        roundlimit += units;
        upd_number_tiles_arr(roundlimit);
        ltrim_blank_num_tiles();
        set_bkg_tiles(15, 5, 3, 1, numtiles);
    }
}


void change_pad_height(INT8 units) {
    if(padheight + units > 0 && padheight + units < 9) {
        padheight += units;
        upd_number_tiles_arr(padheight);
        ltrim_blank_num_tiles();
        set_bkg_tiles(15, 7, 3, 1, numtiles);
    }
}


void change_pad_speed(INT8 units) {
    if(padspeed + units > 0 && padspeed + units < 5) {
        padspeed += units;
        set_bkg_tiles(15, 9, 4, 1, padspoptions[padspeed - 1]);
    }
}


void change_ball_speed(INT8 units) {
    if(ballspoptind + units >= 0 && ballspoptind + units < 5) {
        ballspoptind += units;
        if(ballspoptind == 0) {
            autospeedflg = 1;
            set_bkg_tiles(15, 11, 4, 1, ballspoptions[0]);
        } else {
            autospeedflg = 0;
            ballmvframe = 5 - ballspoptind;
            set_bkg_tiles(15, 11, 4, 1, ballspoptions[ballspoptind]);
        }
    }
}


void reset_to_default() {
    default_settings();
    display_all_opts_values();
    custom_delay(9);
}


void fade_to_black() {
    custom_delay(6);
    for(k = 0; k < 3; k++) {
        switch(k) {
            case 0:
                BGP_REG = 0xF9;
                break;
            case 1:
                BGP_REG = 0xFE;
                break;
            case 2:
                HIDE_SPRITES;
                BGP_REG = 0xFF;
                break;
        }
        custom_delay(6);
    }
}


void fade_from_black() {
    custom_delay(5);
    for(k = 0; k < 3; k++) {
        switch(k) {
            case 0:
                SHOW_SPRITES;
                BGP_REG = 0xFE;
                break;
            case 1:
                BGP_REG = 0xF9;
                break;
            case 2:
                BGP_REG = 0xE4;
                break;
        }
        custom_delay(5);
    }
}


void clear_sprite_tiles() { // Reset sprite memory
    for(i = 0; i < 40; i++) {
            set_sprite_tile(i, blanktile);
        }
}



void results_sequence() {
    fill_bkg_rect(0, 0 , 20, 18, blanktile);
    set_game_font();
    set_bkg_data(42, 48, speedpcuptiles);
    set_bkg_tiles(7, 4, 7, 11, speedpcupmap);

    if(pl1score > cpuscore) {
        set_bkg_tiles(2, 2, 16, 1, congrats);
        set_bkg_tiles(7, 16, 7, 1, youwin);
        set_bkg_tiles(9, 13, 3, 1, plname);
    } else {
        set_bkg_tiles(7, 2, 7, 1, toobad);
        set_bkg_tiles(6, 16, 8, 1, youlose);
        set_bkg_tiles(9, 13, 3, 1, cpuname);
    }

    fade_from_black();
    waitpad(J_START);
    fade_to_black();
}


void pl_score_sound() {
    NR10_REG = 0x26;
    NR11_REG = 0x80;
    NR12_REG = 0x67;
    NR13_REG = 0xF4;
    NR14_REG = 0x81;
}


void cpu_score_sound() {
    NR10_REG = 0x1D;
    NR11_REG = 0x80;
    NR12_REG = 0x67;
    NR13_REG = 0x40;
    NR14_REG = 0x86;
}


void paddle_hit_sound() {
    NR41_REG = 0x00;
    NR42_REG = 0x72;
    NR43_REG = 0x61;
    NR44_REG = 0xC0;
}


void wall_hit_sound() {
    NR10_REG = 0x08;
    NR11_REG = 0x80;
    NR12_REG = 0x26;
    NR13_REG = 0x08;
    NR14_REG = 0x87;
}


void serve_ball_sound() {
    NR41_REG = 0x01;
    NR42_REG = 0x94;
    NR43_REG = 0x71;
    NR44_REG = 0x80;
}


void move_menu_sound() {
    NR21_REG = 0xC1;
    NR22_REG = 0x83;
    NR23_REG = 0xA4;
    NR24_REG = 0x86;
}


void choose_menu_sound() {
    NR10_REG = 0x26;
    NR11_REG = 0x80;
    NR12_REG = 0x62;
    NR13_REG = 0x6F;
    NR14_REG = 0x86;
}


void change_prop_sound() {
    NR21_REG = 0xC1;
    NR22_REG = 0x83;
    NR23_REG = 0x3A;
    NR24_REG = 0x87;
}


void main() {
    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    NR52_REG = 0x80; // Sound on
    NR51_REG = 0xFF; // All channels
    NR50_REG = 0x77; // Max level, left and right

    set_game_font();
    intro_screen();
    default_settings();

    while(1) {
        cointile = 0;
        cointileincr = 1;
        framecnt = 0;
        main_menu();
        switch(crntmenuentry) {
            case 0:
                start_game();
                if(!exitgameflg && (pl1score != cpuscore)) {
                    results_sequence();
                }
                break;
            case 1:
                options_menu();
                break;
        }
    }
}
