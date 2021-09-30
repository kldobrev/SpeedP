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
	.globl _manual_speed_adj
	.globl _auto_speed_adj
	.globl _init_paddle
	.globl _move_ball
	.globl _collides_with_walls
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _itr
	.globl _tileind
	.globl _padheight
	.globl _ballmvframe
	.globl _framecnt
	.globl _ballposy
	.globl _ballposx
	.globl _ballspeedy
	.globl _ballspeedx
	.globl _bkgborderdown
	.globl _bkgborderup
	.globl _pongspritetiles
	.globl _ponggamemap
	.globl _pongbkgtiles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ballspeedx::
	.ds 1
_ballspeedy::
	.ds 1
_ballposx::
	.ds 1
_ballposy::
	.ds 1
_framecnt::
	.ds 1
_ballmvframe::
	.ds 1
_padheight::
	.ds 1
_tileind::
	.ds 1
_itr::
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
;main.c:7: INT8 ballspeedx = 4;
	ld	hl, #_ballspeedx
	ld	(hl), #0x04
;main.c:8: INT8 ballspeedy = 4;
	ld	hl, #_ballspeedy
	ld	(hl), #0x04
;main.c:9: UINT8 ballposx = 84;
	ld	hl, #_ballposx
	ld	(hl), #0x54
;main.c:10: UINT8 ballposy = 84;
	ld	hl, #_ballposy
	ld	(hl), #0x54
;main.c:11: UINT8 framecnt = 0;
	ld	hl, #_framecnt
	ld	(hl), #0x00
;main.c:12: UINT8 ballmvframe = 1; // controlls the ball's speed
	ld	hl, #_ballmvframe
	ld	(hl), #0x01
;main.c:13: UINT8 padheight = 3; // actual height - 1 for ease of calculation
	ld	hl, #_padheight
	ld	(hl), #0x03
;main.c:14: UINT8 tileind = 0;
	ld	hl, #_tileind
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:20: UBYTE collides_with_walls(UINT8 nexty) {
;	---------------------------------
; Function collides_with_walls
; ---------------------------------
_collides_with_walls::
;main.c:21: return nexty < bkgborderup || nexty + 8 > bkgborderdown;
	ld	hl, #_bkgborderup
	ld	c, (hl)
	ldhl	sp,	#2
	ld	a,(hl)
	cp	a,c
	jr	C, 00104$
	ld	b, #0x00
	add	a, #0x08
	ld	c, a
	jr	NC, 00116$
	inc	b
00116$:
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
	jr	Z, 00117$
	bit	7, d
	jr	NZ, 00118$
	cp	a, a
	jr	00118$
00117$:
	bit	7, d
	jr	Z, 00118$
	scf
00118$:
	jr	C, 00104$
	ld	e, #0x00
	ret
00104$:
	ld	e, #0x01
;main.c:22: }
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
_bkgborderup:
	.db #0x20	; 32
_bkgborderdown:
	.db #0x90	; 144
