/* 
 * File:   lab05bmain.c
 * Author: groteh
 *
 * Created on March 16, 2021, 2:49 PM
 */

#include "ece212.h"

/*
 * 
 */
int main(int argc, char** argv) {
    
    ece212_lafbot_setup();
    
    while(1) {
        RFORWARD = 0x7777; //forward
        LFORWARD = 0x7777;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(500);
        
        RFORWARD = 0x0; //wait
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(1000);
        
        RFORWARD = 0x0; //backward
        LFORWARD = 0x0;
        RBACK = 0x7777;
        LBACK = 0x7777;
        
        delayms(500);
        
        RFORWARD = 0x0; //wait
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(1000);
        
        RFORWARD = 0x7777; //left
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x7777;
        
        delayms(500);
        
        RFORWARD = 0x0; //wait
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(1000);
        
        RFORWARD = 0x0; //right
        LFORWARD = 0x7777;
        RBACK = 0x7777;
        LBACK = 0x0;
        
        delayms(1000);
        
        RFORWARD = 0x0; //wait
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(1000);
        
        RFORWARD = 0x7777; //left
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x7777;
        
        delayms(500);
        
        RFORWARD = 0x0; //wait
        LFORWARD = 0x0;
        RBACK = 0x0;
        LBACK = 0x0;
        
        delayms(1000);
    }
    return (EXIT_SUCCESS);
}

