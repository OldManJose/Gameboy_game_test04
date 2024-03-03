#include <gb/gb.h>
#include "church_data.c"
#include "church_map.c"
#include "main_sprites.c"
#include "interior_church_tiles.c"
#include "interior_church_map.c"
#include "rouse_portrait_letters.c"
#include "dialogue_w.c"
#include "stat_w.c"
// Update animation every ten frames
#define FRAMES_TILL_ANIM_UPDATE  1

// Number of animation tiles
// (could use sizeof(animation_tiles), but keeping this simple for now)
#define ANIM_COUNT_TILES  3
#define ENEMY_ANIM_COUNT_TILES  4

UINT8 offset=8,frame_count,animation_counter, frame = 0,pPosX, pPosY,tile_anim_count,ii,boost,floorPosition,ePosX,ePosY,i,sX,dCounter;
UINT8 e_frame_count, e_animation_counter, sCounter, downPCounter,dashCoolDown;
UBYTE onAnim,faceing,jumpAllow, scrollAviable=0, enemySet=0,from=0,dashAviable,reDash,carryRow;
UINT8 speedJ[9]={    
    -24,-16,-8,-4,0,4,8,16,24
};
UINT8 speedD[4]={
    16,8,4,2
};
const char door[1]= {0x43};
    // List of tiles to rotate through
UINT8 animation_tiles[ANIM_COUNT_TILES] = {4,8,12};
UINT8 animation_tiles2[ANIM_COUNT_TILES] = {6,10,14};

UINT8 e_animation_tiles[ENEMY_ANIM_COUNT_TILES] = {28,32,36,40};
UINT8 e_animation_tiles2[ENEMY_ANIM_COUNT_TILES] = {30,34,38,42};

void performtDelay(UINT8 delay){
    for(ii=0; ii<delay;ii++)
    {
        wait_vbl_done();
    }
}

UBYTE backGroundCollision(UINT8 newplayerx, UINT8 newplayery, unsigned char *mapUsed){
    UINT16 indexTLx, indexTLy, tileindexTL;
    UBYTE result;

    indexTLx = newplayerx >> 3; //Se divide entre 8 el valor de la posición del jugador en x 
    indexTLy = newplayery >> 4; //Se divide entre 16 el valor de la posición del jugador en y
    tileindexTL = indexTLy + (indexTLx*20); //el 20 representa el ancho del mapa

    if(mapUsed == church_map){
    result = mapUsed[tileindexTL] == door[0];
    }
    if(mapUsed == interior_map){
     //result = colisiones con las plataformas
    }
    return result;
}

UINT8 hitSurface(UINT8 projectedSurf){
    if(projectedSurf >= floorPosition){
        return floorPosition;
    }
    return -1;
}

void jump(){
    INT8 possibleFloor;

    set_sprite_tile(0,16);
    set_sprite_tile(1,18);

    if(jumpAllow==1)
    {
        jumpAllow = 0;
        NR10_REG = 0x29;
        NR11_REG = 0xA9;
        NR12_REG = 0x67;
        NR13_REG = 0x68;
        NR14_REG = 0x87;
    }
    if(boost<9){
        boost++;
    }
    
    pPosY =pPosY + speedJ[boost];

    possibleFloor = hitSurface(pPosY);

    if(possibleFloor > -1)
    {
        jumpAllow = 1;
        boost=0;
        if(faceing==1){
            set_sprite_tile(0,0);
            set_sprite_tile(1,2);
            move_sprite(0,pPosX,pPosY);
            move_sprite(1,pPosX+offset,pPosY);
            move_sprite(2,pPosX+offset,pPosY);
            
        }
        else{
            set_sprite_tile(0,0);
            set_sprite_tile(1,2);
            move_sprite(0,pPosX+offset,pPosY);
            move_sprite(1,pPosX,pPosY);
            move_sprite(2,pPosX,pPosY);
        }
        NR41_REG = 0x01;
        NR42_REG = 0x82;
        NR43_REG = 0x21;
        NR44_REG = 0xC0;
    }
    else
    {
        if(faceing==1){
            move_sprite(0,pPosX,pPosY);
            move_sprite(1,pPosX+offset,pPosY);
            move_sprite(2,pPosX+offset,pPosY);

        }
        else{
            move_sprite(0,pPosX+offset,pPosY);
            move_sprite(1,pPosX,pPosY);
            move_sprite(2,pPosX,pPosY);
        }
    }
}

