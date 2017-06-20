#include "lcd.h"
#include "stdlib.h"
#include "usart.h"
#include "delay.h"	 
//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//����Ӳ������Ƭ��STM32F103RBT6,��Ƶ72M  ��Ƭ��������ѹ3.3V
//QDtech-TFTҺ������ for STM32 IOģ��
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
//////////////////////////////////////////////////////////////////////////////////	
/****************************************************************************************************
//=======================================Һ���������߽���==========================================//
STM32 PB���Һ����DB0~DB16,��������ΪDB0��PB0,..DB15��PB15.   
//=======================================Һ���������߽���==========================================//
//LCD_CS	��PC9	//Ƭѡ�ź�
//LCD_RS	��PC8	//�Ĵ���/����ѡ���ź�
//LCD_WR	��PC7	//д�ź�
//LCD_RD	��PC6	//���ź�
//LCD_RST	��PC5	//��λ�ź�
//LCD_LED	��PC10	//��������ź�(�ߵ�ƽ����)
//=========================================������������=========================================//
//��ʹ�ô�������ģ�鱾������������ɲ�����
//MO(MISO)	��PC2	//SPI�������
//MI(MOSI)	��PC3	//SPI��������
//PEN		��PC1	//�������ж��ź�
//TCS		��PC13	//����ICƬѡ
//CLK		��PC0	//SPI����ʱ��
**************************************************************************************************/	
	   
//����LCD��Ҫ����
//Ĭ��Ϊ����
_lcd_dev lcddev;

//������ɫ,������ɫ
u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
u16 DeviceCode;	 


//******************************************************************
//��������  LCD_WR_REG
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    ��Һ��������д��д16λָ��
//���������Reg:��д���ָ��ֵ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_WR_REG(u8 data)
{ 
	LCD_RS_CLR;//д��ַ  
 	LCD_CS_CLR; 
	 
	LCD_WR_CLR; 
	DATAOUT(data);
	LCD_WR_SET; 
 	LCD_CS_SET; 	
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
void LCD_WR_DATA(u16 data)
{
	LCD_RS_SET;
	LCD_CS_CLR;
	
	LCD_WR_CLR;
	DATAOUT(data);
	LCD_WR_SET;
	LCD_CS_SET;

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
	LCD_WR_DATA(color);

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
void LCD_WriteReg(u8 LCD_Reg, u16 LCD_RegValue)
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
	LCD_CS_CLR;
	LCD_RD_SET;
	LCD_RS_SET;//д��ַ  	 
	DATAOUT(POINT_COLOR>>8);	
	LCD_WR_CLR;
	LCD_WR_SET;	
	DATAOUT(POINT_COLOR);	
	LCD_WR_CLR;
	LCD_WR_SET;	 
	LCD_CS_SET;
#else
	LCD_WR_DATA(POINT_COLOR); 
#endif


}

//��ILI93xx����������ΪGBR��ʽ��������д���ʱ��ΪRGB��ʽ��
//ͨ���ú���ת��
//c:GBR��ʽ����ɫֵ
//����ֵ��RGB��ʽ����ɫֵ
u16 LCD_BGR2RGB(u16 c)
{
	u16  r,g,b,rgb;   
	b=(c>>0)&0x1f;
	g=(c>>5)&0x3f;
	r=(c>>11)&0x1f;	 
	rgb=(b<<11)+(g<<5)+(r<<0);		 
	return(rgb);
}		 
//��ȡ��ĳ�����ɫֵ	 
//x,y:����
//����ֵ:�˵����ɫ
u16 LCD_ReadPoint(u16 x,u16 y)
{
 	u16 r;	
	if(x>=lcddev.width||y>=lcddev.height)return 0;	//�����˷�Χ,ֱ�ӷ���		   
	LCD_SetCursor(x,y);
	LCD_WR_REG(0x2E);      		 		//����IC���Ͷ�GRAMָ��
	GPIOB->CRL=0X88888888; //PB0-7  ��������
	GPIOB->CRH=0X88888888; //PB8-15 ��������
	GPIOB->ODR=0XFFFF;     //ȫ�������

	LCD_RS_SET;
	LCD_CS_CLR;

 	//dummy READ
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//ʵ��������ɫ
	LCD_RD_SET;
	
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//ʵ��������ɫ
	LCD_RD_SET;
	
	LCD_CS_SET;
	GPIOB->CRL=0X33333333; 		//PB0-7  �������
	GPIOB->CRH=0X33333333; 		//PB8-15 �������
	GPIOB->ODR=0XFFFF;    		//ȫ�������  


	return (r);
}

//��ȡ��ĳ�����ɫֵ	 
//x,y:����
//����ֵ:�˵����ɫ
u16 LCD_ID(void)
{
 	u16 r;
	
	//LCD_SetCursor(0,0);
	LCD_WR_REG(0xBF);      		 		//����IC���Ͷ�GRAMָ��
	GPIOB->CRL=0X88888888; //PB0-7  ��������
	GPIOB->CRH=0X88888888; //PB8-15 ��������
	GPIOB->ODR=0XFFFF;     //ȫ�������

	LCD_RS_SET;
	LCD_CS_CLR;

 	//dummy READ
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//ʵ��������ɫ
	LCD_RD_SET;
	
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//ʵ��������ɫ
	LCD_RD_SET;
	
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//0x62
	LCD_RD_SET;
	
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=DATAIN;  	//0x83
	LCD_RD_SET;
	
	LCD_RD_CLR;					   
	delay_us(1);//��ʱ1us					   
 	r=(r<<8)|DATAIN;  	//0x83
	LCD_RD_SET;
	
	LCD_CS_SET;
	GPIOB->CRL=0X33333333; 		//PB0-7  �������
	GPIOB->CRH=0X33333333; 		//PB8-15 �������
	GPIOB->ODR=0XFFFF;    		//ȫ�������  


	return (r);
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
	LCD_RS_SET;
	LCD_CS_CLR;
	
	
	for(index=0;index<total;index++)
	{
		//LCD_WR_DATA(Color);		
DATAOUT(Color);
	LCD_WR_CLR;
	LCD_WR_SET;		
	}
//LCD_CS_SET;
	
} 

//******************************************************************
//��������  LCD_GPIOInit
//���ߣ�    xiao��@ȫ������
//���ڣ�    2013-02-22
//���ܣ�    Һ����IO��ʼ����Һ����ʼ��ǰҪ���ô˺���
//�����������
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_GPIOInit(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;

 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC|RCC_APB2Periph_GPIOB|RCC_APB2Periph_AFIO, ENABLE); 
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_9|GPIO_Pin_8|GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5;	   //GPIO_Pin_10
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &GPIO_InitStructure); //GPIOC	
	GPIO_SetBits(GPIOC,GPIO_Pin_10|GPIO_Pin_9|GPIO_Pin_8|GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5);


	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;	//  
		GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure); //GPIOB
	GPIO_SetBits(GPIOB,GPIO_Pin_All);	 
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
void LCD_RESET(void)
{
	LCD_RST_CLR;
	delay_ms(100);	
	LCD_RST_SET;
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
     										 
	LCD_GPIOInit();
 	LCD_RESET();
	//LCD_RD_SET;

	
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
	

	LCD_SetParam();//����LCD����	 
	LCD_LED=1;//��������	 
	LCD_Clear(WHITE);
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
//delay_us(1);	
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


