;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _rand
	.globl _initrand
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _ball_sp_opt_ind
	.globl _ball_sp_options
	.globl _pad_sp_options
	.globl _cpu_options
	.globl _crntmenuentry
	.globl _numtiles
	.globl _rounddispl
	.globl _hud
	.globl _cointileincr
	.globl _cointile
	.globl _rounddisploffset
	.globl _roundcnt
	.globl _roundlimit
	.globl _speedind
	.globl _paddlehitscnt
	.globl _chspeedflgdir
	.globl _autospeedflg
	.globl _exitgameflg
	.globl _cpuscore
	.globl _pl1score
	.globl _randindy
	.globl _randindx
	.globl _j
	.globl _i
	.globl _difficulty
	.globl _tileind
	.globl _ball
	.globl _pdlcpu
	.globl _pdlpl1
	.globl _padinity
	.globl _padsectors
	.globl _padspeed
	.globl _padheight
	.globl _ballmvframe
	.globl _framecnt
	.globl _fast_option
	.globl _slow_option
	.globl _slug_option
	.globl _auto_option
	.globl _hard_option
	.globl _easy_option
	.globl _norm_option
	.globl _menuentriesy
	.globl _menuentriesx
	.globl _presst
	.globl _coinspinframe
	.globl _speedchframes
	.globl _bkgborderdown
	.globl _bkgborderup
	.globl _stspeedpooly
	.globl _stspeedpoolx
	.globl _difficulty_px
	.globl _blanktile
	.globl _startballposxy
	.globl _pongoptionsscreen
	.globl _pongcointiles
	.globl _pongtitlescreenmap
	.globl _pongfonttiles
	.globl _pongspritetiles
	.globl _ponggamemap
	.globl _pongbkgtiles
	.globl _set_game_font
	.globl _set_playfield_bkg
	.globl _default_settings
	.globl _custom_delay
	.globl _center_ball
	.globl _move_ball
	.globl _hits_walls
	.globl _init_paddle
	.globl _set_pad_sectors
	.globl _move_paddle
	.globl _scroll_paddle_tiles
	.globl _hits_paddle
	.globl _get_bounce_off_dir_y
	.globl _action_cpu
	.globl _auto_speed_adj
	.globl _upd_number_tiles_arr
	.globl _ltrim_blank_num_tiles
	.globl _upd_round_tiles
	.globl _upd_score_tiles
	.globl _display_round_num
	.globl _erase_round_num
	.globl _update_hud
	.globl _increment_score
	.globl _init_game
	.globl _prep_next_round
	.globl _is_round_over
	.globl _incr_frame_counter
	.globl _begin_round
	.globl _start_game
	.globl _intro_screen
	.globl _animate_coin_spin
	.globl _move_coin_cursor
	.globl _main_menu
	.globl _options_menu
	.globl _change_property
	.globl _display_all_opts_values
	.globl _change_cpu
	.globl _change_num_rounds
	.globl _change_pad_height
	.globl _change_pad_speed
	.globl _change_ball_speed
	.globl _reset_to_default
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_framecnt::
	.ds 1
_ballmvframe::
	.ds 1
_padheight::
	.ds 1
_padspeed::
	.ds 1
_padsectors::
	.ds 3
_padinity::
	.ds 1
_pdlpl1::
	.ds 3
_pdlcpu::
	.ds 3
_ball::
	.ds 4
_tileind::
	.ds 1
_difficulty::
	.ds 1
_i::
	.ds 1
_j::
	.ds 1
_randindx::
	.ds 1
_randindy::
	.ds 1
_pl1score::
	.ds 1
_cpuscore::
	.ds 1
_exitgameflg::
	.ds 1
_autospeedflg::
	.ds 1
_chspeedflgdir::
	.ds 1
_paddlehitscnt::
	.ds 1
_speedind::
	.ds 1
_roundlimit::
	.ds 1
_roundcnt::
	.ds 1
_rounddisploffset::
	.ds 1
_cointile::
	.ds 1
_cointileincr::
	.ds 1
_hud::
	.ds 19
_rounddispl::
	.ds 9
_numtiles::
	.ds 3
_crntmenuentry::
	.ds 1
_cpu_options::
	.ds 6
_pad_sp_options::
	.ds 8
_ball_sp_options::
	.ds 10
_ball_sp_opt_ind::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;main.c:45: unsigned char hud[19] = {0x1C, 0x18, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1C, 0x21};
	ld	hl, #_hud
	ld	(hl), #0x1c
	ld	hl, #(_hud + 0x0001)
	ld	(hl), #0x18
	ld	hl, #(_hud + 0x0002)
	ld	(hl), #0x04
	ld	hl, #(_hud + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0008)
	ld	(hl), #0x03
	ld	hl, #(_hud + 0x0009)
	ld	(hl), #0x28
	ld	hl, #(_hud + 0x000a)
	ld	(hl), #0x03
	ld	hl, #(_hud + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0010)
	ld	(hl), #0x0f
	ld	hl, #(_hud + 0x0011)
	ld	(hl), #0x1c
	ld	hl, #(_hud + 0x0012)
	ld	(hl), #0x21
;main.c:46: unsigned char rounddispl[9] = {0x1E, 0x1B, 0x21, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00};
	ld	hl, #_rounddispl
	ld	(hl), #0x1e
	ld	hl, #(_rounddispl + 0x0001)
	ld	(hl), #0x1b
	ld	hl, #(_rounddispl + 0x0002)
	ld	(hl), #0x21
	ld	hl, #(_rounddispl + 0x0003)
	ld	(hl), #0x1a
	ld	hl, #(_rounddispl + 0x0004)
	ld	(hl), #0x10
	ld	hl, #(_rounddispl + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_rounddispl + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_rounddispl + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_rounddispl + 0x0008)
	ld	(hl), #0x00
;main.c:59: const unsigned char * cpu_options[3] = {easy_option, norm_option, hard_option};
	ld	hl, #_cpu_options
	ld	(hl), #<(_easy_option)
	inc	hl
	ld	(hl), #>(_easy_option)
	ld	hl, #(_cpu_options + 0x0002)
	ld	(hl), #<(_norm_option)
	inc	hl
	ld	(hl), #>(_norm_option)
	ld	hl, #(_cpu_options + 0x0004)
	ld	(hl), #<(_hard_option)
	inc	hl
	ld	(hl), #>(_hard_option)
;main.c:60: const unsigned char * pad_sp_options[4] = {slug_option, slow_option, norm_option, fast_option};
	ld	hl, #_pad_sp_options
	ld	(hl), #<(_slug_option)
	inc	hl
	ld	(hl), #>(_slug_option)
	ld	hl, #(_pad_sp_options + 0x0002)
	ld	(hl), #<(_slow_option)
	inc	hl
	ld	(hl), #>(_slow_option)
	ld	hl, #(_pad_sp_options + 0x0004)
	ld	(hl), #<(_norm_option)
	inc	hl
	ld	(hl), #>(_norm_option)
	ld	hl, #(_pad_sp_options + 0x0006)
	ld	(hl), #<(_fast_option)
	inc	hl
	ld	(hl), #>(_fast_option)
;main.c:61: const unsigned char * ball_sp_options[5] = {auto_option, slug_option, slow_option, norm_option, fast_option};
	ld	hl, #_ball_sp_options
	ld	(hl), #<(_auto_option)
	inc	hl
	ld	(hl), #>(_auto_option)
	ld	hl, #(_ball_sp_options + 0x0002)
	ld	(hl), #<(_slug_option)
	inc	hl
	ld	(hl), #>(_slug_option)
	ld	hl, #(_ball_sp_options + 0x0004)
	ld	(hl), #<(_slow_option)
	inc	hl
	ld	(hl), #>(_slow_option)
	ld	hl, #(_ball_sp_options + 0x0006)
	ld	(hl), #<(_norm_option)
	inc	hl
	ld	(hl), #>(_norm_option)
	ld	hl, #(_ball_sp_options + 0x0008)
	ld	(hl), #<(_fast_option)
	inc	hl
	ld	(hl), #>(_fast_option)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:109: void set_game_font() {