void dash(){   

    set_sprite_tile(0,60);
    set_sprite_tile(1,62);

    if(dashAviable==1 && reDash==0){
        dashAviable=0;
        NR41_REG = 0X3F;
        NR42_REG = 0XC2;
        NR43_REG = 0X11;
        NR44_REG = 0X80;

    }
    dCounter++;
    if(dCounter<=4){
        if(faceing==1){
            pPosX+=speedD[dCounter];
            move_sprite(0,pPosX,pPosY);
            move_sprite(1,pPosX+offset,pPosY);
        }
        else{
            pPosX-=speedD[dCounter];
            move_sprite(0,pPosX+offset,pPosY);
            move_sprite(1,pPosX,pPosY);
        }
    }
   if(dCounter>3){
        dCounter=0;
        reDash=1;
        dashAviable=1;
        set_sprite_tile(0,0);
        set_sprite_tile(1,2);
   }
    
}

void enemyAttack(){ //necesita correción, el enemigo no alcanza al jugador y se retira después de que pasa cierto limite el jugador
    if(ePosX >= 0 && from == 0){
        set_sprite_prop(3,get_sprite_prop(3) & ~S_FLIPX);
        set_sprite_prop(4,get_sprite_prop(4) & ~S_FLIPX);
        ePosX -= 4;
        move_sprite(3,ePosX,ePosY);
        move_sprite(4,ePosX+offset,ePosY);
    }
    if(from==1){
        set_sprite_prop(3,S_FLIPX);
        set_sprite_prop(4,S_FLIPX);
        ePosX += 4;
        move_sprite(3,ePosX+offset,ePosY);
        move_sprite(4,ePosX,ePosY);

    }

    if(ePosX <= 0){
            from = 1;
        } 
    if(ePosX >= 152){
            from = 0;
        }
}

void setSprite(UINT8 posI1, UINT8 posI2, UINT8 firstTile, UINT8 secondTile, UINT8 posx, UINT8 posy){
    set_sprite_tile(posI1,firstTile);
    set_sprite_tile(posI2,secondTile);
    move_sprite(posI1,posx,posy);
    move_sprite(posI2,posx+offset,posy);
}

void updateAnim(){
    frame_count++;

        // If the frame counter reached the threshold, update the animation
        if (frame_count >= FRAMES_TILL_ANIM_UPDATE) {

            // Reset frame counter
            frame_count = 0;

            // move to next animation tile, wrap around if at the end of the list (zero indexed)
            animation_counter++;
            if (animation_counter >= ANIM_COUNT_TILES){
                animation_counter = 0;}

            // Set the animation frame
            set_sprite_tile(0, animation_tiles[animation_counter]);
            set_sprite_tile(1, animation_tiles2[animation_counter]);
            tile_anim_count++;
        }
        if(tile_anim_count>=3){
            onAnim=0;
            set_sprite_tile(0,0);
            set_sprite_tile(1,2);
            tile_anim_count=0;
        }
        
}

void updateEnemyAnim(){
    e_frame_count++;

        // If the frame counter reached the threshold, update the animation
        if (e_frame_count >= FRAMES_TILL_ANIM_UPDATE) {

            // Reset frame counter
            e_frame_count = 0;

            // move to next animation tile, wrap around if at the end of the list (zero indexed)
            e_animation_counter++;
            if (e_animation_counter >= ENEMY_ANIM_COUNT_TILES){
                e_animation_counter = 0;}

            // Set the animation frame
            set_sprite_tile(3, e_animation_tiles[e_animation_counter]);
            set_sprite_tile(4, e_animation_tiles2[e_animation_counter]);          
        }
        
}

