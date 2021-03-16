/* 
 * File:   lab05Main.c
 * Author: groteh
 *
 * Created on March 16, 2021, 1:59 PM
 */

#include "ece212.h"
int direction = 0;

int main(int argc, char** argv)
{
    ece212_setup();
    int ledval = 0x8;

    while(1)
	{
	 delayms(500);
         if(BTN11)
          {
           delayms(50);
          if(direction == 0)
            {
             direction = 1;
            }
         else
            {
            direction = 0;
            }
         while(BTN11);
        }
      else
        {
	   if(direction == 0)
	     {
              if(ledval == 0x1)
                {
                 ledval = 0x8;
                }
              else
                {
                 ledval = ledval >> 1;//right
                }
            }
         else
           {
              if(ledval == 0x8)
                {
                ledval = 0x1;
                }
             else
                {
                ledval = ledval << 1;
                }
          }
    writeLEDs(ledval);
   }
 }
 return (EXIT_SUCCESS);
}