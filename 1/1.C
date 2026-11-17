#include<reg51.h>
#define LED P1
void delay(unsigned int);
void main(void)
{
    unsigned char count;
    while(1)
    {
        for(count=0;count<=255;count++)
        {
            LED=~count;
					delay(1000);
			  }
    }
}
void delay(unsigned int d)
{
    unsigned int i,j;
    for(i=0;i<d;i++)
    {
        for(j=0;j<1275;j++);
    }
}