void fadeOut(){
    
    for(i=0; i<4;i++) {
        switch (i)
        {
        case 0:
            BGP_REG = 0xE4;
            break;
        case 1:
            BGP_REG = 0xF9;
            break;
        case 2:
            BGP_REG = 0xFE;
            break;
        case 3:
            BGP_REG = 0xFF;
            break;
        default:
            break;
        }
        performtDelay(5);
    }
}

void fadeIn(){
    
    for(i=0; i<3;i++) {
        switch (i)
        {
        case 0:
            BGP_REG = 0xFE;
            break;
        case 1:
            BGP_REG = 0xF9;
            break;
        case 2:
            BGP_REG = 0xE4;
            break;
        }
        performtDelay(5);
    }
}

void loadNewBackGround(unsigned char *newMap){
    HIDE_SPRITES;
    fadeOut(); 
    HIDE_BKG;
    pPosX=4;
    pPosY=120;
    scrollAviable=1;
    set_bkg_tiles(0,0,40,18,newMap);
    move_sprite(0,pPosX,pPosY);
    move_sprite(1,pPosX+offset,pPosY);
    move_sprite(2,pPosX+offset,pPosY);
    SHOW_BKG;
    fadeIn();
    SHOW_SPRITES;
}

void actualMap(unsigned char *Map){
    if(Map == interior_map){
        setSprite(3,4,28,30,ePosX,ePosY);
        enemySet=1;
        backGroundCollision(pPosX+4,pPosY,interior_map);
    }
    if(Map == church_map){
        backGroundCollision(pPosX+4,pPosY,church_map);
    }
}

void loadDialogue(unsigned char *diag){    
    SHOW_WIN;
    move_win(7,120);
    set_win_tiles(0,0,20,3,diag);
    waitpad(J_A);
    HIDE_WIN;
}

void setWindowStat(unsigned char *stat){
    SHOW_WIN;
    set_win_tiles(0,0,20,3,stat);
    move_win(7,136);
}

/*void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits,UINT8 palette){
	
    unsigned char buffer[]="00000000";

    // Convert the number to a decimal string (stored in the buffer char array)
    uitoa(number, buffer, 10);

    // Get the length of the number so we can add leading zeroes
    UINT8 len =strlen(buffer);

    // Add some leading zeroes
    // uitoa will not do this for us
    for(UINT8 i=0;i<digits-len;i++){
        VBK_REG=1;
        set_win_tile_xy(x,y,palette|128);
        VBK_REG=0;
        set_win_tile_xy(x++,y,NUMBERS_TILES_START);
    }
        
    // Draw our number
    for(UINT8 i=0;i<len;i++){
        VBK_REG=1;
        set_win_tile_xy(x,y,palette|128);
        VBK_REG=0;
        set_win_tile_xy(x++,y,(buffer[i]-'0')+NUMBERS_TILES_START);
    }
}*/

