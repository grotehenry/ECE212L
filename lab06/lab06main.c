/* 
 * File:   lab06main.c
 * Author: groteh
 *
 * Created on March 23, 2021, 1:37 PM
 */

#include "ece212.h";
#include <stdio.h>;
#include <stdlib.h>;
int main() {
    // add needed variables here
    
    
    // set initial speed and direction (straight)
    RFORWARD = 0xFFFF;
    LFORWARD = 0xFFFF;
    ece212_lafbot_setup();
    
    //loop used to find black and white values
    /*while(1){
        long left = analogRead(LEFT_SENSOR);
        long right = analogRead(RIGHT_SENSOR);
        printf("left %d,", left);
        printf("right %d" , right);
        delayms(100);
    }*/
    
    //main loop, used for track navigation
    while(1){
        long left = analogRead(LEFT_SENSOR);
        long right = analogRead(RIGHT_SENSOR);
        // sample input sensors and determine if on track
        if (left > 350) {//to left of track
            RFORWARD = 0xFFFF;
            LFORWARD = 0x2222;
        }
        else if (right > 310) { //to right of track
            RFORWARD = 0x2222;
            LFORWARD = 0xFFFF;
        }
        else {
            RFORWARD = 0xFFFF;
            LFORWARD = 0xFFFF;
        }
        // if not, alter wheel speeds to try to correct
        
        // delay for some amount of time before repeating
        delayms(1);
    } return (EXIT_SUCCESS);
}