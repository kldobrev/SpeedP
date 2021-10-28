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
UINT8 i, j, k, randindx, randindy; // used in loops
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
const UINT8 coinspinframe = 5;
unsigned char hud[19] = {0x1C, 0x18, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1C, 0x21};
unsigned char rounddispl[9] = {0x1E, 0x1B, 0x21, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00};
unsigned char numtiles[3]; // Tiles for 3 digit numbers for reuse
const unsigned char presst[11] = {0x1C, 0x1E, 0x11, 0x1F, 0x1F, 0x00, 0x1F, 0x20, 0x0D, 0x1E, 0x20};
const UINT8 menuentriesx[9] = {42, 42, 18, 18, 18, 18, 18, 18, 66};
const UINT8 menuentriesy[9] = {112, 128, 24, 40, 56, 72, 88, 128, 144};
UINT8 crntmenuentry; // Tracks currently selected option in the menu
const unsigned char norm_option[4] = {0x1A, 0x1B, 0x1E, 0x19};
const unsigned char easy_option[4] = {0x11, 0x0D, 0x1F, 0x25};
const unsigned char hard_option[4] = {0x14, 0x0D, 0x1E, 0x10};
const unsigned char auto_option[4] = {0x0D, 0x21, 0x20, 0x1B};
const unsigned char slug_option[4] = {0x1F, 0x18, 0x21, 0x13};
const unsigned char slow_option[4] = {0x1F, 0x18, 0x1B, 0x23};
const unsigned char fast_option[4] = {0x12, 0x0D, 0x1F, 0x20};
const unsigned char * cpu_options[3] = {easy_option, norm_option, hard_option};
const unsigned char * pad_sp_options[4] = {slug_option, slow_option, norm_option, fast_option};
const unsigned char * ball_sp_options[5] = {auto_option, slug_option, slow_option, norm_option, fast_option};
UINT8 ball_sp_opt_ind;
const unsigned char intro_created[7] = {0x0F, 0x1E, 0x11, 0x0D, 0x20, 0x11, 0x10};
const unsigned char intro_by[2] = {0x0E, 0x25};
const UINT8 intro_name_sprites[16] = {23, 27, 26, 31, 32, 13, 26, 32, 21, 26, 16, 27, 14, 30, 17, 34};
const unsigned char intro_year[4] = {0x05, 0x03, 0x05, 0x04};




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
void change_cpu(INT8 units);
void change_num_rounds(INT8 units);
void change_pad_height(INT8 units);
void change_pad_speed(INT8 units);
void change_ball_speed(INT8 units);
void reset_to_default();
void fade_to_black();
void fade_from_black();
void clear_sprite_tiles();


void set_game_font() {
    set_bkg_data(0, 41, speedpfonttiles);
}


void set_playfield_bkg() {
    set_bkg_data(41, 6, speedpbkgtiles);
    set_bkg_tiles(0, 0, 20, 18, speedpgamemap);
}


void default_settings() {
    // Most balanced starting settings imho
    autospeedflg = 1;
    ball_sp_opt_ind = 0;
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
    } else {
        pl1score++;
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
    set_bkg_tiles(6, 3, 7, 1, intro_created);
    set_bkg_tiles(9, 5, 2, 1, intro_by);
    set_sprite_data(0, 36, speedpfonttiles);
    move_sprite(0, 168, 80);

    for(i = 0; i < 16; i++) {
        set_sprite_tile(i, intro_name_sprites[i]);
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
    set_bkg_tiles(8, 14, 4, 1, intro_year);
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
    custom_delay(9);
}


void main_menu() {
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
                move_coin_cursor(-1, 2, 8);
                break;
            case J_DOWN:
                move_coin_cursor(1, 2, 8);
                break;
            case J_LEFT:
                change_property(-1, crntmenuentry);
                break;
            case J_RIGHT:
                change_property(1, crntmenuentry);
                break;
            case J_A:
                if(crntmenuentry == 3) {
                    change_property(10, crntmenuentry);
                }
                break;
            case J_B:
                if(crntmenuentry == 3) {
                    change_property(-10, crntmenuentry);
                }
                break;
        }
        if(joypad() & (J_START | J_A)) {
            if(crntmenuentry == 7) {
                reset_to_default();
            } else if(crntmenuentry == 8) {
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
        case 2:
            change_cpu(units);
            break;
        case 3:
            change_num_rounds(units);
            break;
        case 4:
            change_pad_height(units);
            break;
        case 5:
            change_pad_speed(units);
            break;
        case 6:
            change_ball_speed(units);
            break;
    }
    custom_delay(6);
}


void display_all_opts_values() {
    set_bkg_tiles(15, 1, 4, 1, cpu_options[difficulty]);
    upd_number_tiles_arr(roundlimit);
    ltrim_blank_num_tiles();
    set_bkg_tiles(15, 3, 3, 1, numtiles);
    upd_number_tiles_arr(padheight);
    ltrim_blank_num_tiles();
    set_bkg_tiles(15, 5, 3, 1, numtiles);
    set_bkg_tiles(15, 7, 4, 1, pad_sp_options[padspeed - 1]);
    set_bkg_tiles(15, 9, 4, 1, ball_sp_options[ball_sp_opt_ind]);
}


void change_cpu(INT8 units) {
    if(difficulty + units >= 0 && difficulty + units < 3) {
        difficulty += units;
        set_bkg_tiles(15, 1, 4, 1, cpu_options[difficulty]);
    }
}


void change_num_rounds(INT8 units) {
    if(roundlimit + units > 0 && roundlimit + units <= 255) {
        roundlimit += units;
        upd_number_tiles_arr(roundlimit);
        ltrim_blank_num_tiles();
        set_bkg_tiles(15, 3, 3, 1, numtiles);
    }
}


void change_pad_height(INT8 units) {
    if(padheight + units > 0 && padheight + units < 9) {
        padheight += units;
        upd_number_tiles_arr(padheight);
        ltrim_blank_num_tiles();
        set_bkg_tiles(15, 5, 3, 1, numtiles);
    }
}


void change_pad_speed(INT8 units) {
    if(padspeed + units > 0 && padspeed + units < 5) {
        padspeed += units;
        set_bkg_tiles(15, 7, 4, 1, pad_sp_options[padspeed - 1]);
    }
}


void change_ball_speed(INT8 units) {
    if(ball_sp_opt_ind + units >= 0 && ball_sp_opt_ind + units < 5) {
        ball_sp_opt_ind += units;
        if(ball_sp_opt_ind == 0) {
            autospeedflg = 1;
            set_bkg_tiles(15, 9, 4, 1, ball_sp_options[0]);
        } else {
            autospeedflg = 0;
            ballmvframe = 5 - ball_sp_opt_ind;
            set_bkg_tiles(15, 9, 4, 1, ball_sp_options[ball_sp_opt_ind]);
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
    custom_delay(6);
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
        custom_delay(6);
    }
}


void clear_sprite_tiles() { // Reset sprite memory
    for(i = 0; i < 40; i++) {
            set_sprite_tile(i, blanktile);
        }
}


void main() {
    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

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
                break;
            case 1:
                options_menu();
                break;
        }
    }
}
