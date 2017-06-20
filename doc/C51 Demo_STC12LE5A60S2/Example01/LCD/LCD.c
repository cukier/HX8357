#include "sys.h"
#include "lcd.h"
//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//����Ӳ������Ƭ��STC12LE5A60S2,����30M  ��Ƭ��������ѹ3.3V
//QDtech-TFTҺ������ for C51
//xiao��@ShenZhen QDtech co.,LTD
//��˾��վ:www.qdtech.net
//�Ա���վ��http://qdtech.taobao.com
//��˾�ṩ����֧�֣��κμ������⻶ӭ��ʱ����ѧϰ
//�̻�(����) :+86 0755-23594567 
//�ֻ�:15989313508���빤�� 
//����:QDtech2008@gmail.com 
//Skype:QDtech2008
//��������QQȺ:324828016
//��������:2013/5/13
//�汾��V1.1
//��Ȩ���У�����ؾ���
//Copyright(C) ������ȫ�����Ӽ������޹�˾ 2009-2019
//All rights reserved
//********************************************************************************

/**************************************************************************************
//=======================================Һ���������߽���==========================================//
//P2���8λ���ݿ�,DB8-DB15��������P2^0-P2^7;8λģʽ��ֻʹ�ø�8λ
#define  LCD_DataPortH P2 
//P0���8λ���ݿ�,DB0-DB7��������P0^0-P0^7;��ȷ��P0���Ѿ�����10K����,����̫С����С4.7K,�Ƽ�10K.    
#define  LCD_DataPortL P0     
//=======================================Һ���������߽���==========================================//
CS=P1^3;		//Ƭѡ	
RS=P1^2;  		//����/�����л�
WR=P1^1;		//д����
RD=P1^0;		//������
RESET=P3^3;	 	//��λ 
LCD_BL=P3^2;	//�������
//=========================================������������=========================================//
//��ʹ�ô�������ģ�鱾������������ɲ�����
DCLK	  =    P3^6; //������SPI����ʱ���źŽ�P3.6  
TCS       =    P3^7; //����ƬѡTCS��P3.7
DIN       =    P3^4; //MOSI��P3.4	
DOUT      =    P3^5; //MISO��P3.5																						   
Penirq    =    P4^0; //PEN���Ž�P4.0���絥Ƭ����P4�飬�����и�����������IO���޸Ĵ��붨��
**************************************************************************************************/	

//LCD�Ļ�����ɫ�ͱ���ɫ	   
u16 POINT_COLOR=0x0000;	//������ɫ
u16 BACK_COLOR=0xFFFF;  //����ɫ 
//����LCD��Ҫ����
//Ĭ��Ϊ����
_lcd_dev lcddev;



//******************************************************************
//��������  LCD_Write_Bus
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��Һ��������д������(LCD�����ڲ�����)
//���������VH:��8λ����
//        	VL:��8λ����
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************

void LCD_Write_Bus(char VH,char VL)   
{
	LCD_CS=0;
	
	LCD_WR=0;	
	LCD_DataPortH=VH;	
	LCD_DataPortL=VL;			
	LCD_WR=1; 
	
	LCD_CS=1;
}



//******************************************************************
//��������  LCD_WR_DATA8
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��Һ��������д��д8λ����
//���������VH:��8λ����
//        	VL:��8λ����
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_WR_DATA8(char VH,char VL) 
{
	LCD_RS=1;
	LCD_Write_Bus(VH,VL);
} 

//******************************************************************
//��������  LCD_WR_REG
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��Һ��������д��д16λָ��
//���������Reg:��д���ָ��ֵ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_WR_REG(int Reg)	 
{	
	LCD_RS=0;
	LCD_Write_Bus(Reg>>8,Reg);
} 

//******************************************************************
//��������  LCD_WR_DATA
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��Һ��������д��д16λ����
//���������Data:��д�������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
 void LCD_WR_DATA(int Data)
{
	LCD_RS=1;
	LCD_Write_Bus(Data>>8,Data);
}

//******************************************************************
//��������  LCD_WriteReg
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    д�Ĵ�������
//���������LCD_Reg:�Ĵ�����ַ
//			LCD_RegValue:Ҫд�������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
{
  LCD_WR_REG(LCD_Reg);
	LCD_WR_DATA(LCD_RegValue);
}

//******************************************************************
//��������  LCD_WriteRAM_Prepare
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��ʼдGRAM
//			�ڸ�Һ��������RGB����ǰ��Ӧ�÷���дGRAMָ��
//�����������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_WriteRAM_Prepare(void)
{
 	LCD_WR_REG(lcddev.wramcmd);	  
}


