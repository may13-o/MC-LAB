#include<reg51.h>
#define LED P1
void delay(unsigned int)
void main(void)
{
    LED=0xFF;
    while(1)
    {
        LED=0x00;
        delay(1000);
        LED=0xFF;
        delay(1000);
    }
}
void delay(unsigned int d)
{
    unsigned int i,j;
    for(i=0;i<d;i++)
    {
        for(i=0;i<1275;i++)
    }
}