;	---------------------------------
; Function set_game_font
; ---------------------------------
_set_game_font::
;main.c:110: set_bkg_data(0, 41, pongfonttiles);
	ld	hl, #_pongfonttiles
	push	hl
	ld	a, #0x29
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:111: }
	ret
_pongbkgtiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x3c	; 60
	.db #0xc2	; 194
	.db #0x9e	; 158
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x3c	; 60
	.db #0x43	; 67	'C'
	.db #0x79	; 121	'y'
	.db #0x86	; 134
	.db #0x79	; 121	'y'
	.db #0x86	; 134
	.db #0x3c	; 60
	.db #0x43	; 67	'C'
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x9e	; 158
	.db #0x61	; 97	'a'
	.db #0x3c	; 60
	.db #0xc2	; 194
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_ponggamemap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_pongspritetiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xe7	; 231
	.db #0x99	; 153
	.db #0xe7	; 231
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x18	; 24
_pongfonttiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_pongtitlescreenmap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_pongcointiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x42	; 66	'B'
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x66	; 102	'f'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x6a	; 106	'j'
	.db #0x42	; 66	'B'
	.db #0x6e	; 110	'n'
	.db #0x42	; 66	'B'
	.db #0x6e	; 110	'n'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
_pongoptionsscreen:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x21	; 33
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x21	; 33
	.db #0x1a	; 26
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0d	; 13
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x11	; 17
	.db #0x15	; 21
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0d	; 13
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x0d	; 13
	.db #0x21	; 33
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_startballposxy:
	.db #0x54	; 84	'T'
_blanktile:
	.db #0x00	; 0
_difficulty_px:
	.db #0x82	; 130
	.db #0x6e	; 110	'n'
	.db #0x54	; 84	'T'
_stspeedpoolx:
	.db #0xfc	; -4
	.db #0x04	;  4
_stspeedpooly:
	.db #0xfc	; -4
	.db #0xfe	; -2
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x04	;  4
_bkgborderup:
	.db #0x20	; 32
_bkgborderdown:
	.db #0x90	; 144
_speedchframes:
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x2a	; 42
_coinspinframe:
	.db #0x05	; 5
_presst:
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x20	; 32
_menuentriesx:
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x42	; 66	'B'
_menuentriesy:
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x80	; 128
	.db #0x90	; 144
_norm_option:
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x19	; 25
_easy_option:
	.db #0x11	; 17
	.db #0x0d	; 13
	.db #0x1f	; 31
	.db #0x25	; 37
_hard_option:
	.db #0x14	; 20
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x10	; 16
_auto_option:
	.db #0x0d	; 13
	.db #0x21	; 33
	.db #0x20	; 32
	.db #0x1b	; 27
_slug_option:
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x21	; 33
	.db #0x13	; 19
_slow_option:
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x1b	; 27
	.db #0x23	; 35
_fast_option:
	.db #0x12	; 18
	.db #0x0d	; 13
	.db #0x1f	; 31
	.db #0x20	; 32
