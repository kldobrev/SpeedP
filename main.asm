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
	.globl _action_cpu
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
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
	.globl _itr
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
	.globl _speedchframes
	.globl _bkgborderdown
	.globl _bkgborderup
	.globl _stspeedpooly
	.globl _stspeedpoolx
	.globl _difficulty_px
	.globl _startballposxy
	.globl _pongspritetiles
	.globl _ponggamemap
	.globl _pongbkgtiles
	.globl _set_pad_sectors
	.globl _hits_walls
	.globl _hits_paddle
	.globl _get_bounce_off_dir_y
	.globl _move_ball
	.globl _init_paddle
	.globl _scroll_paddle_tiles
	.globl _move_paddle
	.globl _auto_speed_adj
	.globl _init_game
	.globl _prep_next_round
	.globl _begin_round
	.globl _is_round_over
	.globl _default_settings
	.globl _start_game
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
_itr::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:58: void set_pad_sectors() {
;	---------------------------------
; Function set_pad_sectors
; ---------------------------------
_set_pad_sectors::
;main.c:61: padsectors[0] = padheight * 2; // 25%
	ld	bc, #_padsectors+0
	ld	hl, #_padheight
	ld	a, (hl)
	add	a, a
	ld	(bc), a
;main.c:62: padsectors[1] = padheight * 4; // 50%
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	(de), a
;main.c:63: padsectors[2] = padheight * 6; // 75%
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	ld	(bc), a
;main.c:64: }
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_startballposxy:
	.db #0x54	; 84	'T'
_difficulty_px:
	.db #0x8b	; 139
	.db #0x7e	; 126
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
	.db #0x24	; 36
;main.c:66: UBYTE hits_walls(UINT8 nexty, UINT8 objheight) {
;	---------------------------------
; Function hits_walls
; ---------------------------------
_hits_walls::
;main.c:67: return nexty < bkgborderup || nexty + objheight > bkgborderdown;
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
;main.c:68: }
	ret
;main.c:70: UBYTE hits_paddle(UINT8 nextx, UINT8 nexty, Paddle * pdl) {
;	---------------------------------
; Function hits_paddle
; ---------------------------------
_hits_paddle::
	add	sp, #-6
;main.c:71: return (nextx < pdl->x + 8 && pdl->x < nextx + 8) &&
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
;main.c:72: (nexty < pdl->y + (padheight * 8) && pdl->y < nexty + 8);
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
;main.c:73: }
	add	sp, #6
	ret
