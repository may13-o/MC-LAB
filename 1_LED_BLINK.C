#include <reg51.h>
#define LCD_DATA P1
sbit rs = P3^7;
sbit en = P3^6;
void lcdcmd(unsigned char value);
void lcddata(unsigned char value);
void delay(unsigned int);
void main()
{
lcdcmd(0x38); // 8-bit mode, 2 lines
lcdcmd(0x0C); // Display ON, cursor OFF
lcdcmd(0x06); // Increment cursor
lcdcmd(0x01); // Clear display
// First line
lcdcmd(0x80);
lcddata('N');
lcddata('M');
lcddata('A');
lcddata('M');
lcddata('I');
lcddata('T');
// Second line
lcdcmd(0xC0);
lcddata('N');
lcddata('I');
lcddata('T');
lcddata('T');
lcddata('E');
while(1);
}
void lcdcmd(unsigned char value)
{
LCD_DATA = value;
rs = 0;
en = 1;
delay(1);
en = 0;
delay(1);
}
void lcddata(unsigned char value)
{
LCD_DATA = value;
rs = 1;
en = 1;
delay(1);
en = 0;
delay(1);
}
void delay(unsigned int d)
{
unsigned int i, j;
for(i = 0; i < d; i++)
for(j = 0; j < 1275; j++);
}