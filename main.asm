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
	.globl _waitpad
	.globl _joypad
	.globl _plnameflashval
	.globl _plnameind
	.globl _plname
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
	.globl _fontind
	.globl _randindy
	.globl _randindx
	.globl _k
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
	.globl _cpuname
	.globl _youlose
	.globl _youwin
	.globl _toobad
	.globl _congrats
	.globl _intro_year
	.globl _intro_name_sprites
	.globl _intro_by
	.globl _intro_created
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
	.globl _plnamecursframe
	.globl _coinspinframe
	.globl _speedchframes
	.globl _bkgborderdown
	.globl _bkgborderup
	.globl _stspeedpooly
	.globl _stspeedpoolx
	.globl _difficulty_px
	.globl _blanktile
	.globl _startballposxy
	.globl _speedpcupmap
	.globl _speedpcuptiles
	.globl _speedptitlelogo
	.globl _speedpoptionsscreen
	.globl _speedpcointiles
	.globl _speedptitlescreenmap
	.globl _speedpfonttiles
	.globl _speedpspritetiles
	.globl _speedpgamemap
	.globl _speedpbkgtiles
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
	.globl _change_player_name
	.globl _change_letter_in_name
	.globl _move_to_next_letter
	.globl _change_cpu
	.globl _change_num_rounds
	.globl _change_pad_height
	.globl _change_pad_speed
	.globl _change_ball_speed
	.globl _reset_to_default
	.globl _fade_to_black
	.globl _fade_from_black
	.globl _clear_sprite_tiles
	.globl _results_sequence
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
_k::
	.ds 1
_randindx::
	.ds 1
_randindy::
	.ds 1
_fontind::
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
_plname::
	.ds 3
_plnameind::
	.ds 1