//******************************************************************
//��������  LCD_Clear
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    LCDȫ�������������
//���������Color:Ҫ���������ɫ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_Clear(u16 Color)
{
	u32 index=0; 
u32 total=0; 	
total=lcddev.width*lcddev.height;  
	LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	
	LCD_RS=1;
	LCD_CS=0;		
	for(index=0;index<total;index++)
	{
	LCD_DataPortH=Color>>8;	
	LCD_DataPortL=Color;	
	LCD_WR=0;
	LCD_WR=1;		
	}
	LCD_CS=1;	
} 

//******************************************************************
//��������  LCD_DrawPoint
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��ָ��λ��д��һ�����ص�����
//���������(x,y):�������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_DrawPoint(u16 x,u16 y)
{
	LCD_SetCursor(x,y);//���ù��λ�� 
#if LCD_USE8BIT_MODEL==1
	LCD_CS=0;
	LCD_RD=1;
	LCD_RS=1;//д��ַ  	 
	LCD_DataPortL=(POINT_COLOR>>8);	
	LCD_WR=0;
	LCD_WR=1;
	LCD_DataPortL=POINT_COLOR;	
	LCD_WR=0;
	LCD_WR=1;	 
	LCD_CS=1;
#else
	LCD_WR_DATA(POINT_COLOR); 
#endif
}	 
//******************************************************************
//��������  LCD_DrawPoint_16Bit
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    8λ���������д��һ��16λ����
//���������(x,y):�������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_DrawPoint_16Bit(u16 color)
{
#if LCD_USE8BIT_MODEL==1
	LCD_CS=0;
	LCD_RD=1;
	LCD_RS=1;//д��ַ  	 
	LCD_DataPortL=(color>>8);	
	LCD_WR=0;
	LCD_WR=1;
	LCD_DataPortL=color;	
	LCD_WR=0;
	LCD_WR=1;	 
	LCD_CS=1;
#else
	LCD_WR_DATA(color); 
#endif


}
//******************************************************************
//��������  LCD_Reset
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    LCD��λ������Һ����ʼ��ǰҪ���ô˺���
//�����������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_Reset(void)
{
	LCD_RESET=1;
	delay_ms(50);	
	LCD_RESET=0;
	delay_ms(50);
	LCD_RESET=1;
	delay_ms(50);
}