;main.c:114: void set_playfield_bkg() {
;	---------------------------------
; Function set_playfield_bkg
; ---------------------------------
_set_playfield_bkg::
;main.c:115: set_bkg_data(41, 8, pongbkgtiles);
	ld	hl, #_pongbkgtiles
	push	hl
	ld	de, #0x0829
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:116: set_bkg_tiles(0, 0, 20, 18, ponggamemap);
	ld	hl, #_ponggamemap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:117: }
	ret
;main.c:120: void default_settings() {
;	---------------------------------
; Function default_settings
; ---------------------------------
_default_settings::
;main.c:122: autospeedflg = 1;
	ld	hl, #_autospeedflg
	ld	(hl), #0x01
;main.c:123: ball_sp_opt_ind = 0;
	ld	hl, #_ball_sp_opt_ind
	ld	(hl), #0x00
;main.c:124: roundlimit = 10;
	ld	hl, #_roundlimit
	ld	(hl), #0x0a
;main.c:125: difficulty = 1;
	ld	hl, #_difficulty
	ld	(hl), #0x01
;main.c:126: padheight = 3;
	ld	hl, #_padheight
	ld	(hl), #0x03
;main.c:127: padspeed = 3;
	ld	hl, #_padspeed
	ld	(hl), #0x03
;main.c:128: }
	ret
;main.c:131: void custom_delay(UINT16 cycles) {
;	---------------------------------
; Function custom_delay
; ---------------------------------
_custom_delay::
;main.c:132: for(i = 0; i < cycles; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
	ld	hl, #_i
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ret	NC
;main.c:133: wait_vbl_done();
	call	_wait_vbl_done
;main.c:132: for(i = 0; i < cycles; i++) {
	ld	hl, #_i
	inc	(hl)
;main.c:135: }
	jr	00103$
;main.c:138: void center_ball() {
;	---------------------------------
; Function center_ball
; ---------------------------------
_center_ball::
;main.c:139: ball.x = ball.y = startballposxy;
	ld	hl, #_startballposxy
	ld	b, (hl)
	ld	hl, #(_ball + 0x0001)
	ld	(hl), b
	ld	hl, #_ball
	ld	(hl), b
;main.c:140: move_sprite(0, ball.x, ball.y);
	ld	hl, #_ball
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:140: move_sprite(0, ball.x, ball.y);
;main.c:141: }
	ret
;main.c:144: void move_ball(Paddle * ppl1, Paddle * pcpu) {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
	dec	sp
;main.c:145: UINT8 nextballposx = ball.x + ball.speedx;
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, (#(_ball + 0x0002) + 0)
	add	a, c
	ld	c, a
;main.c:146: UINT8 nextballposy = ball.y + ball.speedy;
	ld	hl, #(_ball + 0x0001)
	ld	b, (hl)
	ld	a, (#(_ball + 0x0003) + 0)
	add	a, b
	ld	b, a
;main.c:147: if(hits_walls(nextballposy, 8)) {
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_hits_walls
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00102$
;main.c:148: ball.speedy *= -1;
	ld	hl, #(_ball + 0x0003)
	ld	l, (hl)
	xor	a, a
	sub	a, l
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #(_ball + 0x0003)
	ld	a, (hl)
	ld	(de), a
00102$:
;main.c:150: if(hits_paddle(nextballposx, nextballposy, ppl1)) {
	push	bc
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_hits_paddle
	add	sp, #4
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00106$
;main.c:151: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:152: ball.speedy = get_bounce_off_dir_y(ppl1);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_get_bounce_off_dir_y
	add	sp, #2
	ld	a, e
	ld	(#(_ball + 0x0003)),a
	jr	00107$
00106$:
;main.c:153: } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_hits_paddle
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00107$
;main.c:154: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:155: ball.speedy = get_bounce_off_dir_y(pcpu);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_get_bounce_off_dir_y
	add	sp, #2
	ld	a, e
	ld	(#(_ball + 0x0003)),a
00107$:
;main.c:157: ball.x += ball.speedx;
	ld	a, (#_ball + 0)
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	add	a, c
	ld	(#_ball),a
;main.c:158: ball.y += ball.speedy;
	ld	a, (#(_ball + 0x0001) + 0)
	ld	hl, #(_ball + 0x0003)
	ld	c, (hl)
	add	a, c
	ld	(#(_ball + 0x0001)),a
;main.c:159: scroll_sprite(0, ball.speedx, ball.speedy);
	ld	hl, #(_ball + 0x0003)
	ld	c, (hl)
	ld	hl, #(_ball + 0x0002)
	ld	b, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (de)
	add	a, c
	ld	(de), a
	inc	de
	ld	a, (de)
	add	a, b
	ld	(de), a
;main.c:159: scroll_sprite(0, ball.speedx, ball.speedy);
;main.c:160: }
	inc	sp
	ret
;main.c:163: UBYTE hits_walls(UINT8 nexty, UINT8 objheight) {
;	---------------------------------
; Function hits_walls
; ---------------------------------
_hits_walls::
;main.c:164: return nexty < bkgborderup || nexty + objheight > bkgborderdown;
	ld	hl, #_bkgborderup
	ld	c, (hl)
	ldhl	sp,	#2
	ld	a,(hl)
	cp	a,c
	jr	C, 00104$
	ld	b, #0x00
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	hl, #_bkgborderdown
	ld	l, (hl)
	ld	h, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	jr	C, 00104$
	ld	e, #0x00
	ret
00104$:
	ld	e, #0x01
;main.c:165: }
	ret
;main.c:168: void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {
;	---------------------------------
; Function init_paddle
; ---------------------------------
_init_paddle::
	add	sp, #-5
;main.c:171: pdl->x = posx;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:172: pdl->y = posy;
	ld	c, e
	ld	b, d
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:173: pdl->firsttile = firsttilenum;
	inc	de
	inc	de
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	(de), a
;main.c:175: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
;main.c:176: set_sprite_tile(firsttilenum, 1);
	ldhl	sp,	#9
	ld	e, (hl)
;main.c:175: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
	ld	a, b
	or	a, c
	jr	NZ, 00102$
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM+1+1
	add	hl,de
	ld	(hl), #0x01
;main.c:177: move_sprite(firsttilenum, posx, posy);
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:178: return;
	jp	00116$
00102$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#0
	ld	(hl), e
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, #0x02
00133$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00133$
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x02
;main.c:181: move_sprite(firsttilenum, posx, posy);
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, d
	ld	(bc), a
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1191: shadow_OAM[nb].prop=prop;
	ld	bc, #_shadow_OAM+0
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;main.c:184: tileind = firsttilenum + 1;
	ld	a, e
	inc	a
	ld	(#_tileind),a
;main.c:185: i = 1;
	ld	hl, #_i
	ld	(hl), #0x01
;main.c:186: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
00103$:
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	dec	bc
	ld	a, (#_tileind)
	ldhl	sp,	#3
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;main.c:187: set_sprite_tile(tileind, 3);
	ld	hl, #_tileind
	ld	e, (hl)
;main.c:186: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00134$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00105$
00134$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:188: move_sprite(tileind, posx, posy + i * 8);
	ld	a, (#_i)
	add	a, a
	add	a, a
	add	a, a
	ld	c, d
	add	a, c
	ld	e, a
	ld	hl, #_tileind
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, e
	ld	(bc), a
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;main.c:189: tileind++;
	ld	hl, #_tileind
	inc	(hl)
;main.c:190: i++;
	ld	hl, #_i
	inc	(hl)
	jr	00103$
00105$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x02
;main.c:194: set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
	ld	hl, #_tileind
	ld	e, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1191: shadow_OAM[nb].prop=prop;
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;main.c:195: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
	ld	a, (#_padheight)
	dec	a
	add	a, a
	add	a, a
	add	a, a
	add	a, d
	ld	c, a
	ld	hl, #_tileind
	ld	b, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	e, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	d, a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;main.c:195: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
00116$:
;main.c:197: }
	add	sp, #5
	ret
;main.c:200: void set_pad_sectors() {
;	---------------------------------
; Function set_pad_sectors
; ---------------------------------
_set_pad_sectors::
;main.c:203: padsectors[0] = padheight * 2; // 25%
	ld	bc, #_padsectors+0
	ld	hl, #_padheight
	ld	a, (hl)
	add	a, a
	ld	(bc), a
;main.c:204: padsectors[1] = padheight * 4; // 50%
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	(de), a
;main.c:205: padsectors[2] = padheight * 6; // 75%
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	(bc), a
;main.c:206: }
	ret
;main.c:209: void move_paddle(Paddle * pdl, INT8 pdlspd) {
;	---------------------------------
; Function move_paddle
; ---------------------------------
_move_paddle::
	add	sp, #-9
;main.c:210: UINT8 nextpdly = pdl->y + pdlspd;
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#13
	add	a, (hl)
	ld	d, a
;main.c:211: if(!hits_walls(nextpdly, padheight * 8)) {
	ld	a, (#_padheight)
	add	a, a
	add	a, a
	add	a, a
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	call	_hits_walls
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00105$
;main.c:212: scroll_paddle_tiles(pdl, pdlspd);
	push	bc
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_scroll_paddle_tiles
	add	sp, #3
	pop	bc
;main.c:213: pdl->y += pdlspd;
	ld	a, (bc)
	ldhl	sp,	#13
	add	a, (hl)
	ld	(bc), a
	jp	00107$
00105$:
;main.c:214: } else if(pdl->y > bkgborderup || pdl->y + padheight * 8 < bkgborderdown) {
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_bkgborderup)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_bkgborderdown)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	C, 00101$
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	hl, #_padheight
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
;c
	ld	e, a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00127$
	bit	7, d
	jr	NZ, 00128$
	cp	a, a
	jr	00128$
00127$:
	bit	7, d
	jr	Z, 00128$
	scf
00128$:
	jr	NC, 00107$
00101$:
;main.c:216: INT8 adjspd = pdlspd < 0 ? bkgborderup - pdl->y : bkgborderdown - (pdl->y + padheight * 8);
	ldhl	sp,	#13
	bit	7, (hl)
	jr	Z, 00109$
	ldhl	sp,	#3
	ld	a, (hl-)
	sub	a, (hl)
	jr	00110$
00109$:
	ld	a, (#_padheight)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#2
	ld	e, (hl)
	add	a, e
	ld	e, a
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, e
00110$:
	ld	d, a
;main.c:217: scroll_paddle_tiles(pdl, adjspd);
	push	bc
	push	de
	push	de
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_scroll_paddle_tiles
	add	sp, #3
	pop	de
	pop	bc
;main.c:218: pdl->y += adjspd;
	ld	a, (bc)
	add	a, d
	ld	(bc), a
00107$:
;main.c:220: }
	add	sp, #9
	ret
;main.c:223: void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp) {
;	---------------------------------
; Function scroll_paddle_tiles
; ---------------------------------
_scroll_paddle_tiles::
	dec	sp
;main.c:224: for(i = 0; i != padheight; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
00104$:
	ld	a, (#_i)
	ld	hl, #_padheight
	sub	a, (hl)
	jr	Z, 00106$
;main.c:225: scroll_sprite(pdl->firsttile + i, 0, pdlsp);
	ld	a, (de)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ldhl	sp,	#0
	add	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:224: for(i = 0; i != padheight; i++) {
	ld	hl, #_i
	inc	(hl)
	jr	00104$
00106$:
;main.c:227: }
	inc	sp
	ret
;main.c:230: UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl) {
;	---------------------------------
; Function hits_paddle
; ---------------------------------
_hits_paddle::
	add	sp, #-6
;main.c:231: return (nextx < pdl->x + 8 && pdl->x < nextx + 8) &&
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00126$
	bit	7, d
	jr	NZ, 00127$
	cp	a, a
	jr	00127$
00126$:
	bit	7, d
	jr	Z, 00127$
	scf
00127$:
	jp	NC, 00103$
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00128$
	bit	7, d
	jr	NZ, 00129$
	cp	a, a
	jr	00129$
00128$:
	bit	7, d
	jr	Z, 00129$
	scf
00129$:
	jp	NC, 00103$
;main.c:232: (nexty < pdl->y + (padheight * 8) && pdl->y < nexty + 8);
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_padheight)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x03
00130$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00130$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	NC, 00103$
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	C, 00104$
00103$:
	ld	e, #0x00
	jr	00105$
00104$:
	ld	e, #0x01
00105$:
;main.c:233: }
	add	sp, #6
	ret
;main.c:236: INT8 get_bounce_off_dir_y(Paddle * pad) {
;	---------------------------------
; Function get_bounce_off_dir_y
; ---------------------------------
_get_bounce_off_dir_y::
	add	sp, #-6
;main.c:238: UINT8 ballcentery = ball.y + 4;
	ld	a, (#(_ball + 0x0001) + 0)
	add	a, #0x04
	ld	c, a
;main.c:239: if(ballcentery < pad->y + padsectors[0]) { // < 25%
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_padsectors + 0)
	ld	e, a
	ld	d, #0x00
;c
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	b, #0x00
	dec	hl
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	NC, 00113$
;main.c:240: return -4;
	ld	e, #0xfc
	jp	00115$
00113$:
;main.c:241: } else if(ballcentery < pad->y + padsectors[1]) { // < 50%
	ld	a, (#(_padsectors + 0x0001) + 0)
	ld	d, #0x00
;c
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00144$
	bit	7, d
	jr	NZ, 00145$
	cp	a, a
	jr	00145$
00144$:
	bit	7, d
	jr	Z, 00145$
	scf
00145$:
	jr	NC, 00110$
;main.c:242: return -2;
	ld	e, #0xfe
	jr	00115$
00110$:
;main.c:243: } else if(ballcentery == pad->y + padsectors[1]) { // == 50%
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00107$
	inc	hl
	ld	a, (hl)
;main.c:244: return 0;
	sub	a,b
	jr	NZ, 00107$
	ld	e,a
	jr	00115$
00107$:
;main.c:245: } else if(ballcentery > pad->y + padsectors[2]) { // > 75%
	ld	a, (#(_padsectors + 0x0002) + 0)
	ld	d, #0x00
;c
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00148$
	bit	7, d
	jr	NZ, 00149$
	cp	a, a
	jr	00149$
00148$:
	bit	7, d
	jr	Z, 00149$
	scf
00149$:
	jr	NC, 00104$
;main.c:246: return 4;
	ld	e, #0x04
	jr	00115$
00104$:
;main.c:247: } else if(ballcentery > pad->y + padsectors[1]) { // > 50%
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00150$
	bit	7, d
	jr	NZ, 00151$
	cp	a, a
	jr	00151$
00150$:
	bit	7, d
	jr	Z, 00151$
	scf
00151$:
	jr	NC, 00108$
;main.c:248: return 2;
	ld	e, #0x02
	jr	00115$
00108$:
;main.c:250: return ball.speedy; // Just getting rid of a compiler warning
	ld	a, (#(_ball + 0x0003) + 0)
	ld	e, a
00115$:
;main.c:251: }
	add	sp, #6
	ret
;main.c:254: void action_cpu() {
;	---------------------------------
; Function action_cpu
; ---------------------------------
_action_cpu::
	dec	sp
;main.c:255: if(ball.x > difficulty_px[difficulty]) { // Determine when the cpu will react to the ball's position
	ld	hl, #_ball
	ld	c, (hl)
	ld	de, #_difficulty_px+0
	ld	a, e
	ld	hl, #_difficulty
	add	a, (hl)
	ld	e, a
	jr	NC, 00117$
	inc	d
00117$:
	ld	a, (de)
	sub	a, c
	jr	NC, 00103$
;main.c:256: move_paddle(&pdlcpu, pdlcpu.y < ball.y ? padspeed : -padspeed);
	ld	hl, #_pdlcpu + 1
	ld	c, (hl)
	ld	hl, #(_ball + 0x0001)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00105$
	ld	a, (#_padspeed)
	ldhl	sp,	#0
	ld	(hl), a
	jr	00106$
00105$:
	xor	a, a
	ld	hl, #_padspeed
	sub	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
00106$:
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #_pdlcpu
	push	hl
	call	_move_paddle
	add	sp, #3
00103$:
;main.c:258: }
	inc	sp
	ret
;main.c:261: void auto_speed_adj() {
;	---------------------------------
; Function auto_speed_adj
; ---------------------------------
_auto_speed_adj::
;main.c:262: if(chspeedflgdir == -ball.speedx) {
	ld	a, (#(_ball + 0x0002) + 0)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	a, (#_chspeedflgdir)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	ret	NZ
	ld	a, d
	sub	a, b
	ret	NZ
;main.c:264: paddlehitscnt++;
	ld	hl, #_paddlehitscnt
	inc	(hl)
;main.c:265: chspeedflgdir = ball.speedx; // New ball horizontal direction
	ld	a, (#(_ball + 0x0002) + 0)
	ld	(#_chspeedflgdir),a
;main.c:266: if(speedind != 3 && paddlehitscnt == speedchframes[speedind]) {
	ld	a, (#_speedind)
	sub	a, #0x03
	ret	Z
	ld	bc, #_speedchframes+0
	ld	a, c
	ld	hl, #_speedind
	add	a, (hl)
	ld	c, a
	jr	NC, 00126$
	inc	b
00126$:
	ld	a, (bc)
	ld	c, a
	ld	a, (#_paddlehitscnt)
	sub	a, c
	ret	NZ
;main.c:267: speedind++; // Checking for next speed threshold
	ld	hl, #_speedind
	inc	(hl)
;main.c:268: ballmvframe--; // Speed up
	ld	hl, #_ballmvframe
	dec	(hl)
;main.c:269: framecnt--; // Preventing overflow when calculating next framecnt
	ld	hl, #_framecnt
	dec	(hl)
;main.c:272: }
	ret
;main.c:275: void upd_number_tiles_arr(UINT8 num) { // Updates numtiles array for displaying purposes
;	---------------------------------
; Function upd_number_tiles_arr
; ---------------------------------
_upd_number_tiles_arr::
	dec	sp
;main.c:276: numtiles[0] = num / 100 == 0 ? 0 : (num / 100) + 3; // blank if num < 100
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #0x0064
	push	hl
	push	bc
	call	__divsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00103$
	ld	de, #0x0000
	jr	00104$
00103$:
	ld	a, e
	add	a, #0x03
	ld	e, a
	rla
00104$:
	ldhl	sp,	#0
	ld	(hl), e
	ld	de, #_numtiles
	ld	a, (hl)
	ld	(de), a
;main.c:277: numtiles[1] = numtiles[0] == 0 && num / 10 % 10 == 0 ? 0 : (num / 10 % 10) + 3; // blank if num < 10
	push	bc
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
	ld	a, d
	or	a, e
	jr	NZ, 00105$
	ld	de, #0x0000
	jr	00106$
00105$:
	ld	a, e
	add	a, #0x03
	ld	e, a
	rla
00106$:
	ld	a, e
	ld	(#(_numtiles + 0x0001)),a
;main.c:278: numtiles[2] = num % 10 + 3;
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x03
	ld	(#(_numtiles + 0x0002)),a
;main.c:279: }
	inc	sp
	ret
;main.c:282: void ltrim_blank_num_tiles() { // Shifts values so that the blanks go to the back of the array
;	---------------------------------
; Function ltrim_blank_num_tiles
; ---------------------------------
_ltrim_blank_num_tiles::
;main.c:283: if(numtiles[0] == 0) {
	ld	a, (#_numtiles + 0)
	or	a, a
	ret	NZ
;main.c:284: i = 1;
	ld	hl, #_i
	ld	(hl), #0x01
;main.c:285: while(numtiles[i] == 0) {
00101$:
	ld	a, #<(_numtiles)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_numtiles)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00103$
;main.c:286: i++;
	inc	(hl)
	jr	00101$
00103$:
;main.c:288: for(j = 0; i < 3; i++, j++) {
	ld	hl, #_j
	ld	(hl), #0x00
00108$:
	ld	a, (#_i)
	sub	a, #0x03
	ret	NC
;main.c:289: numtiles[j] = numtiles[i];
	ld	a, #<(_numtiles)
	ld	hl, #_j
	add	a, (hl)
	ld	c, a
	ld	a, #>(_numtiles)
	adc	a, #0x00
	ld	b, a
	ld	a, #<(_numtiles)
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_numtiles)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
;main.c:290: numtiles[i] = 0;
	ld	a, #<(_numtiles)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_numtiles)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;main.c:288: for(j = 0; i < 3; i++, j++) {
	inc	(hl)
	ld	hl, #_j
	inc	(hl)
;main.c:293: }
	jr	00108$
;main.c:296: void upd_round_tiles() {
;	---------------------------------
; Function upd_round_tiles
; ---------------------------------
_upd_round_tiles::
;main.c:297: upd_number_tiles_arr(roundcnt);
	ld	a, (#_roundcnt)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:298: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:299: rounddispl[6] = numtiles[0];
	ld	bc, #_rounddispl + 6
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:300: rounddispl[7] = numtiles[1];
	ld	bc, #_rounddispl + 7
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:301: rounddispl[8] = numtiles[2];
	ld	bc, #_rounddispl + 8
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:302: }
	ret
;main.c:305: void upd_score_tiles() {
;	---------------------------------
; Function upd_score_tiles
; ---------------------------------
_upd_score_tiles::
;main.c:306: upd_number_tiles_arr(pl1score);
	ld	a, (#_pl1score)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:307: hud[6] = numtiles[0];
	ld	bc, #_hud + 6
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:308: hud[7] = numtiles[1];
	ld	bc, #_hud + 7
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:309: hud[8] = numtiles[2];
	ld	bc, #_hud + 8
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:311: upd_number_tiles_arr(cpuscore);
	ld	a, (#_cpuscore)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:312: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:313: hud[10] = numtiles[0];
	ld	bc, #_hud + 10
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:314: hud[11] = numtiles[1];
	ld	bc, #_hud + 11
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:315: hud[12] = numtiles[2];
	ld	bc, #_hud + 12
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:316: }
	ret
;main.c:319: void display_round_num() {
;	---------------------------------
; Function display_round_num
; ---------------------------------
_display_round_num::
;main.c:320: rounddisploffset = roundcnt < 10 ? 0 : 1;
	ld	a, (#_roundcnt)
	sub	a, #0x0a
	jr	NC, 00103$
	ld	bc, #0x0000
	jr	00104$
00103$:
	ld	bc, #0x0001
00104$:
	ld	hl, #_rounddisploffset
	ld	(hl), c
;main.c:321: set_bkg_tiles(7 - rounddisploffset, 5, 9, 1, rounddispl);
	ld	bc, #_rounddispl+0
	ld	e, (hl)
	ld	a, #0x07
	sub	a, e
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x09
	push	hl
	inc	sp
	ld	h, #0x05
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:322: set_bkg_tiles(5, 12, 11, 1, presst);
	ld	hl, #_presst
	push	hl
	ld	de, #0x010b
	push	de
	ld	de, #0x0c05
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:323: set_bkg_tile_xy(9, 8, 0x2C);
	ld	de, #0x2c08
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:324: set_bkg_tile_xy(10, 8, 0x2B);
	ld	de, #0x2b08
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:325: set_bkg_tile_xy(9, 9, 0x2D);
	ld	de, #0x2d09
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:326: set_bkg_tile_xy(10, 9, 0x2E);
	ld	de, #0x2e09
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:327: }
	ret
;main.c:330: void erase_round_num() {
;	---------------------------------
; Function erase_round_num
; ---------------------------------
_erase_round_num::
;main.c:331: fill_bkg_rect(7 - rounddisploffset, 5, 9, 1, blanktile);
	ld	hl, #_blanktile
	ld	b, (hl)
	ld	hl, #_rounddisploffset
	ld	c, (hl)
	ld	a, #0x07
	sub	a, c
	push	bc
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x09
	push	hl
	inc	sp
	ld	h, #0x05
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;main.c:332: fill_bkg_rect(5, 12, 11, 1, blanktile);
	ld	a, (#_blanktile)
	ld	d,a
	ld	e,#0x01
	push	de
	ld	de, #0x0b0c
	push	de
	ld	a, #0x05
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;main.c:333: set_bkg_tile_xy(9, 5, 0x2F);
	ld	de, #0x2f05
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:334: set_bkg_tile_xy(10, 5, 0x30);
	ld	de, #0x3005
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:335: set_bkg_tile_xy(9, 8, 0x2F);
	ld	de, #0x2f08
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:336: set_bkg_tile_xy(10, 8, 0x30);
	ld	de, #0x3008
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:337: set_bkg_tile_xy(9, 9, 0x2F);
	ld	de, #0x2f09
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:338: set_bkg_tile_xy(10, 9, 0x30);
	ld	de, #0x3009
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:339: set_bkg_tile_xy(9, 12, 0x2F);
	ld	de, #0x2f0c
	push	de
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:340: set_bkg_tile_xy(10, 12, 0x30);
	ld	de, #0x300c
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:341: }
	ret
;main.c:344: void update_hud() {
;	---------------------------------
; Function update_hud
; ---------------------------------
_update_hud::
;main.c:345: set_win_tiles(0, 0, 19, 1, hud);
	ld	hl, #_hud
	push	hl
	ld	de, #0x0113
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x0c
	ldh	(_WX_REG+0),a
	ld	a, #0x86
	ldh	(_WY_REG+0),a
;main.c:346: move_win(12, 134);
;main.c:347: }
	ret
;main.c:350: void increment_score() {
;	---------------------------------
; Function increment_score
; ---------------------------------
_increment_score::
;main.c:351: if(ball.speedx < 0) { // Check the direction of the ball
	ld	hl, #(_ball + 0x0002)
	bit	7, (hl)
	jr	Z, 00102$
;main.c:352: cpuscore++;
	ld	hl, #_cpuscore
	inc	(hl)
	ret
00102$:
;main.c:354: pl1score++;
	ld	hl, #_pl1score
	inc	(hl)
;main.c:356: }
	ret
;main.c:359: void init_game() {
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;main.c:360: set_playfield_bkg();
	call	_set_playfield_bkg
;main.c:361: set_sprite_data(0, 5, pongspritetiles);
	ld	hl, #_pongspritetiles
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x04
;main.c:363: center_ball();
	call	_center_ball
;main.c:367: padinity = 16 + (144 - (padheight * 8)) / 2;
	ld	hl, #_padheight
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, #0x90
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00106$
	inc	hl
	ld	c, l
	ld	b, h
00106$:
	sra	b
	rr	c
	ld	a, c
	add	a, #0x10
	ld	hl, #_padinity
	ld	(hl), a
;main.c:368: init_paddle(&pdlpl1, 1, 16, padinity);
	ld	d, (hl)
	ld	e,#0x10
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_init_paddle
	add	sp, #5
;main.c:369: init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
	ld	a, (#(_pdlpl1 + 0x0002) + 0)
	ld	hl, #_padheight
	add	a, (hl)
	ld	b, a
	ld	a, (#_padinity)
	ld	d,a
	ld	e,#0x98
	push	de
	push	bc
	inc	sp
	ld	hl, #_pdlcpu
	push	hl
	call	_init_paddle
	add	sp, #5
;main.c:370: set_pad_sectors();
	call	_set_pad_sectors
;main.c:372: pl1score = cpuscore = 0;
	ld	hl, #_cpuscore
	ld	(hl), #0x00
	ld	hl, #_pl1score
	ld	(hl), #0x00
;main.c:373: roundcnt = 1;
	ld	hl, #_roundcnt
	ld	(hl), #0x01
;main.c:374: framecnt  = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:375: upd_score_tiles();
	call	_upd_score_tiles
;main.c:376: upd_round_tiles();
	call	_upd_round_tiles
;main.c:377: update_hud();
	call	_update_hud
;main.c:378: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:379: speedind = 0;
	ld	hl, #_speedind
	ld	(hl), #0x00
;main.c:380: paddlehitscnt = 0;
	ld	hl, #_paddlehitscnt
	ld	(hl), #0x00
;main.c:381: ballmvframe = 4;
	ld	hl, #_ballmvframe
	ld	(hl), #0x04
;main.c:383: }
	ret
;main.c:386: void prep_next_round() {
;	---------------------------------
; Function prep_next_round
; ---------------------------------
_prep_next_round::
;main.c:388: scroll_paddle_tiles(&pdlpl1, padinity - pdlpl1.y);
	ld	hl, #(_pdlpl1 + 0x0001)
	ld	c, (hl)
	ld	a, (#_padinity)
	sub	a, c
	ld	b, a
	push	bc
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_scroll_paddle_tiles
	add	sp, #3
;main.c:389: scroll_paddle_tiles(&pdlcpu, padinity - pdlcpu.y);
	ld	hl, #(_pdlcpu + 0x0001)
	ld	c, (hl)
	ld	a, (#_padinity)
	sub	a, c
	ld	b, a
	push	bc
	inc	sp
	ld	hl, #_pdlcpu
	push	hl
	call	_scroll_paddle_tiles
	add	sp, #3
;main.c:390: pdlpl1.y = pdlcpu.y = padinity;
	ld	de, #(_pdlcpu + 0x0001)
	ld	hl, #_padinity
	ld	a, (hl)
	ld	(de), a
	ld	de, #(_pdlpl1 + 0x0001)
	ld	a, (hl)
	ld	(de), a
;main.c:391: roundcnt++;
	ld	hl, #_roundcnt
	inc	(hl)
;main.c:392: upd_round_tiles();
	call	_upd_round_tiles
;main.c:393: framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:394: center_ball();
	call	_center_ball
;main.c:397: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:398: speedind = 1;
	ld	hl, #_speedind
	ld	(hl), #0x01
;main.c:399: ballmvframe = 3;
	ld	hl, #_ballmvframe
	ld	(hl), #0x03
;main.c:400: paddlehitscnt = speedchframes[0];
	ld	a, (#_speedchframes + 0)
	ld	(#_paddlehitscnt),a
;main.c:402: }
	ret
;main.c:405: UBYTE is_round_over() {
;	---------------------------------
; Function is_round_over
; ---------------------------------
_is_round_over::
	add	sp, #-2
;main.c:406: return ball.x + 8 < pdlpl1.x - 8 || ball.x > pdlcpu.x + 16;
	ld	a, (#_ball + 0)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_pdlpl1 + 0)
	ld	e, #0x00
	add	a, #0xf8
	ld	l, a
	ld	a, e
	adc	a, #0xff
	ld	h, a
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	jr	C, 00104$
	ld	a, (#_pdlcpu + 0)
	ld	c, #0x00
	add	a, #0x10
	ld	b, a
	jr	NC, 00118$
	inc	c
00118$:
	ldhl	sp,	#0
	ld	a, b
	sub	a, (hl)
	inc	hl
	ld	a, c
	sbc	a, (hl)
	ld	a, c
	ld	d, a
	bit	7, (hl)
	jr	Z, 00119$
	bit	7, d
	jr	NZ, 00120$
	cp	a, a
	jr	00120$
00119$:
	bit	7, d
	jr	Z, 00120$
	scf
00120$:
	jr	C, 00104$
	ld	e, #0x00
	jr	00105$
00104$:
	ld	e, #0x01
00105$:
;main.c:407: }
	add	sp, #2
	ret
;main.c:410: void incr_frame_counter(UINT8 framelimit) {
;	---------------------------------
; Function incr_frame_counter
; ---------------------------------
_incr_frame_counter::
;main.c:411: if(framecnt == framelimit) {
	ld	a, (#_framecnt)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NZ, 00102$
;main.c:412: framecnt = 1; // Resetting the frame counter
	ld	hl, #_framecnt
	ld	(hl), #0x01
	ret
00102$:
;main.c:414: framecnt++;
	ld	hl, #_framecnt
	inc	(hl)
;main.c:416: }
	ret
;main.c:419: void begin_round() {
;	---------------------------------
; Function begin_round
; ---------------------------------
_begin_round::
;main.c:420: display_round_num();
	call	_display_round_num
;main.c:421: while(1) {  // Start round or return to titlescreen
00107$:
;main.c:422: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:423: if(joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00104$
;main.c:424: erase_round_num();
	call	_erase_round_num
;main.c:425: break;
	jr	00108$
00104$:
;main.c:426: } else if(joypad() & J_SELECT) {
	call	_joypad
	bit	6, e
	jr	Z, 00107$
;main.c:427: exitgameflg = 1;
	ld	hl, #_exitgameflg
	ld	(hl), #0x01
;main.c:428: return;
	ret
00108$:
;main.c:432: randindx = rand() % 2; // Random number between 0 and 1
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0002
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, #_randindx
	ld	(hl), e
;main.c:433: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:434: randindy = rand() % 5; // Random number between 0 and 4
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0005
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, #_randindy
	ld	(hl), e
;main.c:435: ball.speedx = stspeedpoolx[randindx];
	ld	bc, #_stspeedpoolx+0
	ld	a, c
	ld	hl, #_randindx
	add	a, (hl)
	ld	c, a
	jr	NC, 00170$
	inc	b
00170$:
	ld	a, (bc)
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:436: ball.speedy = stspeedpooly[randindy];
	ld	de, #_stspeedpooly+0
	ld	a, e
	ld	hl, #_randindy
	add	a, (hl)
	ld	e, a
	jr	NC, 00171$
	inc	d
00171$:
	ld	a, (de)
	ld	(#(_ball + 0x0003)),a
;main.c:437: chspeedflgdir = ball.speedx;
	ld	hl, #_chspeedflgdir
	ld	(hl), c
;main.c:439: while(1) {
00119$:
;main.c:440: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	jr	Z, 00110$
;main.c:441: auto_speed_adj();
	call	_auto_speed_adj
00110$:
;main.c:443: incr_frame_counter(ballmvframe);
	ld	a, (#_ballmvframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:445: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x04
	jr	Z, 00111$
	sub	a, #0x08
	jr	Z, 00112$
	jr	00113$
;main.c:446: case J_UP:
00111$:
;main.c:447: move_paddle(&pdlpl1, -padspeed);
	xor	a, a
	ld	hl, #_padspeed
	sub	a, (hl)
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:448: break;
	jr	00113$
;main.c:449: case J_DOWN:
00112$:
;main.c:450: move_paddle(&pdlpl1, padspeed);
	ld	a, (#_padspeed)
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:452: }
00113$:
;main.c:454: if(framecnt == ballmvframe) {
	ld	a, (#_framecnt)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	NZ, 00115$
;main.c:455: move_ball(&pdlpl1, &pdlcpu);
	ld	hl, #_pdlcpu
	push	hl
	ld	hl, #_pdlpl1
	push	hl
	call	_move_ball
	add	sp, #4
00115$:
;main.c:458: action_cpu();
	call	_action_cpu
;main.c:459: if(is_round_over()) {
	call	_is_round_over
	ld	a, e
	or	a, a
	jr	Z, 00117$
;main.c:460: increment_score();
	call	_increment_score
;main.c:461: upd_score_tiles();
	call	_upd_score_tiles
;main.c:462: update_hud();
;main.c:463: break;
	jp  _update_hud
00117$:
;main.c:465: wait_vbl_done();
	call	_wait_vbl_done
;main.c:467: }
	jr	00119$
;main.c:470: void start_game() {
;	---------------------------------
; Function start_game
; ---------------------------------
_start_game::
;main.c:471: exitgameflg = 0;
	ld	hl, #_exitgameflg
	ld	(hl), #0x00
;main.c:472: init_game();
	call	_init_game
;main.c:473: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:474: while(1) {
00105$:
;main.c:475: begin_round();
	call	_begin_round
;main.c:476: if(exitgameflg || roundcnt == roundlimit) {
	ld	a, (#_exitgameflg)
	or	a, a
	jr	NZ, 00106$
	ld	a, (#_roundcnt)
	ld	hl, #_roundlimit
	sub	a, (hl)
	jr	Z, 00106$
;main.c:479: prep_next_round();
	call	_prep_next_round
	jr	00105$
00106$:
;main.c:481: HIDE_WIN; // Remove HUD before going back to the main menu
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;main.c:482: for(i = 0; i < 40; i++) { // Reset sprite memory
	ld	hl, #_i
	ld	(hl), #0x00
00109$:
;main.c:483: set_sprite_tile(i, blanktile);
	ld	hl, #_blanktile
	ld	c, (hl)
	ld	hl, #_i
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;main.c:482: for(i = 0; i < 40; i++) { // Reset sprite memory
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00109$
;main.c:485: }
	ret
;main.c:488: void intro_screen() {
;	---------------------------------
; Function intro_screen
; ---------------------------------
_intro_screen::
;main.c:490: }
	ret
;main.c:493: void animate_coin_spin() {
;	---------------------------------
; Function animate_coin_spin
; ---------------------------------
_animate_coin_spin::
;main.c:494: if(framecnt == coinspinframe) {
	ld	hl, #_coinspinframe
	ld	c, (hl)
	ld	a, (#_framecnt)
	sub	a, c
	ret	NZ
;main.c:495: cointile += cointileincr;
	ld	a, (#_cointile)
	ld	hl, #_cointileincr
	add	a, (hl)
	ld	hl, #_cointile
	ld	(hl), a
;main.c:496: set_sprite_tile(0, cointile);
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), c
;main.c:497: if(cointile == 4) {
	ld	a, (#_cointile)
	sub	a, #0x04
	jr	NZ, 00105$
;main.c:498: cointileincr = -1;
	ld	hl, #_cointileincr
	ld	(hl), #0xff
	ret
00105$:
;main.c:499: } else if(cointile == 1 && cointileincr == -1) {
	ld	a, (#_cointile)
	dec	a
	ret	NZ
	ld	a, (#_cointileincr)
	inc	a
	ret	NZ
;main.c:500: cointileincr = 1;
	ld	hl, #_cointileincr
	ld	(hl), #0x01
;main.c:503: }
	ret
;main.c:506: void move_coin_cursor(INT8 direction, UINT8 fstmenuind, UINT8 lastmenuind) {
;	---------------------------------
; Function move_coin_cursor
; ---------------------------------
_move_coin_cursor::
;main.c:507: if(crntmenuentry == lastmenuind && direction == 1) {
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NZ, 00106$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00106$
;main.c:508: crntmenuentry = fstmenuind;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_crntmenuentry),a
	jr	00107$
00106$:
;main.c:509: } else if(crntmenuentry == fstmenuind && direction == -1) {
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NZ, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;main.c:510: crntmenuentry = lastmenuind;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_crntmenuentry),a
	jr	00107$
00102$:
;main.c:512: crntmenuentry += direction;
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#2
	add	a, (hl)
	ld	(#_crntmenuentry),a
00107$:
;main.c:514: move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
	ld	bc, #_menuentriesy+0
	ld	a, c
	ld	hl, #_crntmenuentry
	add	a, (hl)
	ld	c, a
	jr	NC, 00140$
	inc	b
00140$:
	ld	a, (bc)
	ld	b, a
	ld	de, #_menuentriesx+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00141$
	inc	d
00141$:
	ld	a, (de)
	ld	c, a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:515: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:516: }
	ret
;main.c:519: void main_menu() {
;	---------------------------------
; Function main_menu
; ---------------------------------
_main_menu::
;main.c:520: set_bkg_tiles(0, 0, 20, 18, pongtitlescreenmap);
	ld	hl, #_pongtitlescreenmap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:521: set_sprite_data(0, 5, pongcointiles);
	ld	hl, #_pongcointiles
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:522: move_sprite(0, menuentriesx[0], menuentriesy[0]);
	ld	hl, #_menuentriesy
	ld	c, (hl)
	ld	hl, #_menuentriesx
	ld	b, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:523: crntmenuentry = 0;
	ld	hl, #_crntmenuentry
	ld	(hl), #0x00
;main.c:525: while(1) {
00107$:
;main.c:526: incr_frame_counter(coinspinframe);
	ld	a, (#_coinspinframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:527: animate_coin_spin();
	call	_animate_coin_spin
;main.c:528: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x04
	jr	Z, 00101$
	sub	a, #0x08
	jr	Z, 00102$
	jr	00103$
;main.c:529: case(J_UP):
00101$:
;main.c:530: move_coin_cursor(-1, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_move_coin_cursor
	add	sp, #3
;main.c:531: break;
	jr	00103$
;main.c:532: case(J_DOWN):
00102$:
;main.c:533: move_coin_cursor(1, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_move_coin_cursor
	add	sp, #3
;main.c:535: }
00103$:
;main.c:536: if(joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00105$
;main.c:537: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:538: break; // End function execution and check selected entry
	ret
00105$:
;main.c:540: wait_vbl_done();
	call	_wait_vbl_done
;main.c:542: }
	jr	00107$
;main.c:545: void options_menu() {
;	---------------------------------
; Function options_menu
; ---------------------------------
_options_menu::
;main.c:546: set_bkg_tiles(0, 0, 20, 18, pongoptionsscreen);
	ld	hl, #_pongoptionsscreen
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:547: display_all_opts_values();
	call	_display_all_opts_values
;main.c:548: crntmenuentry = 2;
	ld	hl, #_crntmenuentry
	ld	(hl), #0x02
;main.c:549: move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
	ld	hl, #(_menuentriesy + 0x0002)
	ld	c, (hl)
	ld	hl, #(_menuentriesx + 0x0002)
	ld	b, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:551: while(1) {
00120$:
;main.c:552: incr_frame_counter(coinspinframe);
	ld	a, (#_coinspinframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:553: animate_coin_spin();
	call	_animate_coin_spin
;main.c:555: switch(joypad()) {
	call	_joypad
	ld	a, e
	dec	a
	jr	Z, 00104$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00103$
	cp	a,#0x04
	jr	Z, 00101$
	sub	a, #0x08
	jr	Z, 00102$
;main.c:569: if(crntmenuentry == 3) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00190$
	xor	a, a
00190$:
	ld	c, a
;main.c:555: switch(joypad()) {
	ld	a,e
	cp	a,#0x10
	jr	Z, 00105$
	sub	a, #0x20
	jr	Z, 00108$
	jr	00111$
;main.c:556: case J_UP:
00101$:
;main.c:557: move_coin_cursor(-1, 2, 8);
	ld	de, #0x0802
	push	de
	ld	a, #0xff
	push	af
	inc	sp
	call	_move_coin_cursor
	add	sp, #3
;main.c:558: break;
	jr	00111$
;main.c:559: case J_DOWN:
00102$:
;main.c:560: move_coin_cursor(1, 2, 8);
	ld	de, #0x0802
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_move_coin_cursor
	add	sp, #3
;main.c:561: break;
	jr	00111$
;main.c:562: case J_LEFT:
00103$:
;main.c:563: change_property(-1, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0xff
	push	de
	call	_change_property
	add	sp, #2
;main.c:564: break;
	jr	00111$
;main.c:565: case J_RIGHT:
00104$:
;main.c:566: change_property(1, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0x01
	push	de
	call	_change_property
	add	sp, #2
;main.c:567: break;
	jr	00111$
;main.c:568: case J_A:
00105$:
;main.c:569: if(crntmenuentry == 3) {
	ld	a, c
	or	a, a
	jr	Z, 00111$
;main.c:570: change_property(10, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_change_property
	add	sp, #2
;main.c:572: break;
	jr	00111$
;main.c:573: case J_B:
00108$:
;main.c:574: if(crntmenuentry == 3) {
	ld	a, c
	or	a, a
	jr	Z, 00111$
;main.c:575: change_property(-10, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0xf6
	push	de
	call	_change_property
	add	sp, #2
;main.c:578: }
00111$:
;main.c:579: if(joypad() & (J_START | J_A)) {
	call	_joypad
	ld	a, e
	and	a, #0x90
	jr	Z, 00118$
;main.c:580: if(crntmenuentry == 7) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x07
	jr	NZ, 00115$
;main.c:581: reset_to_default();
	call	_reset_to_default
	jr	00118$
00115$:
;main.c:582: } else if(crntmenuentry == 8) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x08
	jr	NZ, 00118$
;main.c:583: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:584: break; // Back to main menu
	ret
00118$:
;main.c:587: wait_vbl_done();
	call	_wait_vbl_done
;main.c:589: }
	jp	00120$
;main.c:592: void change_property(INT8 units, UINT8 menuentry) {
;	---------------------------------
; Function change_property
; ---------------------------------
_change_property::
;main.c:593: switch(menuentry) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00102$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00103$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00104$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00105$
	jr	00106$
;main.c:594: case 2:
00101$:
;main.c:595: change_cpu(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_cpu
	inc	sp
;main.c:596: break;
	jr	00106$
;main.c:597: case 3:
00102$:
;main.c:598: change_num_rounds(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_num_rounds
	inc	sp
;main.c:599: break;
	jr	00106$
;main.c:600: case 4:
00103$:
;main.c:601: change_pad_height(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_pad_height
	inc	sp
;main.c:602: break;
	jr	00106$
;main.c:603: case 5:
00104$:
;main.c:604: change_pad_speed(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_pad_speed
	inc	sp
;main.c:605: break;
	jr	00106$
;main.c:606: case 6:
00105$:
;main.c:607: change_ball_speed(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_ball_speed
	inc	sp
;main.c:609: }
00106$:
;main.c:610: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:611: }
	ret
;main.c:614: void display_all_opts_values() {
;	---------------------------------
; Function display_all_opts_values
; ---------------------------------
_display_all_opts_values::
;main.c:615: set_bkg_tiles(15, 1, 4, 1, cpu_options[difficulty]);
	ld	bc, #_cpu_options+0
	ld	hl, #_difficulty
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x010f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:616: upd_number_tiles_arr(roundlimit);
	ld	a, (#_roundlimit)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:617: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:618: set_bkg_tiles(15, 3, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x030f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:619: upd_number_tiles_arr(padheight);
	ld	a, (#_padheight)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:620: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:621: set_bkg_tiles(15, 5, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x050f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:622: set_bkg_tiles(15, 7, 4, 1, pad_sp_options[padspeed - 1]);
	ld	bc, #_pad_sp_options+0
	ld	a, (#_padspeed)
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x070f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:623: set_bkg_tiles(15, 9, 4, 1, ball_sp_options[ball_sp_opt_ind]);
	ld	bc, #_ball_sp_options+0
	ld	hl, #_ball_sp_opt_ind
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x090f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:624: }
	ret
;main.c:627: void change_cpu(INT8 units) {
;	---------------------------------
; Function change_cpu
; ---------------------------------
_change_cpu::
;main.c:628: if(difficulty + units >= 0 && difficulty + units < 3) {
	ld	hl, #_difficulty
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	bit	7, h
	ret	NZ
	ld	a, l
	sub	a, #0x03
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:629: difficulty += units;
	ld	a, (#_difficulty)
	ldhl	sp,	#2
	add	a, (hl)
	ld	hl, #_difficulty
	ld	(hl), a
;main.c:630: set_bkg_tiles(15, 1, 4, 1, cpu_options[difficulty]);
	ld	bc, #_cpu_options+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x010f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:632: }
	ret
;main.c:635: void change_num_rounds(INT8 units) {
;	---------------------------------
; Function change_num_rounds
; ---------------------------------
_change_num_rounds::
;main.c:636: if(roundlimit + units > 0 && roundlimit + units <= 255) {
	ld	hl, #_roundlimit
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	xor	a, a
	cp	a, l
	sbc	a, h
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	ret	NC
	ld	e, h
	ld	d, #0x00
	ld	a, #0xff
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	ret	C
;main.c:637: roundlimit += units;
	ld	a, (#_roundlimit)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:638: upd_number_tiles_arr(roundlimit);
	ld	(#_roundlimit),a
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:639: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:640: set_bkg_tiles(15, 3, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x030f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:642: }
	ret
;main.c:645: void change_pad_height(INT8 units) {
;	---------------------------------
; Function change_pad_height
; ---------------------------------
_change_pad_height::
;main.c:646: if(padheight + units > 0 && padheight + units < 9) {
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	xor	a, a
	cp	a, l
	sbc	a, h
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	ret	NC
	ld	a, l
	sub	a, #0x09
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:647: padheight += units;
	ld	a, (#_padheight)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:648: upd_number_tiles_arr(padheight);
	ld	(#_padheight),a
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:649: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:650: set_bkg_tiles(15, 5, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x050f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:652: }
	ret
;main.c:655: void change_pad_speed(INT8 units) {
;	---------------------------------
; Function change_pad_speed
; ---------------------------------
_change_pad_speed::
;main.c:656: if(padspeed + units > 0 && padspeed + units < 5) {
	ld	hl, #_padspeed
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	xor	a, a
	cp	a, l
	sbc	a, h
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	ret	NC
	ld	a, l
	sub	a, #0x05
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:657: padspeed += units;
	ld	a, (#_padspeed)
	ldhl	sp,	#2
	add	a, (hl)
	ld	hl, #_padspeed
	ld	(hl), a
;main.c:658: set_bkg_tiles(15, 7, 4, 1, pad_sp_options[padspeed - 1]);
	ld	bc, #_pad_sp_options+0
	ld	a, (hl)
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x070f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:660: }
	ret
;main.c:663: void change_ball_speed(INT8 units) {
;	---------------------------------
; Function change_ball_speed
; ---------------------------------
_change_ball_speed::
;main.c:664: if(ball_sp_opt_ind + units >= 0 && ball_sp_opt_ind + units < 5) {
	ld	hl, #_ball_sp_opt_ind
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	bit	7, h
	ret	NZ
	ld	a, l
	sub	a, #0x05
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:665: ball_sp_opt_ind += units;
	ld	a, (#_ball_sp_opt_ind)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:666: if(ball_sp_opt_ind == 0) {
	ld	(#_ball_sp_opt_ind),a
	or	a, a
	jr	NZ, 00102$
;main.c:667: autospeedflg = 1;
	ld	hl, #_autospeedflg
	ld	(hl), #0x01
;main.c:668: set_bkg_tiles(15, 9, 4, 1, ball_sp_options[0]);
	ld	hl, #_ball_sp_options
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x090f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	ret
00102$:
;main.c:670: autospeedflg = 0;
	ld	hl, #_autospeedflg
	ld	(hl), #0x00
;main.c:671: ballmvframe = 5 - ball_sp_opt_ind;
	ld	hl, #_ball_sp_opt_ind
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	ld	(#_ballmvframe),a
;main.c:672: set_bkg_tiles(15, 9, 4, 1, ball_sp_options[ball_sp_opt_ind]);
	ld	bc, #_ball_sp_options+0
	ld	hl, #_ball_sp_opt_ind
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x090f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:675: }
	ret
;main.c:678: void reset_to_default() {
;	---------------------------------
; Function reset_to_default
; ---------------------------------
_reset_to_default::
;main.c:679: default_settings();
	call	_default_settings
;main.c:680: display_all_opts_values();
	call	_display_all_opts_values
;main.c:681: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:682: }
	ret
;main.c:685: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:686: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:687: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:688: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:690: set_game_font();
	call	_set_game_font
;main.c:691: intro_screen();
	call	_intro_screen
;main.c:692: default_settings();
	call	_default_settings
;main.c:694: while(1) {
00105$:
;main.c:695: cointile = 0;
	ld	hl, #_cointile
	ld	(hl), #0x00
;main.c:696: cointileincr = 1;
	ld	hl, #_cointileincr
	ld	(hl), #0x01
;main.c:697: framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:698: main_menu();
	call	_main_menu
;main.c:699: switch(crntmenuentry) {
	ld	a, (#_crntmenuentry)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_crntmenuentry)
	dec	a
	jr	Z, 00102$
	jr	00105$
;main.c:700: case 0:
00101$:
;main.c:701: start_game();
	call	_start_game
;main.c:702: break;
	jr	00105$
;main.c:703: case 1:
00102$:
;main.c:704: options_menu();
	call	_options_menu
;main.c:706: }
;main.c:708: }
	jr	00105$
	.area _CODE
	.area _CABS (ABS)