;main.c:24: void move_ball() {
;	---------------------------------
; Function move_ball
; ---------------------------------
_move_ball::
;main.c:25: UINT8 nextballposx = ballposx + ballspeedx;
	ld	a, (#_ballposx)
	ld	hl, #_ballspeedx
	add	a, (hl)
	ld	c, a
;main.c:26: UINT8 nextballposy = ballposy + ballspeedy;
	ld	a, (#_ballposy)
	ld	hl, #_ballspeedy
	add	a, (hl)
;main.c:27: if(collides_with_walls(nextballposy)) {
	push	bc
	push	af
	inc	sp
	call	_collides_with_walls
	inc	sp
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00102$
;main.c:28: ballspeedy *= -1; // Bounce off wall
	xor	a, a
	ld	hl, #_ballspeedy
	sub	a, (hl)
	ld	(hl), a
00102$:
;main.c:30: ballposx = nextballposx;
	ld	hl, #_ballposx
	ld	(hl), c
;main.c:31: ballposy += ballspeedy;
	ld	a, (#_ballposy)
	ld	hl, #_ballspeedy
	add	a, (hl)
	ld	(#_ballposy),a
;main.c:32: scroll_sprite(0, ballspeedx, ballspeedy);
	ld	hl, #_ballspeedy
	ld	d, (hl)
	ld	hl, #_ballspeedx
	ld	e, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, d
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, e
	ld	(bc), a
;main.c:32: scroll_sprite(0, ballspeedx, ballspeedy);
;main.c:33: }
	ret
;main.c:35: void init_paddle(Paddle * pdl, UINT8 firsttilenum,UINT8 posx, UINT8 posy) {
;	---------------------------------
; Function init_paddle
; ---------------------------------
_init_paddle::
	add	sp, #-5
;main.c:38: pdl->x = posx;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:39: pdl->y = posy;
	ld	c, e
	ld	b, d
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:40: pdl->firsttile = firsttilenum;
	inc	de
	inc	de
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	(de), a
;main.c:43: set_sprite_tile(firsttilenum, 1);
	ld	c, (hl)
;main.c:42: if(padheight == 0) { // Paddle is made of 1 tile only
	ld	a, (#_padheight)
	or	a, a
	jr	NZ, 00102$
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM+1+1
	add	hl,de
	ld	(hl), #0x01
;main.c:44: move_sprite(firsttilenum, posx, posy);
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
;main.c:45: return;
	jp	00115$
00102$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#0
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_shadow_OAM+1+1
	add	hl,de
	ld	(hl), #0x02
;main.c:48: move_sprite(firsttilenum, posx, posy);
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:50: tileind = firsttilenum + 1;
	ld	a, c
	inc	a
	ld	(#_tileind),a
;main.c:51: itr = 1;
	ld	hl, #_itr
	ld	(hl), #0x01
;main.c:52: while(tileind != firsttilenum + padheight) { // Config tiles between the first and the last
00103$:
	ld	hl, #_padheight
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_tileind
	ld	e, (hl)
	ld	d, #0x00
;main.c:53: set_sprite_tile(tileind, 3);
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;main.c:52: while(tileind != firsttilenum + padheight) { // Config tiles between the first and the last
	ld	a, e
	sub	a, c
	jr	NZ, 00133$
	ld	a, d
	sub	a, b
	jr	Z, 00105$
00133$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:54: move_sprite(tileind, posx, posy + itr * 8);
	ld	a, (#_itr)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#2
	ld	c, (hl)
	add	a, c
	ld	c, a
	ld	hl, #_tileind
	ld	e, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:55: tileind++;
	ld	hl, #_tileind
	inc	(hl)
;main.c:56: itr++;
	ld	hl, #_itr
	inc	(hl)
	jr	00103$
00105$:
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x02
;main.c:60: set_sprite_prop(tileind, 0x40); // Flip the last tile vertically
	ld	hl, #_tileind
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
	ld	(hl), #0x40
;main.c:61: move_sprite(tileind, posx, posy + padheight * 8);
	ld	a, (#_padheight)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#2
	ld	c, (hl)
	add	a, c
	ld	c, a
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (#_tileind)
	ld	h, #0x00
	ld	l, a
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
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;main.c:61: move_sprite(tileind, posx, posy + padheight * 8);
00115$:
;main.c:63: }
	add	sp, #5
	ret
;main.c:65: void auto_speed_adj() {
;	---------------------------------
; Function auto_speed_adj
; ---------------------------------
_auto_speed_adj::
;main.c:67: }
	ret
;main.c:69: void manual_speed_adj() {
;	---------------------------------
; Function manual_speed_adj
; ---------------------------------
_manual_speed_adj::
;main.c:71: }
	ret
;main.c:73: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
;main.c:75: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:76: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:77: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:79: set_bkg_data(0, 7, pongbkgtiles);
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
;main.c:80: set_bkg_tiles(0, 0, 20, 18, ponggamemap);
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
;main.c:82: set_sprite_data(0, 5, pongspritetiles);
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
;main.c:84: move_sprite(0, ballposx, ballposy); // Move ball to the middle of the playing field
	ld	hl, #_ballposy
	ld	b, (hl)
	ld	hl, #_ballposx
	ld	c, (hl)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:88: padheight = 2; // Actual size on screen is 3
	ld	hl, #_padheight
	ld	(hl), #0x02
;main.c:89: init_paddle(&pdlpl1, 2, 24, 80);
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x5018
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_init_paddle
	add	sp, #5
	pop	bc
;main.c:90: init_paddle(&pdlcpu, pdlpl1.firsttile + padheight + 1, 144, 80);
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	hl, #_padheight
	add	a, (hl)
	ld	d, a
	inc	d
	ldhl	sp,	#3
	ld	c, l
	ld	b, h
	ld	hl, #0x5090
	push	hl
	push	de
	inc	sp
	push	bc
	call	_init_paddle
	add	sp, #5
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;C:/Game_Boy_Dev_Tools/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x18
;main.c:94: while(1) {
00104$:
;main.c:95: framecnt += framecnt != ballmvframe ? 1 : -ballmvframe + 1; // Resetting the frame counter
	ld	a, (#_framecnt)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	Z, 00111$
	ld	bc, #0x0001
	jr	00112$
00111$:
	xor	a, a
	ld	hl, #_ballmvframe
	sub	a, (hl)
	ld	c, a
	inc	c
	ld	a, c
	rla
00112$:
	ld	hl, #_framecnt
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;main.c:97: if(framecnt == ballmvframe) {
	ld	a, (hl)
	ld	hl, #_ballmvframe
	sub	a, (hl)
	jr	NZ, 00102$
;main.c:98: move_ball();
	call	_move_ball
00102$:
;main.c:101: wait_vbl_done();
	call	_wait_vbl_done
	jr	00104$
;main.c:104: }
	add	sp, #6
	ret
	.area _CODE
	.area _CABS (ABS)
