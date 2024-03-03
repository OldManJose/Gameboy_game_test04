;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setWindowStat
	.globl _loadDialogue
	.globl _actualMap
	.globl _loadNewBackGround
	.globl _fadeIn
	.globl _fadeOut
	.globl _updateEnemyAnim
	.globl _updateAnim
	.globl _setSprite
	.globl _enemyAttack
	.globl _dash
	.globl _jump
	.globl _hitSurface
	.globl _backGroundCollision
	.globl _performtDelay
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_win_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _joypad
	.globl _e_animation_tiles2
	.globl _e_animation_tiles
	.globl _animation_tiles2
	.globl _animation_tiles
	.globl _speedD
	.globl _speedJ
	.globl _from
	.globl _enemySet
	.globl _scrollAviable
	.globl _frame
	.globl _offset
	.globl _r_stat_003
	.globl _r_stat_002
	.globl _r_stat_001
	.globl _w_dialogue_003
	.globl _w_dialogue_002
	.globl _w_dialogue_001
	.globl _r_portrait_tile
	.globl _interior_map
	.globl _interior_tiles
	.globl _sprites
	.globl _church_map
	.globl _tiles_church
	.globl _carryRow
	.globl _reDash
	.globl _dashAviable
	.globl _jumpAllow
	.globl _faceing
	.globl _onAnim
	.globl _dashCoolDown
	.globl _downPCounter
	.globl _sCounter
	.globl _e_animation_counter
	.globl _e_frame_count
	.globl _dCounter
	.globl _sX
	.globl _i
	.globl _ePosY
	.globl _ePosX
	.globl _floorPosition
	.globl _boost
	.globl _ii
	.globl _tile_anim_count
	.globl _pPosY
	.globl _pPosX
	.globl _animation_counter
	.globl _frame_count
	.globl _door
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_frame_count::
	.ds 1
_animation_counter::
	.ds 1
_pPosX::
	.ds 1
_pPosY::
	.ds 1
_tile_anim_count::
	.ds 1
_ii::
	.ds 1
_boost::
	.ds 1
_floorPosition::
	.ds 1
_ePosX::
	.ds 1
_ePosY::
	.ds 1
_i::
	.ds 1
_sX::
	.ds 1
_dCounter::
	.ds 1
_e_frame_count::
	.ds 1
_e_animation_counter::
	.ds 1
_sCounter::
	.ds 1
_downPCounter::
	.ds 1
_dashCoolDown::
	.ds 1
_onAnim::
	.ds 1
_faceing::
	.ds 1
_jumpAllow::
	.ds 1
_dashAviable::
	.ds 1
_reDash::
	.ds 1
_carryRow::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_tiles_church::
	.ds 1136
_church_map::
	.ds 360
_sprites::
	.ds 1024
_interior_tiles::
	.ds 688
_interior_map::
	.ds 720
_r_portrait_tile::
	.ds 832
_w_dialogue_001::
	.ds 60
_w_dialogue_002::
	.ds 60
_w_dialogue_003::
	.ds 60
_r_stat_001::
	.ds 60
_r_stat_002::
	.ds 60
_r_stat_003::
	.ds 60
_offset::
	.ds 1
_frame::
	.ds 1
_scrollAviable::
	.ds 1
_enemySet::
	.ds 1
_from::
	.ds 1
_speedJ::
	.ds 9
_speedD::
	.ds 4
_animation_tiles::
	.ds 3
_animation_tiles2::
	.ds 3
_e_animation_tiles::
	.ds 4