void main(){
    //iniciar registros para audio
    NR52_REG= 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
    //iniciar variables
    pPosX= 4;
    pPosY= 120;
    ePosX = 140;
    ePosY = pPosY;
    frame = 0;
    floorPosition=120;
    animation_counter = 0;
    e_animation_counter = 0;
    dCounter = 0;
    downPCounter=0;
    sCounter=1;
    jumpAllow=1;
    faceing=1;
    reDash=0;
    dashCoolDown=0;
    dashAviable=1;
    //Establecer información de background y ventana
    set_bkg_data(72,115,interior_tiles);
    set_win_data(116,164,r_portrait_tile);
    set_bkg_data(0,71,tiles_church);
    set_bkg_tiles(0,0,20,18,church_map);
    
    SHOW_BKG;
    //Establecer sprites de 8x16
    SPRITES_8x16;
    set_sprite_data(0,64,sprites);
    setSprite(0,1,0,2,pPosX,pPosY);//Heroine

    set_sprite_tile(2,20);//Bow
    SHOW_SPRITES;
    //Establecer primer dialogo y ventana con el primer estado
    loadDialogue(w_dialogue_001);
    setWindowStat(r_stat_001);

    while(1){
        if(joypad() & J_RIGHT){
            if(dashAviable==1 || carryRow==1){
                pPosX+=2;
                set_sprite_prop(0,get_sprite_prop(0) & ~S_FLIPX);
                set_sprite_prop(1,get_sprite_prop(1) & ~S_FLIPX);
                set_sprite_prop(2,get_sprite_prop(2) & ~S_FLIPX);

                move_sprite(0,pPosX,pPosY);
                move_sprite(1,pPosX+offset,pPosY);
                move_sprite(2,pPosX+offset,pPosY);
                onAnim=1;
                faceing=1;
            }
        }
        if(joypad() & J_LEFT){
            if(dashAviable==1 || carryRow==1){
                pPosX-=2;
                set_sprite_prop(0,S_FLIPX);
                set_sprite_prop(1,S_FLIPX);
                set_sprite_prop(2,S_FLIPX);

                move_sprite(0,pPosX+offset,pPosY);
                move_sprite(1,pPosX,pPosY);
                move_sprite(2,pPosX,pPosY);

                onAnim=1;
                faceing=0;
            }
        }
        if((joypad() & J_A) || jumpAllow==0){
            onAnim=0;
            jump();
        }
        if((joypad() & J_B)){
            if(sCounter==0){
            NR41_REG = 0x1B;
            NR42_REG = 0x81;
            NR43_REG = 0x68;
            NR44_REG = 0xC0;
            }
        }

        if(joypad() & J_UP){//Utilizado para entrar a puertasa
        if(actualMap(church_map)){
            if(backGroundCollision(pPosX+4,pPosY,church_map)){
                loadNewBackGround(interior_map);
                actualMap(interior_map);
                loadDialogue(w_dialogue_003);
            }
        else{
            backGroundCollision(pPosX+4,pPosY,interior_map);
        }
        }
        }
        if(joypad() & J_DOWN){//Cambia de objeto disponible
            if(jumpAllow==1){
                if(downPCounter >= 2){
                    sCounter++;
                    downPCounter=0;
                }
                if(sCounter > 2){
                    sCounter=0;
                }
                if(sCounter == 0){//arco
                    set_sprite_tile(2,22);//Bow
                    setWindowStat(r_stat_002);
                    if(faceing==1){
                        move_sprite(2,pPosX+offset,pPosY);
                        
                    }
                    else{
                        move_sprite(2,pPosX,pPosY);
                    }
                    dashAviable=0;
                    carryRow=1;
                }
                
                if(sCounter == 1){ //dash disponible
                    set_sprite_tile(2,20);//No bow
                    setWindowStat(r_stat_001);
                    move_sprite(2,pPosX+offset,pPosY);
                    dashAviable=1;
                    carryRow=0;
                }
                if(sCounter == 2){ //something else
                    setWindowStat(r_stat_003);
                }
                downPCounter++;
            }
        }
        if((((J_B & joypad()) && (joypad() & J_RIGHT)) || dashAviable==0) && (reDash == 0 && sCounter==1)){// Dash a la derecha
            dash();
        }
        if((((J_B & joypad()) && (joypad() & J_LEFT)) || dashAviable==0) && (reDash == 0 && sCounter==1)){// Dash  a la izquierda
            dash();
        }

        if(onAnim==1){
            updateAnim();
        }
        if(enemySet==1){
            updateEnemyAnim();
            enemyAttack();
        }
        if(scrollAviable == 1){
            if(pPosX==160){
                for(sX=0;sX<=152;sX+=8){
                    scroll_bkg(sX,0);
                    pPosX-=8;
                    move_sprite(0,pPosX,pPosY);
                    move_sprite(1,pPosX+offset,pPosY);
                }
            }
        }
        if(reDash==1){// Contador para cooldown de dash
            if(dashCoolDown >= 30){
                reDash=0;
                dashCoolDown=0;
            }
            dashCoolDown+=2;
        }
        performtDelay(5);
    
    } 
}