//******************************************************************
//��������  LCD_Init
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    LCD��ʼ��
//�����������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_Init(void)
{
	LCD_Reset(); //��ʼ��֮ǰ��λ
	//LCD_RD=1;	 //RD����û���õ������ߴ���

	//=========================Һ������ʼ��=============================//
	LCD_WR_REG(0xEE);//Set EQ  
	LCD_WR_DATA(0x02);  
	LCD_WR_DATA(0x01);  
	LCD_WR_DATA(0x02);  
	LCD_WR_DATA(0x01);  

	LCD_WR_REG(0xED);//Set DIR TIM  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0x9A);  
	LCD_WR_DATA(0x9A);  
	LCD_WR_DATA(0x9B);  
	LCD_WR_DATA(0x9B);  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0x00);  
	LCD_WR_DATA(0xAE);  
	LCD_WR_DATA(0xAE);  
	LCD_WR_DATA(0x01);  
	LCD_WR_DATA(0xA2);  
	LCD_WR_DATA(0x00);  

	LCD_WR_REG(0xB4);//Set RM, DM  
	LCD_WR_DATA(0x00);//  

	LCD_WR_REG(0xC0); //Set Panel Driving
	LCD_WR_DATA(0x00); //REV SM GS
	LCD_WR_DATA(0x3B); // NL[5:0]  
	LCD_WR_DATA(0x00); //SCN[6:0]  
	LCD_WR_DATA(0x02); //NDL 0 PTS[2:0]
	LCD_WR_DATA(0x11); //PTG ISC[3:0]  

	LCD_WR_REG(0xC1);//
	LCD_WR_DATA(0x10);//line inversion

	LCD_WR_REG(0xC8);//Set Gamma  
	LCD_WR_DATA(0x00); //KP1,KP0
	LCD_WR_DATA(0x46); //KP3,KP2
	LCD_WR_DATA(0x12); //KP5,KP4
	LCD_WR_DATA(0x20); //RP1,RP0
	LCD_WR_DATA(0x0c); //VRP0 01
	LCD_WR_DATA(0x00); //VRP1
	LCD_WR_DATA(0x56); //KN1,KN0
	LCD_WR_DATA(0x12); //KN3,KN2
	LCD_WR_DATA(0x67); //KN5,KN4
	LCD_WR_DATA(0x02); //RN1,RN0
	LCD_WR_DATA(0x00); //VRN0
	LCD_WR_DATA(0x0c); //VRN1 01

	LCD_WR_REG(0xD0);//Set Power  
	LCD_WR_DATA(0x44);//DDVDH :5.28
	LCD_WR_DATA(0x42); // BT VGH:15.84 VGL:-7.92
	LCD_WR_DATA(0x06);//VREG1 4.625V

	LCD_WR_REG(0xD1);//Set VCOM  
	LCD_WR_DATA(0x43); //VCOMH
	LCD_WR_DATA(0x16);

	LCD_WR_REG(0xD2);  
	LCD_WR_DATA(0x04);  
	LCD_WR_DATA(0x22); //12

	LCD_WR_REG(0xD3);  
	LCD_WR_DATA(0x04);  
	LCD_WR_DATA(0x12);  

	LCD_WR_REG(0xD4);  
	LCD_WR_DATA(0x07);  
	LCD_WR_DATA(0x12);  

	LCD_WR_REG(0xE9); //Set Panel
	LCD_WR_DATA(0x00);

	LCD_WR_REG(0xC5); //Set Frame rate
	LCD_WR_DATA(0x08); //61.51Hz

	LCD_WR_REG(0X0036);
	LCD_WR_DATA(0X000a);

	LCD_WR_REG(0X003A);
	LCD_WR_DATA(0X0055);

	LCD_WR_REG(0X002A);
	LCD_WR_DATA(0X0000);
	LCD_WR_DATA(0X0000);
	LCD_WR_DATA(0X0001);
	LCD_WR_DATA(0X003F);

	LCD_WR_REG(0X002B);
	LCD_WR_DATA(0X0000);
	LCD_WR_DATA(0X0000);
	LCD_WR_DATA(0X0001);
	LCD_WR_DATA(0X00E0);
	delay_ms(20);

	LCD_WR_REG(0x11);//Sleep Out  
	delay_ms(120);  

	LCD_WR_REG(0x35);
	LCD_WR_DATA(0x00);//TE ON

	LCD_WR_REG(0x29); //Display On
	delay_ms(5);

	//����LCD���Բ���
	LCD_SetParam();//����LCD����	 
	LCD_BL=1;//��������	 
}
//******************************************************************
//��������  LCD_SetWindows
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ������ʾ����
//���������(xStar,yStar):�������Ͻ���ʼ����
//	 	   	(xEnd,yEnd):�������½ǽ�������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
{	
	LCD_WR_REG(lcddev.setxcmd);	
	LCD_WR_DATA(xStar>>8);
	LCD_WR_DATA(xStar);		
	LCD_WR_DATA(xEnd>>8);
	LCD_WR_DATA(xEnd);

	LCD_WR_REG(lcddev.setycmd);	
	LCD_WR_DATA(yStar>>8);
	LCD_WR_DATA(yStar);		
	LCD_WR_DATA(yEnd>>8);
	LCD_WR_DATA(yEnd);

	LCD_WriteRAM_Prepare();	//��ʼд��GRAM		
}   

//******************************************************************
//��������  LCD_SetCursor
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ���ù��λ��
//���������Xpos:������
//			Ypos:������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_SetCursor(u16 Xpos, u16 Ypos)
{	  	    			
	LCD_SetWindows(Xpos,Ypos,Xpos+1,Ypos+1);			
} 

//******************************************************************
//��������  LCD_SetParam
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ����LCD������������к�����ģʽ�л�
//�����������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_SetParam(void)
{ 
	lcddev.setxcmd=0x2A;
	lcddev.setycmd=0x2B;
	lcddev.wramcmd=0x2C;
#if USE_HORIZONTAL==1	//ʹ�ú���	  
	lcddev.dir=1;//����
	lcddev.width=480;
	lcddev.height=320;			
	LCD_WriteReg(0x36,0x3B);//BGR==1,MY==1,MX==0,MV==1  63
#else//����
	lcddev.dir=0;//����				 	 		
	lcddev.width=320;
	lcddev.height=480;	
	LCD_WriteReg(0x36,0X0A);//BGR==1,MY==0,MX==0,MV==0
#endif
}	  