_plnameflashval::
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
;main.c:48: unsigned char hud[19] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1C, 0x21};
	ld	hl, #_hud
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_hud + 0x0002)
	ld	(hl), #0x00
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
;main.c:49: unsigned char rounddispl[9] = {0x1E, 0x1B, 0x21, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00};
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
;main.c:62: const unsigned char * cpu_options[3] = {easy_option, norm_option, hard_option};
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
;main.c:63: const unsigned char * pad_sp_options[4] = {slug_option, slow_option, norm_option, fast_option};
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
;main.c:64: const unsigned char * ball_sp_options[5] = {auto_option, slug_option, slow_option, norm_option, fast_option};
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
;main.c:75: unsigned char plname[3] = {0x1C, 0x18, 0x04};
	ld	hl, #_plname
	ld	(hl), #0x1c
	ld	hl, #(_plname + 0x0001)
	ld	(hl), #0x18
	ld	hl, #(_plname + 0x0002)
	ld	(hl), #0x04
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:131: void set_game_font() {
;	---------------------------------
; Function set_game_font
; ---------------------------------
_set_game_font::
;main.c:132: set_bkg_data(0, 42, speedpfonttiles);
	ld	hl, #_speedpfonttiles
	push	hl
	ld	a, #0x2a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:133: }
	ret
_speedpbkgtiles:
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_speedpgamemap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
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
	.db #0x00	; 0
	.db #0x00	; 0
_speedpspritetiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_speedpfonttiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
_speedptitlescreenmap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x45	; 69	'E'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_speedpcointiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_speedpoptionsscreen:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x11	; 17
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
_speedptitlelogo:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x5f	; 95
	.db #0x9f	; 159
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x94	; 148
	.db #0xe4	; 228
	.db #0xa4	; 164
	.db #0xc4	; 196
	.db #0x28	; 40
	.db #0xc8	; 200
	.db #0xc8	; 200
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x25	; 37
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x14	; 20
	.db #0x13	; 19
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x25	; 37
	.db #0x23	; 35
	.db #0x29	; 41
	.db #0x27	; 39
	.db #0x4a	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0x52	; 82	'R'
	.db #0x4e	; 78	'N'
	.db #0x94	; 148
	.db #0x8c	; 140
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x25	; 37
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x35	; 53	'5'
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x4a	; 74	'J'
	.db #0x72	; 114	'r'
	.db #0x53	; 83	'S'
	.db #0x63	; 99	'c'
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe7	; 231
	.db #0x21	; 33
	.db #0xe2	; 226
	.db #0xc0	; 192
	.db #0x4f	; 79	'O'
	.db #0x40	; 64
	.db #0x49	; 73	'I'
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x58	; 88	'X'
	.db #0x1c	; 28
	.db #0xa0	; 160
	.db #0x13	; 19
	.db #0xa3	; 163
	.db #0x14	; 20
	.db #0x27	; 39
	.db #0x3b	; 59
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x68	; 104	'h'
	.db #0xff	; 255
	.db #0x12	; 18
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x2a	; 42
	.db #0x4f	; 79	'O'
	.db #0x59	; 89	'Y'
	.db #0x9f	; 159
	.db #0x14	; 20
	.db #0xdf	; 223
	.db #0x50	; 80	'P'
	.db #0x1f	; 31
	.db #0x5b	; 91
	.db #0x9f	; 159
	.db #0x50	; 80	'P'
	.db #0x1f	; 31
	.db #0xd5	; 213
	.db #0x1f	; 31
	.db #0x2e	; 46
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x64	; 100	'd'
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x94	; 148
	.db #0xff	; 255
	.db #0xa4	; 164
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x3b	; 59
	.db #0xcf	; 207
	.db #0x14	; 20
	.db #0x27	; 39
	.db #0x13	; 19
	.db #0xa3	; 163
	.db #0x1c	; 28
	.db #0xa0	; 160
	.db #0x01	; 1
	.db #0x58	; 88	'X'
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x68	; 104	'h'
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x81	; 129
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0x12	; 18
	.db #0x0e	; 14
	.db #0x94	; 148
	.db #0x8c	; 140
	.db #0xa4	; 164
	.db #0x9c	; 156
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x48	; 72	'H'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x35	; 53	'5'
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x4a	; 74	'J'
	.db #0x72	; 114	'r'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x94	; 148
	.db #0xe4	; 228
	.db #0xa4	; 164
	.db #0xc4	; 196
	.db #0x28	; 40
	.db #0xc8	; 200
	.db #0x48	; 72	'H'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
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
_speedpcuptiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xb0	; 176
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x29	; 41
	.db #0x20	; 32
	.db #0x39	; 57	'9'
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x83	; 131
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0xf4	; 244
	.db #0xeb	; 235
	.db #0x14	; 20
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0x03	; 3
	.db #0x42	; 66	'B'
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x20	; 32
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x51	; 81	'Q'
	.db #0x80	; 128
	.db #0x41	; 65	'A'
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x36	; 54	'6'
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x2e	; 46
	.db #0xd1	; 209
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0xc2	; 194
	.db #0xf5	; 245
	.db #0x52	; 82	'R'
	.db #0xed	; 237
	.db #0x72	; 114	'r'
	.db #0xdd	; 221
	.db #0x52	; 82	'R'
	.db #0xfd	; 253
	.db #0x62	; 98	'b'
	.db #0xfd	; 253
	.db #0x10	; 16
	.db #0xf9	; 249
	.db #0x4a	; 74	'J'
	.db #0xb1	; 177
	.db #0x96	; 150
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x0d	; 13
	.db #0x85	; 133
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x82	; 130
	.db #0x07	; 7
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0xc7	; 199
	.db #0x4c	; 76	'L'
	.db #0xe7	; 231
	.db #0xc0	; 192
	.db #0x7d	; 125
	.db #0x71	; 113	'q'
	.db #0x7c	; 124
	.db #0x35	; 53	'5'
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xd3	; 211
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xc2	; 194
	.db #0xfd	; 253
	.db #0x4a	; 74	'J'
	.db #0xf5	; 245
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0xc4	; 196
	.db #0x3b	; 59
	.db #0xdc	; 220
	.db #0x23	; 35
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x80	; 128
	.db #0x46	; 70	'F'
	.db #0x4c	; 76	'L'
	.db #0xc4	; 196
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x80	; 128
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0x27	; 39
	.db #0x58	; 88	'X'
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x4f	; 79	'O'
	.db #0xf0	; 240
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x27	; 39
	.db #0x78	; 120	'x'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0x1c	; 28
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0xe8	; 232
	.db #0x87	; 135
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x70	; 112	'p'
	.db #0x0c	; 12
	.db #0x70	; 112	'p'
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x1c	; 28
	.db #0xee	; 238
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xff	; 255
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
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x58	; 88	'X'
	.db #0x74	; 116	't'
	.db #0xdb	; 219
	.db #0xe4	; 228
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x11	; 17
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0xc4	; 196
	.db #0x90	; 144
	.db #0x6c	; 108	'l'
	.db #0xf1	; 241
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
_speedpcupmap:
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x49	; 73	'I'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x55	; 85	'U'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x56	; 86	'V'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x2a	; 42
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
_plnamecursframe:
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
	.db #0x68	; 104	'h'
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
_intro_created:
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x0d	; 13
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x10	; 16
_intro_by:
	.db #0x0e	; 14
	.db #0x25	; 37
_intro_name_sprites:
	.db #0x17	; 23
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x1a	; 26
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x22	; 34
_intro_year:
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x04	; 4
_congrats:
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x13	; 19
	.db #0x1e	; 30
	.db #0x0d	; 13
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x18	; 24
	.db #0x0d	; 13
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1f	; 31
	.db #0x29	; 41
_toobad:
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x10	; 16
_youwin:
	.db #0x25	; 37
	.db #0x1b	; 27
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x15	; 21
	.db #0x1a	; 26
_youlose:
	.db #0x25	; 37
	.db #0x1b	; 27
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x11	; 17
_cpuname:
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x21	; 33
;main.c:136: void set_playfield_bkg() {
;	---------------------------------
; Function set_playfield_bkg
; ---------------------------------
_set_playfield_bkg::
;main.c:137: set_bkg_data(42, 6, speedpbkgtiles);
	ld	hl, #_speedpbkgtiles
	push	hl
	ld	de, #0x062a
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:138: set_bkg_tiles(0, 0, 20, 18, speedpgamemap);
	ld	hl, #_speedpgamemap
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
;main.c:139: }
	ret
;main.c:142: void default_settings() {
;	---------------------------------
; Function default_settings
; ---------------------------------
_default_settings::
;main.c:144: autospeedflg = 1;
	ld	hl, #_autospeedflg
	ld	(hl), #0x01
;main.c:145: ball_sp_opt_ind = 0;
	ld	hl, #_ball_sp_opt_ind
	ld	(hl), #0x00
;main.c:146: roundlimit = 10;
	ld	hl, #_roundlimit
	ld	(hl), #0x0a
;main.c:147: difficulty = 1;
	ld	hl, #_difficulty
	ld	(hl), #0x01
;main.c:148: padheight = 3;
	ld	hl, #_padheight
	ld	(hl), #0x03
;main.c:149: padspeed = 3;
	ld	hl, #_padspeed
	ld	(hl), #0x03
;main.c:150: }
	ret
;main.c:153: void custom_delay(UINT16 cycles) {
;	---------------------------------
; Function custom_delay
; ---------------------------------
_custom_delay::
;main.c:154: for(i = 0; i < cycles; i++) {
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
;main.c:155: wait_vbl_done();
	call	_wait_vbl_done
;main.c:154: for(i = 0; i < cycles; i++) {
	ld	hl, #_i
	inc	(hl)
;main.c:157: }
	jr	00103$
;main.c:160: void center_ball() {
;	---------------------------------
; Function center_ball
; ---------------------------------
_center_ball::
;main.c:161: ball.x = ball.y = startballposxy;
	ld	hl, #_startballposxy
	ld	b, (hl)
	ld	hl, #(_ball + 0x0001)
	ld	(hl), b
	ld	hl, #_ball
	ld	(hl), b
;main.c:162: move_sprite(0, ball.x, ball.y);
	ld	hl, #_ball
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:162: move_sprite(0, ball.x, ball.y);
;main.c:163: }
	ret
;main.c:166: void move_ball(Paddle * ppl1, Paddle * pcpu) {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
	dec	sp
;main.c:167: UINT8 nextballposx = ball.x + ball.speedx;
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, (#(_ball + 0x0002) + 0)
	add	a, c
	ld	c, a
;main.c:168: UINT8 nextballposy = ball.y + ball.speedy;
	ld	hl, #(_ball + 0x0001)
	ld	b, (hl)
	ld	a, (#(_ball + 0x0003) + 0)
	add	a, b
	ld	b, a
;main.c:169: if(hits_walls(nextballposy, 8)) {
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
;main.c:170: ball.speedy *= -1;
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
;main.c:172: if(hits_paddle(nextballposx, nextballposy, ppl1)) {
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
;main.c:173: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:174: ball.speedy = get_bounce_off_dir_y(ppl1);
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
;main.c:175: } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
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
;main.c:176: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:177: ball.speedy = get_bounce_off_dir_y(pcpu);
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
;main.c:179: ball.x += ball.speedx;
	ld	a, (#_ball + 0)
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	add	a, c
	ld	(#_ball),a
;main.c:180: ball.y += ball.speedy;
	ld	a, (#(_ball + 0x0001) + 0)
	ld	hl, #(_ball + 0x0003)
	ld	c, (hl)
	add	a, c
	ld	(#(_ball + 0x0001)),a
;main.c:181: scroll_sprite(0, ball.speedx, ball.speedy);
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
;main.c:181: scroll_sprite(0, ball.speedx, ball.speedy);
;main.c:182: }
	inc	sp
	ret
;main.c:185: UBYTE hits_walls(UINT8 nexty, UINT8 objheight) {
;	---------------------------------
; Function hits_walls
; ---------------------------------
_hits_walls::
;main.c:186: return nexty < bkgborderup || nexty + objheight > bkgborderdown;
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
;main.c:187: }
	ret
;main.c:190: void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {
;	---------------------------------
; Function init_paddle
; ---------------------------------
_init_paddle::
	add	sp, #-5
;main.c:193: pdl->x = posx;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:194: pdl->y = posy;
	ld	c, e
	ld	b, d
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:195: pdl->firsttile = firsttilenum;
	inc	de
	inc	de
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	(de), a
;main.c:197: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
;main.c:198: set_sprite_tile(firsttilenum, 1);
	ldhl	sp,	#9
	ld	e, (hl)
;main.c:197: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
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
;main.c:199: move_sprite(firsttilenum, posx, posy);
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
;main.c:200: return;
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
;main.c:203: move_sprite(firsttilenum, posx, posy);
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
;main.c:206: tileind = firsttilenum + 1;
	ld	a, e
	inc	a
	ld	(#_tileind),a
;main.c:207: i = 1;
	ld	hl, #_i
	ld	(hl), #0x01
;main.c:208: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
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
;main.c:209: set_sprite_tile(tileind, 3);
	ld	hl, #_tileind
	ld	e, (hl)
;main.c:208: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
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
;main.c:210: move_sprite(tileind, posx, posy + i * 8);
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
;main.c:211: tileind++;
	ld	hl, #_tileind
	inc	(hl)
;main.c:212: i++;
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
;main.c:216: set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
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
;main.c:217: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
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
;main.c:217: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
00116$:
;main.c:219: }
	add	sp, #5
	ret
;main.c:222: void set_pad_sectors() {
;	---------------------------------
; Function set_pad_sectors
; ---------------------------------
_set_pad_sectors::
;main.c:225: padsectors[0] = padheight * 2; // 25%
	ld	bc, #_padsectors+0
	ld	hl, #_padheight
	ld	a, (hl)
	add	a, a
	ld	(bc), a
;main.c:226: padsectors[1] = padheight * 4; // 50%
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	(de), a
;main.c:227: padsectors[2] = padheight * 6; // 75%
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	(bc), a
;main.c:228: }
	ret
;main.c:231: void move_paddle(Paddle * pdl, INT8 pdlspd) {
;	---------------------------------
; Function move_paddle
; ---------------------------------
_move_paddle::
	add	sp, #-9
;main.c:232: UINT8 nextpdly = pdl->y + pdlspd;
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
;main.c:233: if(!hits_walls(nextpdly, padheight * 8)) {
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
;main.c:234: scroll_paddle_tiles(pdl, pdlspd);
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
;main.c:235: pdl->y += pdlspd;
	ld	a, (bc)
	ldhl	sp,	#13
	add	a, (hl)
	ld	(bc), a
	jp	00107$
00105$:
;main.c:236: } else if(pdl->y > bkgborderup || pdl->y + padheight * 8 < bkgborderdown) {
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
;main.c:238: INT8 adjspd = pdlspd < 0 ? bkgborderup - pdl->y : bkgborderdown - (pdl->y + padheight * 8);
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
;main.c:239: scroll_paddle_tiles(pdl, adjspd);
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
;main.c:240: pdl->y += adjspd;
	ld	a, (bc)
	add	a, d
	ld	(bc), a
00107$:
;main.c:242: }
	add	sp, #9
	ret
;main.c:245: void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp) {
;	---------------------------------
; Function scroll_paddle_tiles
; ---------------------------------
_scroll_paddle_tiles::
	dec	sp
;main.c:246: for(i = 0; i != padheight; i++) {
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
;main.c:247: scroll_sprite(pdl->firsttile + i, 0, pdlsp);
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
;main.c:246: for(i = 0; i != padheight; i++) {
	ld	hl, #_i
	inc	(hl)
	jr	00104$
00106$:
;main.c:249: }
	inc	sp
	ret
;main.c:252: UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl) {
;	---------------------------------
; Function hits_paddle
; ---------------------------------
_hits_paddle::
	add	sp, #-6
;main.c:253: return (nextx < pdl->x + 8 && pdl->x < nextx + 8) &&
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
;main.c:254: (nexty < pdl->y + (padheight * 8) && pdl->y < nexty + 8);
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
;main.c:255: }
	add	sp, #6
	ret
;main.c:258: INT8 get_bounce_off_dir_y(Paddle * pad) {
;	---------------------------------
; Function get_bounce_off_dir_y
; ---------------------------------
_get_bounce_off_dir_y::
	add	sp, #-6
;main.c:260: UINT8 ballcentery = ball.y + 4;
	ld	a, (#(_ball + 0x0001) + 0)
	add	a, #0x04
	ld	c, a
;main.c:261: if(ballcentery < pad->y + padsectors[0]) { // < 25%
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
;main.c:262: return -4;
	ld	e, #0xfc
	jp	00115$
00113$:
;main.c:263: } else if(ballcentery < pad->y + padsectors[1]) { // < 50%
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
;main.c:264: return -2;
	ld	e, #0xfe
	jr	00115$
00110$:
;main.c:265: } else if(ballcentery == pad->y + padsectors[1]) { // == 50%
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00107$
	inc	hl
	ld	a, (hl)
;main.c:266: return 0;
	sub	a,b
	jr	NZ, 00107$
	ld	e,a
	jr	00115$
00107$:
;main.c:267: } else if(ballcentery > pad->y + padsectors[2]) { // > 75%
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
;main.c:268: return 4;
	ld	e, #0x04
	jr	00115$
00104$:
;main.c:269: } else if(ballcentery > pad->y + padsectors[1]) { // > 50%
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
;main.c:270: return 2;
	ld	e, #0x02
	jr	00115$
00108$:
;main.c:272: return ball.speedy; // Just getting rid of a compiler warning
	ld	a, (#(_ball + 0x0003) + 0)
	ld	e, a
00115$:
;main.c:273: }
	add	sp, #6
	ret
;main.c:276: void action_cpu() {
;	---------------------------------
; Function action_cpu
; ---------------------------------
_action_cpu::
	dec	sp
;main.c:277: if(ball.x > difficulty_px[difficulty]) { // Determine when the cpu will react to the ball's position
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
;main.c:278: move_paddle(&pdlcpu, pdlcpu.y < ball.y ? padspeed : -padspeed);
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
;main.c:280: }
	inc	sp
	ret
;main.c:283: void auto_speed_adj() {
;	---------------------------------
; Function auto_speed_adj
; ---------------------------------
_auto_speed_adj::
;main.c:284: if(chspeedflgdir == -ball.speedx) {
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
;main.c:286: paddlehitscnt++;
	ld	hl, #_paddlehitscnt
	inc	(hl)
;main.c:287: chspeedflgdir = ball.speedx; // New ball horizontal direction
	ld	a, (#(_ball + 0x0002) + 0)
	ld	(#_chspeedflgdir),a
;main.c:288: if(speedind != 3 && paddlehitscnt == speedchframes[speedind]) {
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
;main.c:289: speedind++; // Checking for next speed threshold
	ld	hl, #_speedind
	inc	(hl)
;main.c:290: ballmvframe--; // Speed up
	ld	hl, #_ballmvframe
	dec	(hl)
;main.c:291: framecnt--; // Preventing overflow when calculating next framecnt
	ld	hl, #_framecnt
	dec	(hl)
;main.c:294: }
	ret
;main.c:297: void upd_number_tiles_arr(UINT8 num) { // Updates numtiles array for displaying purposes
;	---------------------------------
; Function upd_number_tiles_arr
; ---------------------------------
_upd_number_tiles_arr::
	dec	sp
;main.c:298: numtiles[0] = num / 100 == 0 ? 0 : (num / 100) + 3; // blank if num < 100
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
;main.c:299: numtiles[1] = numtiles[0] == 0 && num / 10 % 10 == 0 ? 0 : (num / 10 % 10) + 3; // blank if num < 10
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
;main.c:300: numtiles[2] = num % 10 + 3;
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x03
	ld	(#(_numtiles + 0x0002)),a
;main.c:301: }
	inc	sp
	ret
;main.c:304: void ltrim_blank_num_tiles() { // Shifts values so that the blanks go to the back of the array
;	---------------------------------
; Function ltrim_blank_num_tiles
; ---------------------------------
_ltrim_blank_num_tiles::
;main.c:305: if(numtiles[0] == 0) {
	ld	a, (#_numtiles + 0)
	or	a, a
	ret	NZ
;main.c:306: i = 1;
	ld	hl, #_i
	ld	(hl), #0x01
;main.c:307: while(numtiles[i] == 0) {
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
;main.c:308: i++;
	inc	(hl)
	jr	00101$
00103$:
;main.c:310: for(j = 0; i < 3; i++, j++) {
	ld	hl, #_j
	ld	(hl), #0x00
00108$:
	ld	a, (#_i)
	sub	a, #0x03
	ret	NC
;main.c:311: numtiles[j] = numtiles[i];
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
;main.c:312: numtiles[i] = 0;
	ld	a, #<(_numtiles)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_numtiles)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;main.c:310: for(j = 0; i < 3; i++, j++) {
	inc	(hl)
	ld	hl, #_j
	inc	(hl)
;main.c:315: }
	jr	00108$
;main.c:318: void upd_round_tiles() {
;	---------------------------------
; Function upd_round_tiles
; ---------------------------------
_upd_round_tiles::
;main.c:319: upd_number_tiles_arr(roundcnt);
	ld	a, (#_roundcnt)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:320: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:321: rounddispl[6] = numtiles[0];
	ld	bc, #_rounddispl + 6
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:322: rounddispl[7] = numtiles[1];
	ld	bc, #_rounddispl + 7
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:323: rounddispl[8] = numtiles[2];
	ld	bc, #_rounddispl + 8
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:324: }
	ret
;main.c:327: void upd_score_tiles() {
;	---------------------------------
; Function upd_score_tiles
; ---------------------------------
_upd_score_tiles::
;main.c:328: upd_number_tiles_arr(pl1score);
	ld	a, (#_pl1score)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:329: hud[6] = numtiles[0];
	ld	bc, #_hud + 6
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:330: hud[7] = numtiles[1];
	ld	bc, #_hud + 7
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:331: hud[8] = numtiles[2];
	ld	bc, #_hud + 8
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:333: upd_number_tiles_arr(cpuscore);
	ld	a, (#_cpuscore)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:334: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:335: hud[10] = numtiles[0];
	ld	bc, #_hud + 10
	ld	a, (#_numtiles + 0)
	ld	(bc), a
;main.c:336: hud[11] = numtiles[1];
	ld	bc, #_hud + 11
	ld	a, (#(_numtiles + 0x0001) + 0)
	ld	(bc), a
;main.c:337: hud[12] = numtiles[2];
	ld	bc, #_hud + 12
	ld	a, (#(_numtiles + 0x0002) + 0)
	ld	(bc), a
;main.c:338: }
	ret
;main.c:341: void display_round_num() {
;	---------------------------------
; Function display_round_num
; ---------------------------------
_display_round_num::
;main.c:342: rounddisploffset = roundcnt < 10 ? 0 : 1;
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
;main.c:343: set_bkg_tiles(7 - rounddisploffset, 5, 9, 1, rounddispl);
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
;main.c:344: set_bkg_tiles(5, 12, 11, 1, presst);
	ld	hl, #_presst
	push	hl
	ld	de, #0x010b
	push	de
	ld	de, #0x0c05
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:345: }
	ret
;main.c:348: void erase_round_num() {
;	---------------------------------
; Function erase_round_num
; ---------------------------------
_erase_round_num::
;main.c:349: fill_bkg_rect(7 - rounddisploffset, 5, 9, 1, blanktile);
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
;main.c:350: fill_bkg_rect(5, 12, 11, 1, blanktile);
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
;main.c:351: }
	ret
;main.c:354: void update_hud() {
;	---------------------------------
; Function update_hud
; ---------------------------------
_update_hud::
;main.c:355: set_win_tiles(0, 0, 19, 1, hud);
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
;main.c:356: move_win(12, 134);
;main.c:357: }
	ret
;main.c:360: void increment_score() {
;	---------------------------------
; Function increment_score
; ---------------------------------
_increment_score::
;main.c:361: if(ball.speedx < 0) { // Check the direction of the ball
	ld	hl, #(_ball + 0x0002)
	bit	7, (hl)
	jr	Z, 00102$
;main.c:362: cpuscore++;
	ld	hl, #_cpuscore
	inc	(hl)
	ret
00102$:
;main.c:364: pl1score++;
	ld	hl, #_pl1score
	inc	(hl)
;main.c:366: }
	ret
;main.c:369: void init_game() {
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;main.c:370: set_playfield_bkg();
	call	_set_playfield_bkg
;main.c:371: set_sprite_data(0, 5, speedpspritetiles);
	ld	hl, #_speedpspritetiles
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
;main.c:373: center_ball();
	call	_center_ball
;main.c:377: padinity = 16 + (144 - (padheight * 8)) / 2;
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
	jr	Z, 00109$
	inc	hl
	ld	c, l
	ld	b, h
00109$:
	sra	b
	rr	c
	ld	a, c
	add	a, #0x10
	ld	hl, #_padinity
	ld	(hl), a
;main.c:378: init_paddle(&pdlpl1, 1, 16, padinity);
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
;main.c:379: init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
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
;main.c:380: set_pad_sectors();
	call	_set_pad_sectors
;main.c:382: pl1score = cpuscore = 0;
	ld	hl, #_cpuscore
	ld	(hl), #0x00
	ld	hl, #_pl1score
	ld	(hl), #0x00
;main.c:383: roundcnt = 1;
	ld	hl, #_roundcnt
	ld	(hl), #0x01
;main.c:384: framecnt  = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:385: for(k = 0; k < 3; k++) { // Display player name
	ld	hl, #_k
	ld	(hl), #0x00
00105$:
;main.c:386: hud[k] = plname[k];
	ld	a, #<(_hud)
	ld	hl, #_k
	add	a, (hl)
	ld	c, a
	ld	a, #>(_hud)
	adc	a, #0x00
	ld	b, a
	ld	a, #<(_plname)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_plname)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
;main.c:385: for(k = 0; k < 3; k++) { // Display player name
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00105$
;main.c:388: upd_score_tiles();
	call	_upd_score_tiles
;main.c:389: upd_round_tiles();
	call	_upd_round_tiles
;main.c:390: update_hud();
	call	_update_hud
;main.c:391: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:392: speedind = 0;
	ld	hl, #_speedind
	ld	(hl), #0x00
;main.c:393: paddlehitscnt = 0;
	ld	hl, #_paddlehitscnt
	ld	(hl), #0x00
;main.c:394: ballmvframe = 4;
	ld	hl, #_ballmvframe
	ld	(hl), #0x04
;main.c:396: }
	ret
;main.c:399: void prep_next_round() {
;	---------------------------------
; Function prep_next_round
; ---------------------------------
_prep_next_round::
;main.c:401: scroll_paddle_tiles(&pdlpl1, padinity - pdlpl1.y);
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
;main.c:402: scroll_paddle_tiles(&pdlcpu, padinity - pdlcpu.y);
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
;main.c:403: pdlpl1.y = pdlcpu.y = padinity;
	ld	de, #(_pdlcpu + 0x0001)
	ld	hl, #_padinity
	ld	a, (hl)
	ld	(de), a
	ld	de, #(_pdlpl1 + 0x0001)
	ld	a, (hl)
	ld	(de), a
;main.c:404: roundcnt++;
	ld	hl, #_roundcnt
	inc	(hl)
;main.c:405: upd_round_tiles();
	call	_upd_round_tiles
;main.c:406: framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:407: center_ball();
	call	_center_ball
;main.c:410: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:411: speedind = 1;
	ld	hl, #_speedind
	ld	(hl), #0x01
;main.c:412: ballmvframe = 3;
	ld	hl, #_ballmvframe
	ld	(hl), #0x03
;main.c:413: paddlehitscnt = speedchframes[0];
	ld	a, (#_speedchframes + 0)
	ld	(#_paddlehitscnt),a
;main.c:415: }
	ret
;main.c:418: UBYTE is_round_over() {
;	---------------------------------
; Function is_round_over
; ---------------------------------
_is_round_over::
	add	sp, #-2
;main.c:419: return ball.x + 8 < pdlpl1.x - 8 || ball.x > pdlcpu.x + 16;
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
;main.c:420: }
	add	sp, #2
	ret
;main.c:423: void incr_frame_counter(UINT8 framelimit) {
;	---------------------------------
; Function incr_frame_counter
; ---------------------------------
_incr_frame_counter::
;main.c:424: if(framecnt == framelimit) {
	ld	a, (#_framecnt)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NZ, 00102$
;main.c:425: framecnt = 1; // Resetting the frame counter
	ld	hl, #_framecnt
	ld	(hl), #0x01
	ret
00102$:
;main.c:427: framecnt++;
	ld	hl, #_framecnt
	inc	(hl)
;main.c:429: }
	ret
;main.c:432: void begin_round() {
;	---------------------------------
; Function begin_round
; ---------------------------------
_begin_round::
;main.c:433: display_round_num();
	call	_display_round_num
;main.c:434: while(1) {  // Start round or return to titlescreen
00107$:
;main.c:435: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:436: if(joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00104$
;main.c:437: erase_round_num();
	call	_erase_round_num
;main.c:438: break;
	jr	00108$
00104$:
;main.c:439: } else if(joypad() & J_SELECT) {
	call	_joypad
	bit	6, e
	jr	Z, 00107$
;main.c:440: exitgameflg = 1;
	ld	hl, #_exitgameflg
	ld	(hl), #0x01
;main.c:441: return;
	ret
00108$:
;main.c:445: randindx = rand() % 2; // Random number between 0 and 1
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
;main.c:446: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:447: randindy = rand() % 5; // Random number between 0 and 4
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
;main.c:448: ball.speedx = stspeedpoolx[randindx];
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
;main.c:449: ball.speedy = stspeedpooly[randindy];
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
;main.c:450: chspeedflgdir = ball.speedx;
	ld	hl, #_chspeedflgdir
	ld	(hl), c
;main.c:452: while(1) {
00119$:
;main.c:453: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	jr	Z, 00110$
;main.c:454: auto_speed_adj();
	call	_auto_speed_adj
00110$:
;main.c:456: incr_frame_counter(ballmvframe);
	ld	a, (#_ballmvframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:458: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x04
	jr	Z, 00111$
	sub	a, #0x08
	jr	Z, 00112$
	jr	00113$
;main.c:459: case J_UP:
00111$:
;main.c:460: move_paddle(&pdlpl1, -padspeed);
	xor	a, a
	ld	hl, #_padspeed
	sub	a, (hl)
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:461: break;
	jr	00113$
;main.c:462: case J_DOWN:
00112$:
;main.c:463: move_paddle(&pdlpl1, padspeed);
	ld	a, (#_padspeed)
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:465: }
00113$:
;main.c:467: if(framecnt == ballmvframe) {
	ld	a, (#_framecnt)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	NZ, 00115$
;main.c:468: move_ball(&pdlpl1, &pdlcpu);
	ld	hl, #_pdlcpu
	push	hl
	ld	hl, #_pdlpl1
	push	hl
	call	_move_ball
	add	sp, #4
00115$:
;main.c:471: action_cpu();
	call	_action_cpu
;main.c:472: if(is_round_over()) {
	call	_is_round_over
	ld	a, e
	or	a, a
	jr	Z, 00117$
;main.c:473: increment_score();
	call	_increment_score
;main.c:474: upd_score_tiles();
	call	_upd_score_tiles
;main.c:475: update_hud();
;main.c:476: break;
	jp  _update_hud
00117$:
;main.c:478: wait_vbl_done();
	call	_wait_vbl_done
;main.c:480: }
	jr	00119$
;main.c:483: void start_game() {
;	---------------------------------
; Function start_game
; ---------------------------------
_start_game::
;main.c:484: exitgameflg = 0;
	ld	hl, #_exitgameflg
	ld	(hl), #0x00
;main.c:485: init_game();
	call	_init_game
;main.c:486: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:487: fade_from_black();
	call	_fade_from_black
;main.c:488: while(1) {
00105$:
;main.c:489: begin_round();
	call	_begin_round
;main.c:490: if(exitgameflg || roundcnt == roundlimit) {
	ld	a, (#_exitgameflg)
	or	a, a
	jr	NZ, 00106$
	ld	a, (#_roundcnt)
	ld	hl, #_roundlimit
	sub	a, (hl)
	jr	Z, 00106$
;main.c:493: prep_next_round();
	call	_prep_next_round
	jr	00105$
00106$:
;main.c:495: fade_to_black();
	call	_fade_to_black
;main.c:496: HIDE_WIN; // Remove HUD before going back to the main menu
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;main.c:497: clear_sprite_tiles();
;main.c:498: }
	jp  _clear_sprite_tiles
;main.c:501: void intro_screen() {
;	---------------------------------
; Function intro_screen
; ---------------------------------
_intro_screen::
;main.c:502: fill_bkg_rect(0, 0, 20, 18, blanktile);
	ld	a, (#_blanktile)
	ld	d,a
	ld	e,#0x12
	push	de
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;main.c:503: set_bkg_tiles(6, 3, 7, 1, intro_created);
	ld	hl, #_intro_created
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0306
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:504: set_bkg_tiles(9, 5, 2, 1, intro_by);
	ld	hl, #_intro_by
	push	hl
	ld	de, #0x0102
	push	de
	ld	de, #0x0509
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:505: set_sprite_data(0, 36, speedpfonttiles);
	ld	hl, #_speedpfonttiles
	push	hl
	ld	a, #0x24
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	(hl), #0x50
	inc	hl
	ld	(hl), #0xa8
;main.c:508: for(i = 0; i < 16; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00116$:
;main.c:509: set_sprite_tile(i, intro_name_sprites[i]);
	ld	a, #<(_intro_name_sprites)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_intro_name_sprites)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
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
;main.c:510: set_sprite_prop(i, 0x20);
	ld	hl, #_i
	ld	e, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1191: shadow_OAM[nb].prop=prop;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
;main.c:509: set_sprite_tile(i, intro_name_sprites[i]);
	ld	hl, #_i
	ld	c, (hl)
;main.c:511: if(i < 10) {
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00102$
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	(hl), #0x50
	inc	hl
	ld	(hl), #0xa8
;main.c:513: j = i + 5;
	ld	a, (#_i)
	add	a, #0x05
	ld	(#_j),a
	jr	00104$
00102$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	(hl), #0x60
	inc	hl
	ld	(hl), #0xa8
;main.c:516: j = i - 3;
	ld	a, (#_i)
	add	a, #0xfd
	ld	(#_j),a
;main.c:519: while(j < 20) {
00104$:
	ld	a, (#_j)
	sub	a, #0x14
	jr	NC, 00117$
;main.c:520: scroll_sprite(i, -8, 0);
	ld	hl, #_i
	ld	e, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:521: wait_vbl_done();
	call	_wait_vbl_done
;main.c:522: j++;
	ld	hl, #_j
	inc	(hl)
	jr	00104$
00117$:
;main.c:508: for(i = 0; i < 16; i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x10
	jp	C, 00116$
;main.c:525: for(k = 0; k < 16; k++) {
	ld	hl, #_k
	ld	(hl), #0x00
00118$:
;main.c:526: set_sprite_prop(k, 0x00);
	ld	hl, #_k
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1191: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:527: custom_delay(4);
	ld	hl, #0x0004
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:525: for(k = 0; k < 16; k++) {
	ld	hl, #_k
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x10
	jr	C, 00118$
;main.c:530: custom_delay(20);
	ld	hl, #0x0014
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:531: set_bkg_tiles(8, 14, 4, 1, intro_year);
	ld	hl, #_intro_year
	push	hl
	ld	de, #0x0104
	push	de
	ld	de, #0x0e08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:532: custom_delay(60);
	ld	hl, #0x003c
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:533: fade_to_black();
	call	_fade_to_black
;main.c:534: clear_sprite_tiles();
;main.c:535: }
	jp  _clear_sprite_tiles
;main.c:538: void animate_coin_spin() {
;	---------------------------------
; Function animate_coin_spin
; ---------------------------------
_animate_coin_spin::
;main.c:539: if(framecnt == coinspinframe) {
	ld	hl, #_coinspinframe
	ld	c, (hl)
	ld	a, (#_framecnt)
	sub	a, c
	ret	NZ
;main.c:540: cointile += cointileincr;
	ld	a, (#_cointile)
	ld	hl, #_cointileincr
	add	a, (hl)
	ld	hl, #_cointile
	ld	(hl), a
;main.c:541: set_sprite_tile(0, cointile);
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), c
;main.c:542: if(cointile == 4) {
	ld	a, (#_cointile)
	sub	a, #0x04
	jr	NZ, 00105$
;main.c:543: cointileincr = -1;
	ld	hl, #_cointileincr
	ld	(hl), #0xff
	ret
00105$:
;main.c:544: } else if(cointile == 1 && cointileincr == -1) {
	ld	a, (#_cointile)
	dec	a
	ret	NZ
	ld	a, (#_cointileincr)
	inc	a
	ret	NZ
;main.c:545: cointileincr = 1;
	ld	hl, #_cointileincr
	ld	(hl), #0x01
;main.c:548: }
	ret
;main.c:551: void move_coin_cursor(INT8 direction, UINT8 fstmenuind, UINT8 lastmenuind) {
;	---------------------------------
; Function move_coin_cursor
; ---------------------------------
_move_coin_cursor::
;main.c:552: if(crntmenuentry == lastmenuind && direction == 1) {
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NZ, 00106$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00106$
;main.c:553: crntmenuentry = fstmenuind;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_crntmenuentry),a
	jr	00107$
00106$:
;main.c:554: } else if(crntmenuentry == fstmenuind && direction == -1) {
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NZ, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;main.c:555: crntmenuentry = lastmenuind;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_crntmenuentry),a
	jr	00107$
00102$:
;main.c:557: crntmenuentry += direction;
	ld	a, (#_crntmenuentry)
	ldhl	sp,	#2
	add	a, (hl)
	ld	(#_crntmenuentry),a
00107$:
;main.c:559: move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
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
;main.c:560: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:561: }
	ret
;main.c:564: void main_menu() {
;	---------------------------------
; Function main_menu
; ---------------------------------
_main_menu::
;main.c:565: set_bkg_data(42, 51, speedptitlelogo);
	ld	hl, #_speedptitlelogo
	push	hl
	ld	de, #0x332a
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:566: set_bkg_tiles(0, 0, 20, 18, speedptitlescreenmap);
	ld	hl, #_speedptitlescreenmap
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
;main.c:567: set_sprite_data(0, 5, speedpcointiles);
	ld	hl, #_speedpcointiles
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:568: move_sprite(0, menuentriesx[0], menuentriesy[0]);
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
;main.c:569: crntmenuentry = 0;
	ld	hl, #_crntmenuentry
	ld	(hl), #0x00
;main.c:570: fade_from_black();
	call	_fade_from_black
;main.c:572: while(1) {
00107$:
;main.c:573: incr_frame_counter(coinspinframe);
	ld	a, (#_coinspinframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:574: animate_coin_spin();
	call	_animate_coin_spin
;main.c:575: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x04
	jr	Z, 00101$
	sub	a, #0x08
	jr	Z, 00102$
	jr	00103$
;main.c:576: case(J_UP):
00101$:
;main.c:577: move_coin_cursor(-1, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_move_coin_cursor
	add	sp, #3
;main.c:578: break;
	jr	00103$
;main.c:579: case(J_DOWN):
00102$:
;main.c:580: move_coin_cursor(1, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_move_coin_cursor
	add	sp, #3
;main.c:582: }
00103$:
;main.c:583: if(joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
;main.c:584: fade_to_black();
;main.c:585: break; // End function execution and check selected entry
	jp	C,_fade_to_black
;main.c:587: wait_vbl_done();
	call	_wait_vbl_done
;main.c:589: }
	jr	00107$
;main.c:592: void options_menu() {
;	---------------------------------
; Function options_menu
; ---------------------------------
_options_menu::
;main.c:593: set_bkg_tiles(0, 0, 20, 18, speedpoptionsscreen);
	ld	hl, #_speedpoptionsscreen
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
;main.c:594: display_all_opts_values();
	call	_display_all_opts_values
;main.c:595: crntmenuentry = 2;
	ld	hl, #_crntmenuentry
	ld	(hl), #0x02
;main.c:596: move_sprite(0, menuentriesx[crntmenuentry], menuentriesy[crntmenuentry]);
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
;main.c:597: fade_from_black();
	call	_fade_from_black
;main.c:599: while(1) {
00123$:
;main.c:600: incr_frame_counter(coinspinframe);
	ld	a, (#_coinspinframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:601: animate_coin_spin();
	call	_animate_coin_spin
;main.c:603: switch(joypad()) {
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
;main.c:617: if(crntmenuentry == 3) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00198$
	xor	a, a
00198$:
	ld	c, a
;main.c:603: switch(joypad()) {
	ld	a,e
	cp	a,#0x10
	jr	Z, 00105$
	sub	a, #0x20
	jr	Z, 00108$
	jr	00111$
;main.c:604: case J_UP:
00101$:
;main.c:605: move_coin_cursor(-1, 2, 9);
	ld	de, #0x0902
	push	de
	ld	a, #0xff
	push	af
	inc	sp
	call	_move_coin_cursor
	add	sp, #3
;main.c:606: break;
	jr	00111$
;main.c:607: case J_DOWN:
00102$:
;main.c:608: move_coin_cursor(1, 2, 9);
	ld	de, #0x0902
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_move_coin_cursor
	add	sp, #3
;main.c:609: break;
	jr	00111$
;main.c:610: case J_LEFT:
00103$:
;main.c:611: change_property(-1, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0xff
	push	de
	call	_change_property
	add	sp, #2
;main.c:612: break;
	jr	00111$
;main.c:613: case J_RIGHT:
00104$:
;main.c:614: change_property(1, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0x01
	push	de
	call	_change_property
	add	sp, #2
;main.c:615: break;
	jr	00111$
;main.c:616: case J_A:
00105$:
;main.c:617: if(crntmenuentry == 3) {
	ld	a, c
	or	a, a
	jr	Z, 00111$
;main.c:618: change_property(10, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_change_property
	add	sp, #2
;main.c:620: break;
	jr	00111$
;main.c:621: case J_B:
00108$:
;main.c:622: if(crntmenuentry == 3) {
	ld	a, c
	or	a, a
	jr	Z, 00111$
;main.c:623: change_property(-10, crntmenuentry);
	ld	a, (#_crntmenuentry)
	ld	d,a
	ld	e,#0xf6
	push	de
	call	_change_property
	add	sp, #2
;main.c:626: }
00111$:
;main.c:627: if(joypad() & (J_START | J_A)) {
	call	_joypad
	ld	a, e
	and	a, #0x90
	jr	Z, 00121$
;main.c:628: if(crntmenuentry == 2) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x02
	jr	NZ, 00118$
;main.c:629: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:630: change_player_name();
	call	_change_player_name
	jr	00121$
00118$:
;main.c:632: else if(crntmenuentry == 8) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x08
	jr	NZ, 00115$
;main.c:633: reset_to_default();
	call	_reset_to_default
	jr	00121$
00115$:
;main.c:634: } else if(crntmenuentry == 9) {
	ld	a, (#_crntmenuentry)
	sub	a, #0x09
	jr	NZ, 00121$
;main.c:635: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:636: break; // Back to main menu
	jp	_fade_to_black
00121$:
;main.c:639: wait_vbl_done();
	call	_wait_vbl_done
;main.c:641: fade_to_black();
;main.c:642: }
	jp	00123$
;main.c:645: void change_property(INT8 units, UINT8 menuentry) {
;	---------------------------------
; Function change_property
; ---------------------------------
_change_property::
;main.c:646: switch(menuentry) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00102$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00103$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00104$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00105$
	jr	00106$
;main.c:647: case 3:
00101$:
;main.c:648: change_cpu(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_cpu
	inc	sp
;main.c:649: break;
	jr	00106$
;main.c:650: case 4:
00102$:
;main.c:651: change_num_rounds(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_num_rounds
	inc	sp
;main.c:652: break;
	jr	00106$
;main.c:653: case 5:
00103$:
;main.c:654: change_pad_height(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_pad_height
	inc	sp
;main.c:655: break;
	jr	00106$
;main.c:656: case 6:
00104$:
;main.c:657: change_pad_speed(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_pad_speed
	inc	sp
;main.c:658: break;
	jr	00106$
;main.c:659: case 7:
00105$:
;main.c:660: change_ball_speed(units);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_change_ball_speed
	inc	sp
;main.c:662: }
00106$:
;main.c:663: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:664: }
	ret
;main.c:667: void display_all_opts_values() {
;	---------------------------------
; Function display_all_opts_values
; ---------------------------------
_display_all_opts_values::
;main.c:668: set_bkg_tiles(15, 1, 3, 1, plname);
	ld	hl, #_plname
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x010f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:669: set_bkg_tiles(15, 3, 4, 1, cpu_options[difficulty]);
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
	ld	de, #0x030f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:670: upd_number_tiles_arr(roundlimit);
	ld	a, (#_roundlimit)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:671: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:672: set_bkg_tiles(15, 5, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x050f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:673: upd_number_tiles_arr(padheight);
	ld	a, (#_padheight)
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:674: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:675: set_bkg_tiles(15, 7, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x070f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:676: set_bkg_tiles(15, 9, 4, 1, pad_sp_options[padspeed - 1]);
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
	ld	de, #0x090f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:677: set_bkg_tiles(15, 11, 4, 1, ball_sp_options[ball_sp_opt_ind]);
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
	ld	de, #0x0b0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:678: }
	ret
;main.c:681: void change_player_name() {
;	---------------------------------
; Function change_player_name
; ---------------------------------
_change_player_name::
	dec	sp
;main.c:682: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;main.c:683: plnameind = 0;
	ld	hl, #_plnameind
	ld	(hl), #0x00
;main.c:684: UINT8 coinframecntprev = framecnt; // Saving current frame count
	ld	a, (#_framecnt)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:685: framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:686: plnameflashval = 0x02;
	ld	hl, #_plnameflashval
	ld	(hl), #0x02
;main.c:687: fontind = plname[0];
	ld	a, (#_plname + 0)
	ld	(#_fontind),a
;main.c:688: while(1) {
00111$:
;main.c:689: incr_frame_counter(plnamecursframe);
	ld	a, (#_plnamecursframe)
	push	af
	inc	sp
	call	_incr_frame_counter
	inc	sp
;main.c:690: if(framecnt == plnamecursframe) {
	ld	hl, #_plnamecursframe
	ld	c, (hl)
	ld	a, (#_framecnt)
	sub	a, c
	jr	NZ, 00102$
;main.c:691: plnameflashval = plnameflashval == 0x02 ? plname[plnameind] : 0x02;
	ld	a, (#_plnameflashval)
	sub	a, #0x02
	jr	NZ, 00115$
	ld	a, #<(_plname)
	ld	hl, #_plnameind
	add	a, (hl)
	ld	c, a
	ld	a, #>(_plname)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	jr	00116$
00115$:
	ld	bc, #0x0002
00116$:
	ld	hl, #_plnameflashval
	ld	(hl), c
;main.c:692: set_bkg_tile_xy(15 + plnameind, 1, plnameflashval);
	ld	a, (#_plnameind)
	add	a, #0x0f
	ld	hl, #_plnameflashval
	ld	h, (hl)
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00102$:
;main.c:694: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00106$
	cp	a, #0x02
	jr	Z, 00105$
	cp	a, #0x04
	jr	Z, 00103$
	sub	a, #0x08
	jr	Z, 00104$
	jr	00107$
;main.c:695: case J_UP:
00103$:
;main.c:696: change_letter_in_name(-1, 3);
	ld	de, #0x03ff
	push	de
	call	_change_letter_in_name
	add	sp, #2
;main.c:697: break;
	jr	00107$
;main.c:698: case J_DOWN:
00104$:
;main.c:699: change_letter_in_name(1, 38);
	ld	de, #0x2601
	push	de
	call	_change_letter_in_name
	add	sp, #2
;main.c:700: break;
	jr	00107$
;main.c:701: case J_LEFT:
00105$:
;main.c:702: move_to_next_letter(-1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_move_to_next_letter
	add	sp, #2
;main.c:703: break;
	jr	00107$
;main.c:704: case J_RIGHT:
00106$:
;main.c:705: move_to_next_letter(1, 2);
	ld	de, #0x0201
	push	de
	call	_move_to_next_letter
	add	sp, #2
;main.c:707: }
00107$:
;main.c:708: if(joypad() & (J_START | J_A)) {
	call	_joypad
	ld	a, e
	and	a, #0x90
	jr	NZ, 00112$
;main.c:711: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
	jp	00111$
00112$:
;main.c:713: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:714: set_bkg_tiles(15, 1, 3, 1, plname);
	ld	hl, #_plname
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x010f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:715: framecnt = coinframecntprev;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_framecnt),a
;main.c:716: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:717: }
	inc	sp
	ret
;main.c:720: void change_letter_in_name(INT8 step, UINT8 limit) {
;	---------------------------------
; Function change_letter_in_name
; ---------------------------------
_change_letter_in_name::
;main.c:721: fontind += fontind == limit ? 0 : step;
	ld	a, (#_fontind)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NZ, 00103$
	ld	bc, #0x0000
	jr	00104$
00103$:
	ldhl	sp,	#2
	ld	a, (hl)
	ld	c, a
	rla
00104$:
	ld	hl, #_fontind
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;main.c:722: plname[plnameind] = fontind;
	ld	bc, #_plname+0
	ld	a, c
	ld	hl, #_plnameind
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (#_fontind)
	ld	(de), a
;main.c:723: set_bkg_tile_xy(15 + plnameind, 1, plname[plnameind]);
	ld	a, c
	ld	hl, #_plnameind
	add	a, (hl)
	ld	c, a
	jr	NC, 00112$
	inc	b
00112$:
	ld	a, (bc)
	ld	b, a
	ld	a, (hl)
	add	a, #0x0f
	push	bc
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:724: }
	ret
;main.c:727: void move_to_next_letter(INT8 step, UINT8 limit) {
;	---------------------------------
; Function move_to_next_letter
; ---------------------------------
_move_to_next_letter::
;main.c:728: set_bkg_tile_xy(15 + plnameind, 1, plname[plnameind]);
	ld	bc, #_plname+0
	ld	a, c
	ld	hl, #_plnameind
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	d, a
	ld	a, (hl)
	add	a, #0x0f
	push	de
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:729: plnameind += plnameind == limit ? 0 : step;
	ld	a, (#_plnameind)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NZ, 00103$
	ld	de, #0x0000
	jr	00104$
00103$:
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
00104$:
	ld	hl, #_plnameind
	ld	a, (hl)
	add	a, e
;main.c:730: fontind = plname[plnameind];
	ld	(hl), a
	add	a,c
	ld	c, a
	jr	NC, 00112$
	inc	b
00112$:
	ld	a, (bc)
	ld	(#_fontind),a
;main.c:731: }
	ret
;main.c:734: void change_cpu(INT8 units) {
;	---------------------------------
; Function change_cpu
; ---------------------------------
_change_cpu::
;main.c:735: if(difficulty + units >= 0 && difficulty + units < 3) {
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
;main.c:736: difficulty += units;
	ld	a, (#_difficulty)
	ldhl	sp,	#2
	add	a, (hl)
	ld	hl, #_difficulty
	ld	(hl), a
;main.c:737: set_bkg_tiles(15, 3, 4, 1, cpu_options[difficulty]);
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
	ld	de, #0x030f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:739: }
	ret
;main.c:742: void change_num_rounds(INT8 units) {
;	---------------------------------
; Function change_num_rounds
; ---------------------------------
_change_num_rounds::
;main.c:743: if(roundlimit + units > 0 && roundlimit + units <= 255) {
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
;main.c:744: roundlimit += units;
	ld	a, (#_roundlimit)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:745: upd_number_tiles_arr(roundlimit);
	ld	(#_roundlimit),a
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:746: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:747: set_bkg_tiles(15, 5, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x050f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:749: }
	ret
;main.c:752: void change_pad_height(INT8 units) {
;	---------------------------------
; Function change_pad_height
; ---------------------------------
_change_pad_height::
;main.c:753: if(padheight + units > 0 && padheight + units < 9) {
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
;main.c:754: padheight += units;
	ld	a, (#_padheight)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:755: upd_number_tiles_arr(padheight);
	ld	(#_padheight),a
	push	af
	inc	sp
	call	_upd_number_tiles_arr
	inc	sp
;main.c:756: ltrim_blank_num_tiles();
	call	_ltrim_blank_num_tiles
;main.c:757: set_bkg_tiles(15, 7, 3, 1, numtiles);
	ld	hl, #_numtiles
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x070f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:759: }
	ret
;main.c:762: void change_pad_speed(INT8 units) {
;	---------------------------------
; Function change_pad_speed
; ---------------------------------
_change_pad_speed::
;main.c:763: if(padspeed + units > 0 && padspeed + units < 5) {
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
;main.c:764: padspeed += units;
	ld	a, (#_padspeed)
	ldhl	sp,	#2
	add	a, (hl)
	ld	hl, #_padspeed
	ld	(hl), a
;main.c:765: set_bkg_tiles(15, 9, 4, 1, pad_sp_options[padspeed - 1]);
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
	ld	de, #0x090f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:767: }
	ret
;main.c:770: void change_ball_speed(INT8 units) {
;	---------------------------------
; Function change_ball_speed
; ---------------------------------
_change_ball_speed::
;main.c:771: if(ball_sp_opt_ind + units >= 0 && ball_sp_opt_ind + units < 5) {
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
;main.c:772: ball_sp_opt_ind += units;
	ld	a, (#_ball_sp_opt_ind)
	ldhl	sp,	#2
	add	a, (hl)
;main.c:773: if(ball_sp_opt_ind == 0) {
	ld	(#_ball_sp_opt_ind),a
	or	a, a
	jr	NZ, 00102$
;main.c:774: autospeedflg = 1;
	ld	hl, #_autospeedflg
	ld	(hl), #0x01
;main.c:775: set_bkg_tiles(15, 11, 4, 1, ball_sp_options[0]);
	ld	hl, #_ball_sp_options
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0104
	push	de
	ld	de, #0x0b0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	ret
00102$:
;main.c:777: autospeedflg = 0;
	ld	hl, #_autospeedflg
	ld	(hl), #0x00
;main.c:778: ballmvframe = 5 - ball_sp_opt_ind;
	ld	hl, #_ball_sp_opt_ind
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	ld	(#_ballmvframe),a
;main.c:779: set_bkg_tiles(15, 11, 4, 1, ball_sp_options[ball_sp_opt_ind]);
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
	ld	de, #0x0b0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:782: }
	ret
;main.c:785: void reset_to_default() {
;	---------------------------------
; Function reset_to_default
; ---------------------------------
_reset_to_default::
;main.c:786: default_settings();
	call	_default_settings
;main.c:787: display_all_opts_values();
	call	_display_all_opts_values
;main.c:788: custom_delay(9);
	ld	hl, #0x0009
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:789: }
	ret
;main.c:792: void fade_to_black() {
;	---------------------------------
; Function fade_to_black
; ---------------------------------
_fade_to_black::
;main.c:793: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:794: for(k = 0; k < 3; k++) {
	ld	hl, #_k
	ld	(hl), #0x00
00106$:
;main.c:795: switch(k) {
	ld	a, (#_k)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_k)
	dec	a
	jr	Z, 00102$
	ld	a, (#_k)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;main.c:796: case 0:
00101$:
;main.c:797: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;main.c:798: break;
	jr	00104$
;main.c:799: case 1:
00102$:
;main.c:800: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:801: break;
	jr	00104$
;main.c:802: case 2:
00103$:
;main.c:803: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;main.c:804: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;main.c:806: }
00104$:
;main.c:807: custom_delay(6);
	ld	hl, #0x0006
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:794: for(k = 0; k < 3; k++) {
	ld	hl, #_k
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
;main.c:809: }
	ret
;main.c:812: void fade_from_black() {
;	---------------------------------
; Function fade_from_black
; ---------------------------------
_fade_from_black::
;main.c:813: custom_delay(5);
	ld	hl, #0x0005
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:814: for(k = 0; k < 3; k++) {
	ld	hl, #_k
	ld	(hl), #0x00
00106$:
;main.c:815: switch(k) {
	ld	a, (#_k)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_k)
	dec	a
	jr	Z, 00102$
	ld	a, (#_k)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;main.c:816: case 0:
00101$:
;main.c:817: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:818: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:819: break;
	jr	00104$
;main.c:820: case 1:
00102$:
;main.c:821: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;main.c:822: break;
	jr	00104$
;main.c:823: case 2:
00103$:
;main.c:824: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;main.c:826: }
00104$:
;main.c:827: custom_delay(5);
	ld	hl, #0x0005
	push	hl
	call	_custom_delay
	add	sp, #2
;main.c:814: for(k = 0; k < 3; k++) {
	ld	hl, #_k
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
;main.c:829: }
	ret
;main.c:832: void clear_sprite_tiles() { // Reset sprite memory
;	---------------------------------
; Function clear_sprite_tiles
; ---------------------------------
_clear_sprite_tiles::
;main.c:833: for(i = 0; i < 40; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
;main.c:834: set_sprite_tile(i, blanktile);
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
;main.c:833: for(i = 0; i < 40; i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00103$
;main.c:836: }
	ret
;main.c:840: void results_sequence() {
;	---------------------------------
; Function results_sequence
; ---------------------------------
_results_sequence::
;main.c:841: fill_bkg_rect(0, 0 , 20, 18, blanktile);
	ld	a, (#_blanktile)
	ld	d,a
	ld	e,#0x12
	push	de
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;main.c:842: set_game_font();
	call	_set_game_font
;main.c:843: set_bkg_data(42, 48, speedpcuptiles);
	ld	hl, #_speedpcuptiles
	push	hl
	ld	de, #0x302a
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:844: set_bkg_tiles(7, 4, 7, 11, speedpcupmap);
	ld	hl, #_speedpcupmap
	push	hl
	ld	de, #0x0b07
	push	de
	ld	de, #0x0407
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:846: if(pl1score > cpuscore) {
	ld	a, (#_cpuscore)
	ld	hl, #_pl1score
	sub	a, (hl)
	jr	NC, 00102$
;main.c:847: set_bkg_tiles(2, 2, 16, 1, congrats);
	ld	hl, #_congrats
	push	hl
	ld	de, #0x0110
	push	de
	ld	de, #0x0202
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:848: set_bkg_tiles(7, 16, 7, 1, youwin);
	ld	hl, #_youwin
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x1007
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:849: set_bkg_tiles(9, 13, 3, 1, plname);
	ld	hl, #_plname
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x0d09
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	jr	00103$
00102$:
;main.c:851: set_bkg_tiles(7, 2, 7, 1, toobad);
	ld	hl, #_toobad
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0207
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:852: set_bkg_tiles(6, 16, 8, 1, youlose);
	ld	hl, #_youlose
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x1006
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;main.c:853: set_bkg_tiles(9, 13, 3, 1, cpuname);
	ld	hl, #_cpuname
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x0d09
	push	de
	call	_set_bkg_tiles
	add	sp, #6
00103$:
;main.c:856: fade_from_black();
	call	_fade_from_black
;main.c:857: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:858: fade_to_black();
;main.c:859: }
	jp  _fade_to_black
;main.c:862: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:863: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:864: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:865: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:867: set_game_font();
	call	_set_game_font
;main.c:868: intro_screen();
	call	_intro_screen
;main.c:869: default_settings();
	call	_default_settings
;main.c:871: while(1) {
00108$:
;main.c:872: cointile = 0;
	ld	hl, #_cointile
	ld	(hl), #0x00
;main.c:873: cointileincr = 1;
	ld	hl, #_cointileincr
	ld	(hl), #0x01
;main.c:874: framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:875: main_menu();
	call	_main_menu
;main.c:876: switch(crntmenuentry) {
	ld	a, (#_crntmenuentry)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_crntmenuentry)
	dec	a
	jr	Z, 00105$
	jr	00108$
;main.c:877: case 0:
00101$:
;main.c:878: start_game();
	call	_start_game
;main.c:879: if(!exitgameflg && (pl1score != cpuscore)) {
	ld	a, (#_exitgameflg)
	or	a, a
	jr	NZ, 00108$
	ld	a, (#_pl1score)
	ld	hl, #_cpuscore
	sub	a, (hl)
	jr	Z, 00108$
;main.c:880: results_sequence();
	call	_results_sequence
;main.c:882: break;
	jr	00108$
;main.c:883: case 1:
00105$:
;main.c:884: options_menu();
	call	_options_menu
;main.c:886: }
;main.c:888: }
	jr	00108$
	.area _CODE
	.area _CABS (ABS)