_e_animation_tiles2::
	.ds 4
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
;main.c:35: void performtDelay(UINT8 delay){
;	---------------------------------
; Function performtDelay
; ---------------------------------
_performtDelay::
;main.c:36: for(ii=0; ii<delay;ii++)
	ld	hl, #_ii
	ld	(hl), #0x00
00103$:
	ld	a, (#_ii)
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:38: wait_vbl_done();
	call	_wait_vbl_done
;main.c:36: for(ii=0; ii<delay;ii++)
	ld	hl, #_ii
	inc	(hl)
;main.c:40: }
	jr	00103$
_door:
	.db #0x43	;  67	'C'
;main.c:42: UBYTE backGroundCollision(UINT8 newplayerx, UINT8 newplayery, unsigned char *mapUsed){
;	---------------------------------
; Function backGroundCollision
; ---------------------------------
_backGroundCollision::
	add	sp, #-6
;main.c:46: indexTLx = (newplayerx - 8) / 8;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00105$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xffff
	add	hl, de
	ld	c, l
	ld	b, h
00105$:
	inc	sp
	inc	sp
	push	bc
	ldhl	sp,	#1
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;main.c:47: indexTLy = (newplayery - 16) / 8;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00106$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00106$:
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:48: tileindexTL = 20 * indexTLy + indexTLx;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
;main.c:50: if(mapUsed == church_map){
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, #<(_church_map)
	jr	NZ, 00122$
	inc	hl
	ld	a, (hl)
	sub	a, #>(_church_map)
	ld	a, #0x01
	jr	Z, 00123$
00122$:
	xor	a, a
00123$:
	ld	e, #0x00
	or	a, a
	jr	Z, 00102$
;main.c:51: result = mapUsed[tileindexTL] == door[0];
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_door + 0)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00124$
	ld	a, d
	sub	a, b
	ld	a, #0x01
	jr	Z, 00125$
00124$:
	xor	a, a
00125$:
	ld	e, a
00102$:
;main.c:53: return result;
;main.c:54: }
	add	sp, #6
	ret
;main.c:56: UINT8 hitSurface(UINT8 projectedSurf){
;	---------------------------------
; Function hitSurface
; ---------------------------------
_hitSurface::
;main.c:57: if(projectedSurf >= floorPosition){
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_floorPosition
	sub	a, (hl)
	jr	C, 00102$
;main.c:58: return floorPosition;
	ld	e, (hl)
	ret
00102$:
;main.c:60: return -1;
	ld	e, #0xff
;main.c:61: }
	ret
;main.c:63: void jump(){
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x10
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x12
;main.c:69: if(jumpAllow==1)
	ld	a, (#_jumpAllow)
	dec	a
	jr	NZ, 00102$
;main.c:71: jumpAllow = 0;
	ld	hl, #_jumpAllow
	ld	(hl), #0x00
;main.c:72: NR10_REG = 0x29;
	ld	a, #0x29
	ldh	(_NR10_REG + 0), a
;main.c:73: NR11_REG = 0xA9;
	ld	a, #0xa9
	ldh	(_NR11_REG + 0), a
;main.c:74: NR12_REG = 0x67;
	ld	a, #0x67
	ldh	(_NR12_REG + 0), a
;main.c:75: NR13_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR13_REG + 0), a
;main.c:76: NR14_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR14_REG + 0), a
00102$:
;main.c:78: if(boost<9){
	ld	hl, #_boost
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00104$
;main.c:79: boost++;
	inc	(hl)
00104$:
;main.c:82: pPosY =pPosY + speedJ[boost];
	ld	bc, #_speedJ+0
	ld	a, c
	ld	hl, #_boost
	add	a, (hl)
	ld	c, a
	jr	NC, 00161$
	inc	b
00161$:
	ld	a, (bc)
	ld	hl, #_pPosY
	add	a, (hl)
	ld	(hl), a
;main.c:84: possibleFloor = hitSurface(pPosY);
	ld	a, (hl)
	push	af
	inc	sp
	call	_hitSurface
	inc	sp
	ld	b, e
;main.c:90: if(faceing==1){
	ld	a, (#_faceing)
	dec	a
	ld	a, #0x01
	jr	Z, 00163$
	xor	a, a
00163$:
	ld	c, a
;main.c:86: if(possibleFloor > -1)
	ld	e, b
	ld	a,#0xff
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jp	NC, 00112$
;main.c:88: jumpAllow = 1;
	ld	hl, #_jumpAllow
	ld	(hl), #0x01
;main.c:89: boost=0;
	ld	hl, #_boost
	ld	(hl), #0x00
;main.c:90: if(faceing==1){
	ld	a, c
	or	a, a
	jr	Z, 00106$
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:93: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:94: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:95: move_sprite(2,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:95: move_sprite(2,pPosX+offset,pPosY);
	jr	00107$
00106$:
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:101: move_sprite(0,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:102: move_sprite(1,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:103: move_sprite(2,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:103: move_sprite(2,pPosX,pPosY);
00107$:
;main.c:105: NR41_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR41_REG + 0), a
;main.c:106: NR42_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR42_REG + 0), a
;main.c:107: NR43_REG = 0x21;
	ld	a, #0x21
	ldh	(_NR43_REG + 0), a
;main.c:108: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
	ret
00112$:
;main.c:93: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
;main.c:112: if(faceing==1){
	ld	a, c
	or	a, a
	jr	Z, 00109$
;main.c:113: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:114: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	c, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;main.c:115: move_sprite(2,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	c, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;main.c:115: move_sprite(2,pPosX+offset,pPosY);
	ret
00109$:
;main.c:119: move_sprite(0,pPosX+offset,pPosY);
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:120: move_sprite(1,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	c, (hl)
	ld	hl, #_pPosX
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:121: move_sprite(2,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	c, (hl)
	ld	hl, #_pPosX
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:121: move_sprite(2,pPosX,pPosY);
;main.c:124: }
	ret
;main.c:126: void dash(){   
;	---------------------------------
; Function dash
; ---------------------------------
_dash::
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x3c
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x3e
;main.c:131: if(dashAviable==1 && reDash==0){
	ld	a, (#_dashAviable)
	dec	a
	jr	NZ, 00102$
	ld	a, (#_reDash)
	or	a, a
	jr	NZ, 00102$
;main.c:132: dashAviable=0;
	ld	hl, #_dashAviable
	ld	(hl), #0x00
;main.c:133: NR41_REG = 0X3F;
	ld	a, #0x3f
	ldh	(_NR41_REG + 0), a
;main.c:134: NR42_REG = 0XC2;
	ld	a, #0xc2
	ldh	(_NR42_REG + 0), a
;main.c:135: NR43_REG = 0X11;
	ld	a, #0x11
	ldh	(_NR43_REG + 0), a
;main.c:136: NR44_REG = 0X80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00102$:
;main.c:139: dCounter++;
	ld	hl, #_dCounter
	inc	(hl)
;main.c:140: if(dCounter<=4){
	ld	a, #0x04
	sub	a, (hl)
	jr	C, 00108$
;main.c:143: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
;main.c:141: if(faceing==1){
	ld	a, (#_faceing)
	dec	a
	jr	NZ, 00105$
;main.c:142: pPosX+=speedD[dCounter];
	ld	bc, #_speedD+0
	ld	a, c
	ld	hl, #_dCounter
	add	a, (hl)
	ld	c, a
	jr	NC, 00150$
	inc	b
00150$:
	ld	a, (bc)
	ld	hl, #_pPosX
	add	a, (hl)
	ld	(hl), a
;main.c:143: move_sprite(0,pPosX,pPosY);
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:144: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:144: move_sprite(1,pPosX+offset,pPosY);
	jr	00108$
00105$:
;main.c:147: pPosX-=speedD[dCounter];
	ld	bc, #_speedD+0
	ld	a, c
	ld	hl, #_dCounter
	add	a, (hl)
	ld	c, a
	jr	NC, 00151$
	inc	b
00151$:
	ld	a, (bc)
	ld	c, a
	ld	hl, #_pPosX
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;main.c:148: move_sprite(0,pPosX+offset,pPosY);
	ld	a, (hl)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:149: move_sprite(1,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:149: move_sprite(1,pPosX,pPosY);
00108$:
;main.c:152: if(dCounter>3){
	ld	a, #0x03
	ld	hl, #_dCounter
	sub	a, (hl)
	ret	NC
;main.c:153: dCounter=0;
	ld	(hl), #0x00
;main.c:154: reDash=1;
	ld	hl, #_reDash
	ld	(hl), #0x01
;main.c:155: dashAviable=1;
	ld	hl, #_dashAviable
	ld	(hl), #0x01
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:157: set_sprite_tile(1,2);
;main.c:160: }
	ret
;main.c:162: void enemyAttack(){ //necesita correción, el enemigo no alcanza al jugador y se retira después de que pasa cierto limite el jugador
;	---------------------------------
; Function enemyAttack
; ---------------------------------
_enemyAttack::
;main.c:163: if(ePosX >= 0 && from == 0){
	ld	a, (#_from)
	or	a, a
	jr	NZ, 00102$
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 15) + 0)
;main.c:164: set_sprite_prop(3,get_sprite_prop(3) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), c
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 19) + 0)
;main.c:165: set_sprite_prop(4,get_sprite_prop(4) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), c
;main.c:166: ePosX -= 4;
	ld	hl, #_ePosX
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl), a
;main.c:167: move_sprite(3,ePosX,ePosY);
	ld	hl, #_ePosY
	ld	b, (hl)
	ld	hl, #_ePosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:168: move_sprite(4,ePosX+offset,ePosY);
	ld	hl, #_ePosY
	ld	b, (hl)
	ld	a, (#_ePosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:168: move_sprite(4,ePosX+offset,ePosY);
00102$:
;main.c:170: if(from==1){
	ld	a, (#_from)
	dec	a
	jr	NZ, 00105$
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x20
;main.c:173: ePosX += 4;
	ld	hl, #_ePosX
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
;main.c:174: move_sprite(3,ePosX+offset,ePosY);
	ld	hl, #_ePosY
	ld	b, (hl)
	ld	a, (#_ePosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:175: move_sprite(4,ePosX,ePosY);
	ld	hl, #_ePosY
	ld	b, (hl)
	ld	hl, #_ePosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:175: move_sprite(4,ePosX,ePosY);
00105$:
;main.c:179: if(ePosX <= 0){
	ld	a, (#_ePosX)
	or	a, a
	jr	NZ, 00107$
;main.c:180: from = 1;
	ld	hl, #_from
	ld	(hl), #0x01
00107$:
;main.c:182: if(ePosX >= 152){
	ld	a, (#_ePosX)
	sub	a, #0x98
	ret	C
;main.c:183: from = 0;
	ld	hl, #_from
	ld	(hl), #0x00
;main.c:185: }
	ret
;main.c:187: void setSprite(UINT8 posI1, UINT8 posI2, UINT8 firstTile, UINT8 secondTile, UINT8 posx, UINT8 posy){
;	---------------------------------
; Function setSprite
; ---------------------------------
_setSprite::
	add	sp, #-3
;main.c:188: set_sprite_tile(posI1,firstTile);
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	e, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), e
;main.c:189: set_sprite_tile(posI2,secondTile);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	xor	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#1
	ld	(hl), e
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:190: move_sprite(posI1,posx,posy);
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;main.c:191: move_sprite(posI2,posx+offset,posy);
	ld	a, e
	ld	hl, #_offset
	add	a, (hl)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;main.c:191: move_sprite(posI2,posx+offset,posy);
;main.c:192: }
	add	sp, #3
	ret
;main.c:194: void updateAnim(){
;	---------------------------------
; Function updateAnim
; ---------------------------------
_updateAnim::
;main.c:195: frame_count++;
	ld	hl, #_frame_count
	inc	(hl)
;main.c:198: if (frame_count >= FRAMES_TILL_ANIM_UPDATE) {
	ld	a, (hl)
	sub	a, #0x01
	jr	C, 00104$
;main.c:201: frame_count = 0;
	ld	(hl), #0x00
;main.c:204: animation_counter++;
	ld	hl, #_animation_counter
	inc	(hl)
;main.c:205: if (animation_counter >= ANIM_COUNT_TILES){
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00102$
;main.c:206: animation_counter = 0;}
	ld	(hl), #0x00
00102$:
;main.c:209: set_sprite_tile(0, animation_tiles[animation_counter]);
	ld	bc, #_animation_tiles+0
	ld	a, c
	ld	hl, #_animation_counter
	add	a, (hl)
	ld	c, a
	jr	NC, 00128$
	inc	b
00128$:
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:210: set_sprite_tile(1, animation_tiles2[animation_counter]);
	ld	bc, #_animation_tiles2+0
	ld	a, c
	ld	hl, #_animation_counter
	add	a, (hl)
	ld	c, a
	jr	NC, 00129$
	inc	b
00129$:
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), c
;main.c:211: tile_anim_count++;
	ld	hl, #_tile_anim_count
	inc	(hl)
00104$:
;main.c:213: if(tile_anim_count>=3){
	ld	a, (#_tile_anim_count)
	sub	a, #0x03
	ret	C
;main.c:214: onAnim=0;
	ld	hl, #_onAnim
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:217: tile_anim_count=0;
	ld	hl, #_tile_anim_count
	ld	(hl), #0x00
;main.c:220: }
	ret
;main.c:222: void updateEnemyAnim(){
;	---------------------------------
; Function updateEnemyAnim
; ---------------------------------
_updateEnemyAnim::
;main.c:223: e_frame_count++;
	ld	hl, #_e_frame_count
	inc	(hl)
;main.c:226: if (e_frame_count >= FRAMES_TILL_ANIM_UPDATE) {
	ld	a, (hl)
	sub	a, #0x01
	ret	C
;main.c:229: e_frame_count = 0;
	ld	(hl), #0x00
;main.c:232: e_animation_counter++;
	ld	hl, #_e_animation_counter
	inc	(hl)
;main.c:233: if (e_animation_counter >= ENEMY_ANIM_COUNT_TILES){
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00102$
;main.c:234: e_animation_counter = 0;}
	ld	(hl), #0x00
00102$:
;main.c:237: set_sprite_tile(3, e_animation_tiles[e_animation_counter]);
	ld	bc, #_e_animation_tiles+0
	ld	a, c
	ld	hl, #_e_animation_counter
	add	a, (hl)
	ld	c, a
	jr	NC, 00119$
	inc	b
00119$:
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:238: set_sprite_tile(4, e_animation_tiles2[e_animation_counter]);          
	ld	bc, #_e_animation_tiles2+0
	ld	a, c
	ld	hl, #_e_animation_counter
	add	a, (hl)
	ld	c, a
	jr	NC, 00120$
	inc	b
00120$:
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), c
;main.c:238: set_sprite_tile(4, e_animation_tiles2[e_animation_counter]);          
;main.c:241: }
	ret
;main.c:243: void fadeOut(){
;	---------------------------------
; Function fadeOut
; ---------------------------------
_fadeOut::
;main.c:245: for(i=0; i<4;i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00108$:
;main.c:246: switch (i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00106$
;main.c:248: case 0:
00101$:
;main.c:249: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:250: break;
	jr	00106$
;main.c:251: case 1:
00102$:
;main.c:252: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:253: break;
	jr	00106$
;main.c:254: case 2:
00103$:
;main.c:255: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:256: break;
	jr	00106$
;main.c:257: case 3:
00104$:
;main.c:258: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;main.c:262: }
00106$:
;main.c:263: performtDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performtDelay
	inc	sp
;main.c:245: for(i=0; i<4;i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00108$
;main.c:265: }
	ret
;main.c:267: void fadeIn(){
;	---------------------------------
; Function fadeIn
; ---------------------------------
_fadeIn::
;main.c:269: for(i=0; i<3;i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00106$:
;main.c:270: switch (i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;main.c:272: case 0:
00101$:
;main.c:273: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:274: break;
	jr	00104$
;main.c:275: case 1:
00102$:
;main.c:276: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:277: break;
	jr	00104$
;main.c:278: case 2:
00103$:
;main.c:279: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:281: }
00104$:
;main.c:282: performtDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performtDelay
	inc	sp
;main.c:269: for(i=0; i<3;i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
;main.c:284: }
	ret
;main.c:286: void loadNewBackGround(unsigned char *newMap){
;	---------------------------------
; Function loadNewBackGround
; ---------------------------------
_loadNewBackGround::
;main.c:287: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:288: fadeOut(); 
	call	_fadeOut
;main.c:289: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:290: pPosX=4;
	ld	hl, #_pPosX
	ld	(hl), #0x04
;main.c:291: pPosY=120;
	ld	hl, #_pPosY
	ld	(hl), #0x78
;main.c:292: scrollAviable=1;
	ld	hl, #_scrollAviable
	ld	(hl), #0x01
;main.c:293: set_bkg_tiles(0,0,40,18,newMap);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x1228
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:294: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:295: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:296: move_sprite(2,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:297: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:298: fadeIn();
	call	_fadeIn
;main.c:299: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:300: }
	ret
;main.c:302: void actualMap(unsigned char *Map){
;	---------------------------------
; Function actualMap
; ---------------------------------
_actualMap::
;main.c:303: if(Map == interior_map){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #<(_interior_map)
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, #>(_interior_map)
	jr	NZ, 00102$
;main.c:304: setSprite(3,4,28,30,ePosX,ePosY);
	ld	a, (#_ePosY)
	push	af
	inc	sp
	ld	a, (#_ePosX)
	ld	h, a
	ld	l, #0x1e
	push	hl
	ld	hl, #0x1c04
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_setSprite
	add	sp, #6
;main.c:305: enemySet=1;
	ld	hl, #_enemySet
	ld	(hl), #0x01
;main.c:306: backGroundCollision(pPosX+4,pPosY,interior_map);
	ld	bc, #_interior_map
	ld	a, (#_pPosX)
	add	a, #0x04
	push	bc
	ld	hl, #_pPosY
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_backGroundCollision
	add	sp, #4
00102$:
;main.c:308: if(Map == church_map){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #<(_church_map)
	ret	NZ
	inc	hl
	ld	a, (hl)
	sub	a, #>(_church_map)
	ret	NZ
;main.c:309: backGroundCollision(pPosX+4,pPosY,church_map);
	ld	bc, #_church_map
	ld	a, (#_pPosX)
	add	a, #0x04
	push	bc
	ld	hl, #_pPosY
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_backGroundCollision
	add	sp, #4
;main.c:311: }
	ret
;main.c:313: void loadDialogue(unsigned char *diag){    
;	---------------------------------
; Function loadDialogue
; ---------------------------------
_loadDialogue::
;main.c:314: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;c:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x78
	ldh	(_WY_REG + 0), a
;main.c:316: set_win_tiles(0,0,20,3,diag);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:317: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:318: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:319: }
	ret
;main.c:321: void setWindowStat(unsigned char *stat){
;	---------------------------------
; Function setWindowStat
; ---------------------------------
_setWindowStat::
;main.c:322: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:323: set_win_tiles(0,0,20,3,stat);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:324: move_win(7,136);
;main.c:325: }
	ret
;main.c:355: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:357: NR52_REG= 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:358: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:359: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:361: pPosX= 4;
	ld	hl, #_pPosX
	ld	(hl), #0x04
;main.c:362: pPosY= 120;
	ld	hl, #_pPosY
	ld	(hl), #0x78
;main.c:363: ePosX = 140;
	ld	hl, #_ePosX
	ld	(hl), #0x8c
;main.c:364: ePosY = pPosY;
	ld	hl, #_ePosY
	ld	(hl), #0x78
;main.c:365: frame = 0;
	ld	hl, #_frame
	ld	(hl), #0x00
;main.c:366: floorPosition=120;
	ld	hl, #_floorPosition
	ld	(hl), #0x78
;main.c:367: animation_counter = 0;
	ld	hl, #_animation_counter
	ld	(hl), #0x00
;main.c:368: e_animation_counter = 0;
	ld	hl, #_e_animation_counter
	ld	(hl), #0x00
;main.c:369: dCounter = 0;
	ld	hl, #_dCounter
	ld	(hl), #0x00
;main.c:370: downPCounter=0;
	ld	hl, #_downPCounter
	ld	(hl), #0x00
;main.c:371: sCounter=1;
	ld	hl, #_sCounter
	ld	(hl), #0x01
;main.c:372: jumpAllow=1;
	ld	hl, #_jumpAllow
	ld	(hl), #0x01
;main.c:373: faceing=1;
	ld	hl, #_faceing
	ld	(hl), #0x01
;main.c:374: reDash=0;
	ld	hl, #_reDash
	ld	(hl), #0x00
;main.c:375: dashCoolDown=0;
	ld	hl, #_dashCoolDown
	ld	(hl), #0x00
;main.c:376: dashAviable=1;
	ld	hl, #_dashAviable
	ld	(hl), #0x01
;main.c:378: set_bkg_data(72,115,interior_tiles);
	ld	de, #_interior_tiles
	push	de
	ld	hl, #0x7348
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:379: set_win_data(116,164,r_portrait_tile);
	ld	de, #_r_portrait_tile
	push	de
	ld	hl, #0xa474
	push	hl
	call	_set_win_data
	add	sp, #4
;main.c:380: set_bkg_data(0,71,tiles_church);
	ld	de, #_tiles_church
	push	de
	ld	hl, #0x4700
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:381: set_bkg_tiles(0,0,20,18,church_map);
	ld	de, #_church_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:383: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:385: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;main.c:386: set_sprite_data(0,64,sprites);
	ld	de, #_sprites
	push	de
	ld	hl, #0x4000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:387: setSprite(0,1,0,2,pPosX,pPosY);//Heroine
	ld	a, (#_pPosY)
	push	af
	inc	sp
	ld	a, (#_pPosX)
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	hl, #0x01
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_setSprite
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x14
;main.c:390: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:392: loadDialogue(w_dialogue_001);
	ld	de, #_w_dialogue_001
	push	de
	call	_loadDialogue
	pop	hl
;main.c:393: setWindowStat(r_stat_001);
	ld	de, #_r_stat_001
	push	de
	call	_setWindowStat
	pop	hl
;main.c:395: while(1){
00165$:
;main.c:396: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00105$
;main.c:397: if(dashAviable==1 || carryRow==1){
	ld	a, (#_dashAviable)
	dec	a
	jr	Z, 00101$
	ld	a, (#_carryRow)
	dec	a
	jr	NZ, 00105$
00101$:
;main.c:398: pPosX+=2;
	ld	hl, #_pPosX
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 3) + 0)
;main.c:399: set_sprite_prop(0,get_sprite_prop(0) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), c
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 7) + 0)
;main.c:400: set_sprite_prop(1,get_sprite_prop(1) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), c
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 11) + 0)
;main.c:401: set_sprite_prop(2,get_sprite_prop(2) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), c
;main.c:403: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:404: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:405: move_sprite(2,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:406: onAnim=1;
	ld	hl, #_onAnim
	ld	(hl), #0x01
;main.c:407: faceing=1;
	ld	hl, #_faceing
	ld	(hl), #0x01
00105$:
;main.c:410: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00110$
;main.c:411: if(dashAviable==1 || carryRow==1){
	ld	a, (#_dashAviable)
	dec	a
	jr	Z, 00106$
	ld	a, (#_carryRow)
	dec	a
	jr	NZ, 00110$
00106$:
;main.c:412: pPosX-=2;
	ld	hl, #_pPosX
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x20
;main.c:417: move_sprite(0,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:418: move_sprite(1,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:419: move_sprite(2,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:421: onAnim=1;
	ld	hl, #_onAnim
	ld	(hl), #0x01
;main.c:422: faceing=0;
	ld	hl, #_faceing
	ld	(hl), #0x00
00110$:
;main.c:425: if((joypad() & J_A) || jumpAllow==0){
	call	_joypad
	bit	4, e
	jr	NZ, 00111$
	ld	a, (#_jumpAllow)
	or	a, a
	jr	NZ, 00112$
00111$:
;main.c:426: onAnim=0;
	ld	hl, #_onAnim
	ld	(hl), #0x00
;main.c:427: jump();
	call	_jump
00112$:
;main.c:429: if((joypad() & J_B)){
	call	_joypad
	bit	5, e
	jr	Z, 00117$
;main.c:430: if(sCounter==0){
	ld	a, (#_sCounter)
	or	a, a
	jr	NZ, 00117$
;main.c:431: NR41_REG = 0x1B;
	ld	a, #0x1b
	ldh	(_NR41_REG + 0), a
;main.c:432: NR42_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR42_REG + 0), a
;main.c:433: NR43_REG = 0x68;
	ld	a, #0x68
	ldh	(_NR43_REG + 0), a
;main.c:434: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
00117$:
;main.c:438: if(joypad() & J_UP){//Utilizado para entrar a puertasa
	call	_joypad
	bit	2, e
	jr	Z, 00121$
;main.c:439: if(backGroundCollision(pPosX+4,pPosY,church_map)){
	ld	bc, #_church_map
	ld	a, (#_pPosX)
	add	a, #0x04
	push	bc
	ld	hl, #_pPosY
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_backGroundCollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00121$
;main.c:440: loadNewBackGround(interior_map);
	ld	de, #_interior_map
	push	de
	call	_loadNewBackGround
	pop	hl
;main.c:441: actualMap(interior_map);
	ld	de, #_interior_map
	push	de
	call	_actualMap
	pop	hl
;main.c:442: loadDialogue(w_dialogue_003);
	ld	de, #_w_dialogue_003
	push	de
	call	_loadDialogue
	pop	hl
00121$:
;main.c:445: if(joypad() & J_DOWN){//Cambia de objeto disponible
	call	_joypad
	bit	3, e
	jp	Z,00138$
;main.c:446: if(jumpAllow==1){
	ld	a, (#_jumpAllow)
	dec	a
	jp	NZ,00138$
;main.c:447: if(downPCounter >= 2){
	ld	a, (#_downPCounter)
	sub	a, #0x02
	jr	C, 00123$
;main.c:448: sCounter++;
	ld	hl, #_sCounter
	inc	(hl)
;main.c:449: downPCounter=0;
	ld	hl, #_downPCounter
	ld	(hl), #0x00
00123$:
;main.c:451: if(sCounter > 2){
	ld	a, #0x02
	ld	hl, #_sCounter
	sub	a, (hl)
	jr	NC, 00125$
;main.c:452: sCounter=0;
	ld	(hl), #0x00
00125$:
;main.c:454: if(sCounter == 0){//arco
	ld	a, (#_sCounter)
	or	a, a
	jr	NZ, 00130$
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x16
;main.c:456: setWindowStat(r_stat_002);
	ld	de, #_r_stat_002
	push	de
	call	_setWindowStat
	pop	hl
;main.c:403: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	e, (hl)
;main.c:457: if(faceing==1){
	ld	a, (#_faceing)
	dec	a
	jr	NZ, 00127$
;main.c:458: move_sprite(2,pPosX+offset,pPosY);
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:458: move_sprite(2,pPosX+offset,pPosY);
	jr	00128$
00127$:
;main.c:462: move_sprite(2,pPosX,pPosY);
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:462: move_sprite(2,pPosX,pPosY);
00128$:
;main.c:464: dashAviable=0;
	ld	hl, #_dashAviable
	ld	(hl), #0x00
;main.c:465: carryRow=1;
	ld	hl, #_carryRow
	ld	(hl), #0x01
00130$:
;main.c:468: if(sCounter == 1){ //dash disponible
	ld	a, (#_sCounter)
	dec	a
	jr	NZ, 00132$
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x14
;main.c:470: setWindowStat(r_stat_001);
	ld	de, #_r_stat_001
	push	de
	call	_setWindowStat
	pop	hl
;main.c:471: move_sprite(2,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:472: dashAviable=1;
	ld	hl, #_dashAviable
	ld	(hl), #0x01
;main.c:473: carryRow=0;
	ld	hl, #_carryRow
	ld	(hl), #0x00
00132$:
;main.c:475: if(sCounter == 2){ //something else
	ld	a, (#_sCounter)
	sub	a, #0x02
	jr	NZ, 00134$
;main.c:476: setWindowStat(r_stat_003);
	ld	de, #_r_stat_003
	push	de
	call	_setWindowStat
	pop	hl
00134$:
;main.c:478: downPCounter++;
	ld	hl, #_downPCounter
	inc	(hl)
00138$:
;main.c:481: if((((J_B & joypad()) && (joypad() & J_RIGHT)) || dashAviable==0) && (reDash == 0 && sCounter==1)){// Dash a la derecha
	call	_joypad
	bit	5, e
	jr	Z, 00142$
	call	_joypad
	ld	a, e
	rrca
	jr	C, 00144$
00142$:
	ld	a, (#_dashAviable)
	or	a, a
	jr	NZ, 00140$
00144$:
	ld	a, (#_reDash)
	or	a, a
	jr	NZ, 00140$
	ld	a, (#_sCounter)
	dec	a
	jr	NZ, 00140$
;main.c:482: dash();
	call	_dash
00140$:
;main.c:484: if((((J_B & joypad()) && (joypad() & J_LEFT)) || dashAviable==0) && (reDash == 0 && sCounter==1)){// Dash  a la izquierda
	call	_joypad
	bit	5, e
	jr	Z, 00148$
	call	_joypad
	bit	1, e
	jr	NZ, 00150$
00148$:
	ld	a, (#_dashAviable)
	or	a, a
	jr	NZ, 00146$
00150$:
	ld	a, (#_reDash)
	or	a, a
	jr	NZ, 00146$
	ld	a, (#_sCounter)
	dec	a
	jr	NZ, 00146$
;main.c:485: dash();
	call	_dash
00146$:
;main.c:488: if(onAnim==1){
	ld	a, (#_onAnim)
	dec	a
	jr	NZ, 00152$
;main.c:489: updateAnim();
	call	_updateAnim
00152$:
;main.c:491: if(enemySet==1){
	ld	a, (#_enemySet)
	dec	a
	jr	NZ, 00154$
;main.c:492: updateEnemyAnim();
	call	_updateEnemyAnim
;main.c:493: enemyAttack();
	call	_enemyAttack
00154$:
;main.c:495: if(scrollAviable == 1){
	ld	a, (#_scrollAviable)
	dec	a
	jr	NZ, 00159$
;main.c:496: if(pPosX==160){
	ld	a, (#_pPosX)
	sub	a, #0xa0
	jr	NZ, 00159$
;main.c:497: for(sX=0;sX<=152;sX+=8){
	ld	hl, #_sX
	ld	(hl), #0x00
00191$:
;main.c:498: scroll_bkg(sX,0);
	ld	hl, #_sX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, c
	ldh	(_SCX_REG + 0), a
;main.c:499: pPosX-=8;
	ld	hl, #_pPosX
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:500: move_sprite(0,pPosX,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	hl, #_pPosX
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:501: move_sprite(1,pPosX+offset,pPosY);
	ld	hl, #_pPosY
	ld	b, (hl)
	ld	a, (#_pPosX)
	ld	hl, #_offset
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:497: for(sX=0;sX<=152;sX+=8){
	ld	hl, #_sX
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ld	a, #0x98
	sub	a, (hl)
	jr	NC, 00191$
00159$:
;main.c:505: if(reDash==1){// Contador para cooldown de dash
	ld	a, (#_reDash)
	dec	a
	jr	NZ, 00163$
;main.c:506: if(dashCoolDown >= 30){
	ld	a, (#_dashCoolDown)
	sub	a, #0x1e
	jr	C, 00161$
;main.c:507: reDash=0;
	ld	hl, #_reDash
	ld	(hl), #0x00
;main.c:508: dashCoolDown=0;
	ld	hl, #_dashCoolDown
	ld	(hl), #0x00
00161$:
;main.c:510: dashCoolDown+=2;
	ld	hl, #_dashCoolDown
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00163$:
;main.c:512: performtDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performtDelay
	inc	sp
;main.c:515: }
	jp	00165$
	.area _CODE
	.area _INITIALIZER
__xinit__tiles_church:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x05	; 5
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x2c	; 44
	.db #0x17	; 23
	.db #0x58	; 88	'X'
	.db #0x2f	; 47
	.db #0xb0	; 176
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x78	; 120	'x'
	.db #0xa7	; 167
	.db #0xfc	; 252
	.db #0x5b	; 91
	.db #0xbc	; 188
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0xa3	; 163
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x18	; 24
	.db #0xe1	; 225
	.db #0x18	; 24
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x46	; 70	'F'
	.db #0x99	; 153
	.db #0xa5	; 165
	.db #0x5a	; 90	'Z'
	.db #0x83	; 131
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0x85	; 133
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x99	; 153
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0x65	; 101	'e'
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0xc5	; 197
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0xf8	; 248
	.db #0x17	; 23
	.db #0xf8	; 248
	.db #0x3b	; 59
	.db #0xe4	; 228
	.db #0x24	; 36
	.db #0xe2	; 226
	.db #0x7e	; 126
	.db #0xc1	; 193
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xcd	; 205
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x73	; 115	's'
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0xc1	; 193
	.db #0x3d	; 61
	.db #0xe2	; 226
	.db #0x23	; 35
	.db #0xe4	; 228
	.db #0x15	; 21
	.db #0xf8	; 248
	.db #0x0b	; 11
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x7f	; 127
	.db #0x90	; 144
	.db #0x1f	; 31
	.db #0xe8	; 232
	.db #0x1f	; 31
	.db #0xc4	; 196
	.db #0x27	; 39
	.db #0x1c	; 28
	.db #0x47	; 71	'G'
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x91	; 145
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0xbc	; 188
	.db #0x47	; 71	'G'
	.db #0xdc	; 220
	.db #0x27	; 39
	.db #0xe8	; 232
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
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
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xa5	; 165
	.db #0x18	; 24
	.db #0xbd	; 189
	.db #0x18	; 24
	.db #0xa5	; 165
	.db #0x18	; 24
	.db #0xbd	; 189
	.db #0x18	; 24
	.db #0xa5	; 165
	.db #0x18	; 24
	.db #0xbd	; 189
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0xc3	; 195
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0xed	; 237
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x3c	; 60
	.db #0x34	; 52	'4'
	.db #0x7e	; 126
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0xcd	; 205
	.db #0x7e	; 126
	.db #0x6e	; 110	'n'
	.db #0x3c	; 60
	.db #0x34	; 52	'4'
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
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x5a	; 90	'Z'
	.db #0x24	; 36
	.db #0xbd	; 189
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x1c	; 28
	.db #0x40	; 64
	.db #0x9c	; 156
	.db #0xa0	; 160
	.db #0x5c	; 92
	.db #0xd0	; 208
	.db #0xac	; 172
	.db #0x68	; 104	'h'
	.db #0xd4	; 212
	.db #0x34	; 52	'4'
	.db #0xe8	; 232
	.db #0x1a	; 26
	.db #0xf4	; 244
	.db #0x0d	; 13
	.db #0xfa	; 250
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xda	; 218
	.db #0x93	; 147
	.db #0xfe	; 254
	.db #0x93	; 147
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xda	; 218
	.db #0x93	; 147
	.db #0xfe	; 254
	.db #0x93	; 147
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0x7c	; 124
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
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x6b	; 107	'k'
	.db #0x33	; 51	'3'
	.db #0x6b	; 107	'k'
	.db #0x33	; 51	'3'
	.db #0x6b	; 107	'k'
	.db #0x37	; 55	'7'
	.db #0x5f	; 95
	.db #0x37	; 55	'7'
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xd6	; 214
	.db #0xcc	; 204
	.db #0xd6	; 214
	.db #0xcc	; 204
	.db #0xd6	; 214
	.db #0xec	; 236
	.db #0xfa	; 250
	.db #0xec	; 236
	.db #0xfa	; 250
	.db #0x31	; 49	'1'
	.db #0x59	; 89	'Y'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x3f	; 63
	.db #0x6f	; 111	'o'
	.db #0x8c	; 140
	.db #0x9a	; 154
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xf6	; 246
	.db #0x27	; 39
	.db #0x7f	; 127
	.db #0x22	; 34
	.db #0x7a	; 122	'z'
	.db #0x22	; 34
	.db #0x7a	; 122	'z'
	.db #0x02	; 2
	.db #0x7a	; 122	'z'
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0x44	; 68	'D'
	.db #0x5e	; 94
	.db #0x44	; 68	'D'
	.db #0x5e	; 94
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x24	; 36
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
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
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x87	; 135
	.db #0x7b	; 123
	.db #0x8f	; 143
	.db #0x77	; 119	'w'
	.db #0x9f	; 159
	.db #0x6f	; 111	'o'
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0xe5	; 229
	.db #0x3f	; 63
	.db #0xda	; 218
	.db #0x3d	; 61
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xf9	; 249
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x7f	; 127
	.db #0x91	; 145
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x22	; 34
	.db #0x33	; 51	'3'
	.db #0xee	; 238
	.db #0x33	; 51	'3'
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0xfd	; 253
	.db #0x06	; 6
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x44	; 68	'D'
	.db #0x66	; 102	'f'
	.db #0xdd	; 221
	.db #0x66	; 102	'f'
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xbb	; 187
	.db #0xcc	; 204
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
__xinit__church_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x26	; 38
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
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x28	; 40
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x45	; 69	'E'
	.db #0x37	; 55	'7'
	.db #0x1e	; 30
	.db #0x2a	; 42
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
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x45	; 69	'E'
	.db #0x05	; 5
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x2c	; 44
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x2d	; 45
	.db #0x2f	; 47
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x3e	; 62
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x3a	; 58
	.db #0x43	; 67	'C'
	.db #0x3f	; 63
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x3b	; 59
	.db #0x43	; 67	'C'
	.db #0x40	; 64
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x3c	; 60
	.db #0x43	; 67	'C'
	.db #0x41	; 65	'A'
	.db #0x45	; 69	'E'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
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
__xinit__sprites:
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xb8	; 184
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0xb8	; 184
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x60	; 96
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x50	; 80	'P'
	.db #0xd2	; 210
	.db #0xaa	; 170
	.db #0xf9	; 249
	.db #0xdd	; 221
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x50	; 80	'P'
	.db #0xd2	; 210
	.db #0xea	; 234
	.db #0xf9	; 249
	.db #0xdd	; 221
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x36	; 54	'6'
	.db #0x07	; 7
	.db #0x3d	; 61
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x06	; 6
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xa4	; 164
	.db #0xd4	; 212
	.db #0xf2	; 242
	.db #0xba	; 186
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0x10	; 16
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
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x36	; 54	'6'
	.db #0x07	; 7
	.db #0x3d	; 61
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
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
	.db #0xa0	; 160
	.db #0xa4	; 164
	.db #0xd4	; 212
	.db #0xf2	; 242
	.db #0xba	; 186
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x84	; 132
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
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
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf3	; 243
	.db #0xdc	; 220
	.db #0xfb	; 251
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x1d	; 29
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x98	; 152
	.db #0xd8	; 216
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xe8	; 232
	.db #0xe8	; 232
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x64	; 100	'd'
	.db #0x9c	; 156
	.db #0xd8	; 216
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x00	; 0
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
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
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
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x05	; 5
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xb8	; 184
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
__xinit__interior_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0xa3	; 163
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x18	; 24
	.db #0xe1	; 225
	.db #0x18	; 24
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x46	; 70	'F'
	.db #0x99	; 153
	.db #0xa5	; 165
	.db #0x5a	; 90	'Z'
	.db #0x83	; 131
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0x85	; 133
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x99	; 153
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0x65	; 101	'e'
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0xc5	; 197
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x3b	; 59
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x22	; 34
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xcd	; 205
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x73	; 115	's'
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0x3d	; 61
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xc4	; 196
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x44	; 68	'D'
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0xea	; 234
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x91	; 145
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0xbc	; 188
	.db #0x44	; 68	'D'
	.db #0xdc	; 220
	.db #0x24	; 36
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0xfd	; 253
	.db #0x06	; 6
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0x30	; 48	'0'
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0xdb	; 219
	.db #0xb6	; 182
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xe3	; 227
	.db #0x22	; 34
	.db #0xe3	; 227
	.db #0x22	; 34
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xf6	; 246
	.db #0xfb	; 251
	.db #0xf6	; 246
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
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
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x66	; 102	'f'
	.db #0x42	; 66	'B'
	.db #0x5a	; 90	'Z'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x66	; 102	'f'
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x20	; 32
	.db #0x2a	; 42
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0x04	; 4
	.db #0xac	; 172
	.db #0x04	; 4
	.db #0xa8	; 168
	.db #0x08	; 8
	.db #0xb0	; 176
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x15	; 21
	.db #0x0f	; 15
	.db #0x2a	; 42
	.db #0x1f	; 31
	.db #0xb6	; 182
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x32	; 50	'2'
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x61	; 97	'a'
	.db #0x9e	; 158
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xaa	; 170
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
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x6f	; 111	'o'
	.db #0xdf	; 223
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x09	; 9
	.db #0xf7	; 247
	.db #0x17	; 23
	.db #0xee	; 238
	.db #0x2f	; 47
	.db #0xd9	; 217
	.db #0x5e	; 94
	.db #0xb6	; 182
	.db #0xb8	; 184
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0x90	; 144
	.db #0xef	; 239
	.db #0xe8	; 232
	.db #0x77	; 119	'w'
	.db #0xf4	; 244
	.db #0x9b	; 155
	.db #0x7a	; 122	'z'
	.db #0x6d	; 109	'm'
	.db #0x1d	; 29
	.db #0x16	; 22
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
__xinit__interior_map:
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x0f	; 15
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x0b	; 11
	.db #0x26	; 38
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x2d	; 45
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x0b	; 11
	.db #0x0b	; 11
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
__xinit__r_portrait_tile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x9b	; 155
	.db #0xa4	; 164
	.db #0xb6	; 182
	.db #0xc9	; 201
	.db #0xb4	; 180
	.db #0xc9	; 201
	.db #0xea	; 234
	.db #0x95	; 149
	.db #0xe2	; 226
	.db #0x95	; 149
	.db #0xc0	; 192
	.db #0xab	; 171
	.db #0xd4	; 212
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xee	; 238
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xae	; 174
	.db #0x10	; 16
	.db #0x6c	; 108	'l'
	.db #0x11	; 17
	.db #0x58	; 88	'X'
	.db #0x23	; 35
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7d	; 125
	.db #0x81	; 129
	.db #0x79	; 121	'y'
	.db #0x83	; 131
	.db #0x6d	; 109	'm'
	.db #0x83	; 131
	.db #0xdf	; 223
	.db #0x01	; 1
	.db #0x9f	; 159
	.db #0x21	; 33
	.db #0x80	; 128
	.db #0xb5	; 181
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0x9f	; 159
	.db #0xa7	; 167
	.db #0x89	; 137
	.db #0xc9	; 201
	.db #0xa9	; 169
	.db #0xc9	; 201
	.db #0xa9	; 169
	.db #0xc1	; 193
	.db #0xa9	; 169
	.db #0xc1	; 193
	.db #0xb7	; 183
	.db #0xd0	; 208
	.db #0x03	; 3
	.db #0xdc	; 220
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0xdf	; 223
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0xf3	; 243
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x3f	; 63
	.db #0x3b	; 59
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x97	; 151
	.db #0xf0	; 240
	.db #0x9b	; 155
	.db #0xe8	; 232
	.db #0x9b	; 155
	.db #0xe8	; 232
	.db #0xb4	; 180
	.db #0xcc	; 204
	.db #0xb3	; 179
	.db #0xcf	; 207
	.db #0xb0	; 176
	.db #0xcf	; 207
	.db #0xa7	; 167
	.db #0xd8	; 216
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x3f	; 63
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xf9	; 249
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0x3f	; 63
	.db #0xfd	; 253
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x43	; 67	'C'
	.db #0x43	; 67	'C'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x6f	; 111	'o'
	.db #0x6f	; 111	'o'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0x5d	; 93
	.db #0x5d	; 93
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x75	; 117	'u'
	.db #0x75	; 117	'u'
	.db #0x79	; 121	'y'
	.db #0x79	; 121	'y'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x75	; 117	'u'
	.db #0x75	; 117	'u'
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xbb	; 187
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x4e	; 78	'N'
	.db #0x7e	; 126
	.db #0x32	; 50	'2'
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x6c	; 108	'l'
	.db #0x7e	; 126
	.db #0x74	; 116	't'
	.db #0x7e	; 126
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x72	; 114	'r'
	.db #0x7e	; 126
	.db #0x6e	; 110	'n'
	.db #0x7e	; 126
	.db #0x4e	; 78	'N'
	.db #0x76	; 118	'v'
	.db #0x4e	; 78	'N'
	.db #0x76	; 118	'v'
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x5e	; 94
	.db #0x1e	; 30
	.db #0x7e	; 126
	.db #0x1e	; 30
	.db #0x36	; 54	'6'
	.db #0x46	; 70	'F'
	.db #0x5e	; 94
	.db #0x66	; 102	'f'
	.db #0x6e	; 110	'n'
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xb3	; 179
	.db #0xb3	; 179
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
__xinit__w_dialogue_001:
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x8a	; 138
	.db #0x96	; 150
	.db #0x99	; 153
	.db #0x7f	; 127
	.db #0x8c	; 140
	.db #0x94	; 148
	.db #0x99	; 153
	.db #0x86	; 134
	.db #0x90	; 144
	.db #0x99	; 153
	.db #0x86	; 134
	.db #0x8b	; 139
	.db #0x90	; 144
	.db #0x86	; 134
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x99	; 153
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x91	; 145
	.db #0x85	; 133
	.db #0x7e	; 126
	.db #0x91	; 145
	.db #0x99	; 153
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x92	; 146
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
__xinit__w_dialogue_002:
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x8b	; 139
	.db #0x86	; 134
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
__xinit__w_dialogue_003:
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x7e	; 126
	.db #0x8d	; 141
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x85	; 133
	.db #0x82	; 130
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x91	; 145
	.db #0x8c	; 140
	.db #0x99	; 153
	.db #0x8a	; 138
	.db #0x7e	; 126
	.db #0x8b	; 139
	.db #0x96	; 150
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
__xinit__r_stat_001:
	.db #0x85	; 133
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x89	; 137
	.db #0x91	; 145
	.db #0x85	; 133
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x94	; 148
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8b	; 139
	.db #0x99	; 153
	.db #0x9d	; 157
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
__xinit__r_stat_002:
	.db #0x85	; 133
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x89	; 137
	.db #0x91	; 145
	.db #0x85	; 133
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x94	; 148
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8b	; 139
	.db #0x99	; 153
	.db #0x9a	; 154
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
__xinit__r_stat_003:
	.db #0x85	; 133
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x89	; 137
	.db #0x91	; 145
	.db #0x85	; 133
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x94	; 148
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8b	; 139
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
__xinit__offset:
	.db #0x08	; 8
__xinit__frame:
	.db #0x00	; 0
__xinit__scrollAviable:
	.db #0x00	; 0
__xinit__enemySet:
	.db #0x00	; 0
__xinit__from:
	.db #0x00	; 0
__xinit__speedJ:
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x18	; 24
__xinit__speedD:
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
__xinit__animation_tiles:
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0c	; 12
__xinit__animation_tiles2:
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0e	; 14
__xinit__e_animation_tiles:
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x28	; 40
__xinit__e_animation_tiles2:
	.db #0x1e	; 30
	.db #0x22	; 34
	.db #0x26	; 38
	.db #0x2a	; 42
	.area _CABS (ABS)