;main.c:75: INT8 get_bounce_off_dir_y(Paddle * pad) {
;	---------------------------------
; Function get_bounce_off_dir_y
; ---------------------------------
_get_bounce_off_dir_y::
	add	sp, #-6
;main.c:77: UINT8 ballcentery = ball.y + 4;
	ld	a, (#(_ball + 0x0001) + 0)
	add	a, #0x04
	ld	c, a
;main.c:78: if(ballcentery < pad->y + padsectors[0]) { // < 25%
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
;main.c:79: return -4;
	ld	e, #0xfc
	jp	00115$
00113$:
;main.c:80: } else if(ballcentery < pad->y + padsectors[1]) { // < 50%
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
;main.c:81: return -2;
	ld	e, #0xfe
	jr	00115$
00110$:
;main.c:82: } else if(ballcentery == pad->y + padsectors[1]) { // == 50%
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00107$
	inc	hl
	ld	a, (hl)
;main.c:83: return 0;
	sub	a,b
	jr	NZ, 00107$
	ld	e,a
	jr	00115$
00107$:
;main.c:84: } else if(ballcentery > pad->y + padsectors[2]) { // > 75%
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
;main.c:85: return 4;
	ld	e, #0x04
	jr	00115$
00104$:
;main.c:86: } else if(ballcentery > pad->y + padsectors[1]) { // > 50%
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
;main.c:87: return 2;
	ld	e, #0x02
	jr	00115$
00108$:
;main.c:89: return ball.speedy; // Just getting rid of a compiler warning
	ld	a, (#(_ball + 0x0003) + 0)
	ld	e, a
00115$:
;main.c:90: }
	add	sp, #6
	ret
;main.c:92: void move_ball(Paddle * ppl1, Paddle * pcpu) {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
	dec	sp
;main.c:93: UINT8 nextballposx = ball.x + ball.speedx;
	ld	hl, #_ball
	ld	c, (hl)
	ld	a, (#(_ball + 0x0002) + 0)
	add	a, c
	ld	c, a
;main.c:94: UINT8 nextballposy = ball.y + ball.speedy;
	ld	hl, #(_ball + 0x0001)
	ld	b, (hl)
	ld	a, (#(_ball + 0x0003) + 0)
	add	a, b
	ld	b, a
;main.c:95: if(hits_walls(nextballposy, 8)) {
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
;main.c:96: ball.speedy *= -1;
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
;main.c:98: if(hits_paddle(nextballposx, nextballposy, ppl1)) {
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
;main.c:99: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:100: ball.speedy = get_bounce_off_dir_y(ppl1);
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
;main.c:101: } else if(hits_paddle(nextballposx, nextballposy, pcpu)) {
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
;main.c:102: ball.speedx *= -1;
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:103: ball.speedy = get_bounce_off_dir_y(pcpu);
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
;main.c:105: ball.x += ball.speedx;
	ld	a, (#_ball + 0)
	ld	hl, #(_ball + 0x0002)
	ld	c, (hl)
	add	a, c
	ld	(#_ball),a
;main.c:106: ball.y += ball.speedy;
	ld	a, (#(_ball + 0x0001) + 0)
	ld	hl, #(_ball + 0x0003)
	ld	c, (hl)
	add	a, c
	ld	(#(_ball + 0x0001)),a
;main.c:107: scroll_sprite(0, ball.speedx, ball.speedy);
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
;main.c:107: scroll_sprite(0, ball.speedx, ball.speedy);
;main.c:108: }
	inc	sp
	ret
;main.c:110: void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {
;	---------------------------------
; Function init_paddle
; ---------------------------------
_init_paddle::
	add	sp, #-5
;main.c:113: pdl->x = posx;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:114: pdl->y = posy;
	ld	c, e
	ld	b, d
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:115: pdl->firsttile = firsttilenum;
	inc	de
	inc	de
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	(de), a
;main.c:117: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
;main.c:118: set_sprite_tile(firsttilenum, 1);
	ldhl	sp,	#9
	ld	e, (hl)
;main.c:117: if(padheight - 1 == 0) { // Paddle is made of 1 tile only
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
;main.c:119: move_sprite(firsttilenum, posx, posy);
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
;main.c:120: return;
	jp	00115$
00102$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#0
	ld	(hl), e
	xor	a, a
	inc	hl
	ld	(hl), a
	pop	bc
	push	bc
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_shadow_OAM+1+1
	add	hl,bc
	ld	(hl), #0x02
;main.c:123: move_sprite(firsttilenum, posx, posy);
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
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
;main.c:125: tileind = firsttilenum + 1;
	ld	a, e
	inc	a
	ld	(#_tileind),a
;main.c:126: itr = 1;
	ld	hl, #_itr
	ld	(hl), #0x01
;main.c:127: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
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
;main.c:128: set_sprite_tile(tileind, 3);
	ld	hl, #_tileind
	ld	e, (hl)
;main.c:127: while(tileind != firsttilenum + padheight - 1) { // Config tiles between the first and the last
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00133$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00105$
00133$:
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
;main.c:129: move_sprite(tileind, posx, posy + itr * 8);
	ld	a, (#_itr)
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
;main.c:130: tileind++;
	ld	hl, #_tileind
	inc	(hl)
;main.c:131: itr++;
	ld	hl, #_itr
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
;main.c:135: set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
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
;main.c:136: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
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
;main.c:136: move_sprite(tileind, posx, posy + (padheight - 1) * 8);
00115$:
;main.c:138: }
	add	sp, #5
	ret
;main.c:140: void scroll_paddle_tiles(Paddle * pdl, INT8 pdlsp) {
;	---------------------------------
; Function scroll_paddle_tiles
; ---------------------------------
_scroll_paddle_tiles::
	dec	sp
;main.c:141: for(itr = 0; itr != padheight; itr++) {
	ld	hl, #_itr
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
	ld	a, (#_itr)
	ld	hl, #_padheight
	sub	a, (hl)
	jr	Z, 00106$
;main.c:142: scroll_sprite(pdl->firsttile + itr, 0, pdlsp);
	ld	a, (de)
	ld	hl, #_itr
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
;main.c:141: for(itr = 0; itr != padheight; itr++) {
	ld	hl, #_itr
	inc	(hl)
	jr	00104$
00106$:
;main.c:144: }
	inc	sp
	ret
;main.c:146: void move_paddle(Paddle * pdl, INT8 pdlspd) {
;	---------------------------------
; Function move_paddle
; ---------------------------------
_move_paddle::
	add	sp, #-9
;main.c:147: UINT8 nextpdly = pdl->y + pdlspd;
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
;main.c:148: if(!hits_walls(nextpdly, padheight * 8)) {
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
;main.c:149: scroll_paddle_tiles(pdl, pdlspd);
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
;main.c:150: pdl->y += pdlspd;
	ld	a, (bc)
	ldhl	sp,	#13
	add	a, (hl)
	ld	(bc), a
	jp	00107$
00105$:
;main.c:151: } else if(pdl->y > bkgborderup || pdl->y + padheight * 8 < bkgborderdown) {
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
;main.c:153: INT8 adjspd = pdlspd < 0 ? bkgborderup - pdl->y : bkgborderdown - (pdl->y + padheight * 8);
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
;main.c:154: scroll_paddle_tiles(pdl, adjspd);
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
;main.c:155: pdl->y += adjspd;
	ld	a, (bc)
	add	a, d
	ld	(bc), a
00107$:
;main.c:157: }
	add	sp, #9
	ret
;main.c:159: void action_cpu() {
;	---------------------------------
; Function action_cpu
; ---------------------------------
_action_cpu::
	dec	sp
;main.c:160: if(ball.x > difficulty_px[difficulty]) { // Determine when the cpu will react to the ball's position
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
;main.c:161: move_paddle(&pdlcpu, pdlcpu.y < ball.y ? padspeed : -padspeed);
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
;main.c:163: }
	inc	sp
	ret
;main.c:166: void auto_speed_adj() {
;	---------------------------------
; Function auto_speed_adj
; ---------------------------------
_auto_speed_adj::
;main.c:167: if(chspeedflgdir == -ball.speedx) {
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
;main.c:169: paddlehitscnt++;
	ld	hl, #_paddlehitscnt
	inc	(hl)
;main.c:170: chspeedflgdir = ball.speedx; // New ball horizontal direction
	ld	a, (#(_ball + 0x0002) + 0)
	ld	(#_chspeedflgdir),a
;main.c:171: if(speedind != 3 && paddlehitscnt == speedchframes[speedind]) {
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
;main.c:172: speedind++; // Checking for next speed threshold
	ld	hl, #_speedind
	inc	(hl)
;main.c:173: ballmvframe--; // Speed up
	ld	hl, #_ballmvframe
	dec	(hl)
;main.c:174: framecnt--; // Preventing overflow when calculating next framecnt
	ld	hl, #_framecnt
	dec	(hl)
;main.c:177: }
	ret
;main.c:180: void init_game() {
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;main.c:181: set_bkg_data(0, 7, pongbkgtiles);
	ld	hl, #_pongbkgtiles
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:182: set_bkg_tiles(0, 0, 20, 18, ponggamemap);
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
;main.c:184: set_sprite_data(0, 5, pongspritetiles);
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
;main.c:186: ball.x = ball.y = startballposxy;
	ld	hl, #_startballposxy
	ld	b, (hl)
	ld	hl, #(_ball + 0x0001)
	ld	(hl), b
	ld	hl, #_ball
	ld	(hl), b
;main.c:187: move_sprite(0, ball.x, ball.y); // Move ball to the middle of the playing field
	ld	hl, #_ball
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:191: padinity = 16 + (144 - (padheight * 8)) / 2;
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
	jr	Z, 00108$
	inc	hl
	ld	c, l
	ld	b, h
00108$:
	sra	b
	rr	c
	ld	a, c
	add	a, #0x10
	ld	hl, #_padinity
	ld	(hl), a
;main.c:192: init_paddle(&pdlpl1, 2, 16, padinity);
	ld	d, (hl)
	ld	e,#0x10
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_init_paddle
	add	sp, #5
;main.c:193: init_paddle(&pdlcpu, pdlpl1.firsttile + padheight, 152, padinity);
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
;main.c:194: set_pad_sectors();
	call	_set_pad_sectors
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x18
;main.c:197: pl1score = cpuscore = 0;
	ld	hl, #_cpuscore
	ld	(hl), #0x00
	ld	hl, #_pl1score
	ld	(hl), #0x00
;main.c:198: roundcnt = 1;
	ld	hl, #_roundcnt
	ld	(hl), #0x01
;main.c:199: framecnt  = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:200: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:201: speedind = 0;
	ld	hl, #_speedind
	ld	(hl), #0x00
;main.c:202: paddlehitscnt = 0;
	ld	hl, #_paddlehitscnt
	ld	(hl), #0x00
;main.c:203: ballmvframe = 4;
	ld	hl, #_ballmvframe
	ld	(hl), #0x04
;main.c:205: }
	ret
;main.c:207: void prep_next_round() {
;	---------------------------------
; Function prep_next_round
; ---------------------------------
_prep_next_round::
;main.c:209: ball.x = ball.y = startballposxy;
	ld	hl, #_startballposxy
	ld	b, (hl)
	ld	hl, #(_ball + 0x0001)
	ld	(hl), b
	ld	hl, #_ball
	ld	(hl), b
;main.c:210: move_sprite(0, ball.x, ball.y);
	ld	hl, #_ball
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:213: scroll_paddle_tiles(&pdlpl1, padinity - pdlpl1.y);
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
;main.c:214: scroll_paddle_tiles(&pdlcpu, padinity - pdlcpu.y);
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
;main.c:215: pdlpl1.y = pdlcpu.y = padinity;
	ld	de, #(_pdlcpu + 0x0001)
	ld	hl, #_padinity
	ld	a, (hl)
	ld	(de), a
	ld	de, #(_pdlpl1 + 0x0001)
	ld	a, (hl)
	ld	(de), a
;main.c:216: roundcnt++;
	ld	hl, #_roundcnt
	inc	(hl)
;main.c:217: framecnt  = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:220: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	ret	Z
;main.c:221: speedind = 1;
	ld	hl, #_speedind
	ld	(hl), #0x01
;main.c:222: ballmvframe = 3;
	ld	hl, #_ballmvframe
	ld	(hl), #0x03
;main.c:223: paddlehitscnt = speedchframes[0];
	ld	a, (#_speedchframes + 0)
	ld	(#_paddlehitscnt),a
;main.c:225: }
	ret
;main.c:227: void begin_round() {
;	---------------------------------
; Function begin_round
; ---------------------------------
_begin_round::
;main.c:229: while(1) {  // Start round or return to titlescreen
00107$:
;main.c:230: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:231: if(joypad() & J_START) {
	call	_joypad
	ld	a, e
	rlca
	jr	C, 00108$
;main.c:233: } else if(joypad() & J_SELECT) {
	call	_joypad
	bit	6, e
	jr	Z, 00107$
;main.c:234: exitgameflg = 1;
	ld	hl, #_exitgameflg
	ld	(hl), #0x01
;main.c:235: return;
	ret
00108$:
;main.c:239: randindx = rand() % 2; // Random number between 0 and 1
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
;main.c:240: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:241: randindy = rand() % 5; // Random number between 0 and 4
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
;main.c:242: ball.speedx = stspeedpoolx[randindx];
	ld	bc, #_stspeedpoolx+0
	ld	a, c
	ld	hl, #_randindx
	add	a, (hl)
	ld	c, a
	jr	NC, 00186$
	inc	b
00186$:
	ld	a, (bc)
	ld	c, a
	ld	hl, #(_ball + 0x0002)
	ld	(hl), c
;main.c:243: ball.speedy = stspeedpooly[randindy];
	ld	de, #_stspeedpooly+0
	ld	a, e
	ld	hl, #_randindy
	add	a, (hl)
	ld	e, a
	jr	NC, 00187$
	inc	d
00187$:
	ld	a, (de)
	ld	(#(_ball + 0x0003)),a
;main.c:244: chspeedflgdir = ball.speedx;
	ld	hl, #_chspeedflgdir
	ld	(hl), c
;main.c:246: while(1) {
00122$:
;main.c:247: if(autospeedflg) {
	ld	a, (#_autospeedflg)
	or	a, a
	jr	Z, 00110$
;main.c:248: auto_speed_adj();
	call	_auto_speed_adj
00110$:
;main.c:251: framecnt += framecnt != ballmvframe ? 1 : -ballmvframe + 1; // Resetting the frame counter
	ld	a, (#_framecnt)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	Z, 00126$
	ld	bc, #0x0001
	jr	00127$
00126$:
	xor	a, a
	ld	hl, #_ballmvframe
	sub	a, (hl)
	ld	c, a
	inc	c
	ld	a, c
	rla
00127$:
	ld	hl, #_framecnt
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;main.c:253: switch(joypad()) {
	call	_joypad
	ld	a, e
	cp	a, #0x04
	jr	Z, 00111$
	sub	a, #0x08
	jr	Z, 00112$
	jr	00113$
;main.c:254: case J_UP:
00111$:
;main.c:255: move_paddle(&pdlpl1, -padspeed);
	xor	a, a
	ld	hl, #_padspeed
	sub	a, (hl)
	ld	b, a
	push	bc
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:256: break;
	jr	00113$
;main.c:257: case J_DOWN:
00112$:
;main.c:258: move_paddle(&pdlpl1, padspeed);
	ld	a, (#_padspeed)
	push	af
	inc	sp
	ld	hl, #_pdlpl1
	push	hl
	call	_move_paddle
	add	sp, #3
;main.c:260: }
00113$:
;main.c:262: if(framecnt == ballmvframe) {
	ld	a, (#_framecnt)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	NZ, 00115$
;main.c:263: move_ball(&pdlpl1, &pdlcpu);
	ld	hl, #_pdlcpu
	push	hl
	ld	hl, #_pdlpl1
	push	hl
	call	_move_ball
	add	sp, #4
00115$:
;main.c:266: action_cpu();
	call	_action_cpu
;main.c:267: if(is_round_over()) {
	call	_is_round_over
	ld	a, e
	or	a, a
	jr	Z, 00120$
;main.c:268: if(ball.x < startballposxy) { // Compare to the middle of the field x
	ld	hl, #_ball
	ld	c, (hl)
	ld	hl, #_startballposxy
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00117$
;main.c:269: pl1score++;
	ld	hl, #_pl1score
	inc	(hl)
	ret
00117$:
;main.c:271: cpuscore++;
	ld	hl, #_cpuscore
	inc	(hl)
;main.c:273: break;
	ret
00120$:
;main.c:275: wait_vbl_done();
	call	_wait_vbl_done
;main.c:277: }
	jp	00122$
;main.c:279: UBYTE is_round_over() {
;	---------------------------------
; Function is_round_over
; ---------------------------------
_is_round_over::
	add	sp, #-2
;main.c:280: return ball.x + 8 < pdlpl1.x - 8 || ball.x > pdlcpu.x + 16;
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
;main.c:281: }
	add	sp, #2
	ret
;main.c:284: void default_settings() {
;	---------------------------------
; Function default_settings
; ---------------------------------
_default_settings::
;main.c:286: autospeedflg = 1;
	ld	hl, #_autospeedflg
	ld	(hl), #0x01
;main.c:287: roundlimit = 25;
	ld	hl, #_roundlimit
	ld	(hl), #0x19
;main.c:288: difficulty = 1;
	ld	hl, #_difficulty
	ld	(hl), #0x01
;main.c:289: padheight = 3;
	ld	hl, #_padheight
	ld	(hl), #0x03
;main.c:290: padspeed = 3;
	ld	hl, #_padspeed
	ld	(hl), #0x03
;main.c:291: }
	ret
;main.c:293: void start_game() {
;	---------------------------------
; Function start_game
; ---------------------------------
_start_game::
;main.c:295: exitgameflg = 0;
	ld	hl, #_exitgameflg
	ld	(hl), #0x00
;main.c:296: init_game();
	call	_init_game
;main.c:297: while(1) {
00105$:
;main.c:298: begin_round();
	call	_begin_round
;main.c:299: if(exitgameflg || roundcnt == roundlimit) {
	ld	a, (#_exitgameflg)
	or	a, a
	ret	NZ
	ld	a, (#_roundcnt)
	ld	hl, #_roundlimit
	sub	a, (hl)
	ret	Z
;main.c:302: prep_next_round();
	call	_prep_next_round
;main.c:304: }
	jr	00105$
;main.c:306: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:308: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:309: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:310: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:312: default_settings();
	call	_default_settings
;main.c:313: start_game();
;main.c:315: }
	jp  _start_game
	.area _CODE
	.area _CABS (ABS)
