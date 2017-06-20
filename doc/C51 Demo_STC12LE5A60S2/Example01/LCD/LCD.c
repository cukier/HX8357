#include "sys.h"
#include "lcd.h"
//////////////////////////////////////////////////////////////////////////////////	 
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//测试硬件：单片机STC12LE5A60S2,晶振30M  单片机工作电压3.3V
//QDtech-TFT液晶驱动 for C51
//xiao冯@ShenZhen QDtech co.,LTD
//公司网站:www.qdtech.net
//淘宝网站：http://qdtech.taobao.com
//我司提供技术支持，任何技术问题欢迎随时交流学习
//固话(传真) :+86 0755-23594567 
//手机:15989313508（冯工） 
//邮箱:QDtech2008@gmail.com 
//Skype:QDtech2008
//技术交流QQ群:324828016
//创建日期:2013/5/13
//版本：V1.1
//版权所有，盗版必究。
//Copyright(C) 深圳市全动电子技术有限公司 2009-2019
//All rights reserved
//********************************************************************************

/**************************************************************************************
//=======================================液晶屏数据线接线==========================================//
//P2组高8位数据口,DB8-DB15依次连接P2^0-P2^7;8位模式下只使用高8位
#define  LCD_DataPortH P2 
//P0组低8位数据口,DB0-DB7依次连接P0^0-P0^7;请确认P0口已经上拉10K电阻,不宜太小，最小4.7K,推荐10K.    
#define  LCD_DataPortL P0     
//=======================================液晶屏控制线接线==========================================//
CS=P1^3;		//片选	
RS=P1^2;  		//数据/命令切换
WR=P1^1;		//写控制
RD=P1^0;		//读控制
RESET=P3^3;	 	//复位 
LCD_BL=P3^2;	//背光控制
//=========================================触摸屏触接线=========================================//
//不使用触摸或者模块本身不带触摸，则可不连接
DCLK	  =    P3^6; //触摸屏SPI总线时钟信号接P3.6  
TCS       =    P3^7; //触摸片选TCS接P3.7
DIN       =    P3^4; //MOSI接P3.4	
DOUT      =    P3^5; //MISO接P3.5																						   
Penirq    =    P4^0; //PEN引脚接P4.0，如单片机无P4组，请自行更改其他可用IO并修改代码定义
**************************************************************************************************/	

//LCD的画笔颜色和背景色	   
u16 POINT_COLOR=0x0000;	//画笔颜色
u16 BACK_COLOR=0xFFFF;  //背景色 
//管理LCD重要参数
//默认为竖屏
_lcd_dev lcddev;



//******************************************************************
//函数名：  LCD_Write_Bus
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    向液晶屏总线写入数据(LCD驱动内部函数)
//输入参数：VH:高8位数据
//        	VL:低8位数据
//返回值：  无
//修改记录：无
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
//函数名：  LCD_WR_DATA8
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    向液晶屏总线写入写8位数据
//输入参数：VH:高8位数据
//        	VL:低8位数据
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_WR_DATA8(char VH,char VL) 
{
	LCD_RS=1;
	LCD_Write_Bus(VH,VL);
} 

//******************************************************************
//函数名：  LCD_WR_REG
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    向液晶屏总线写入写16位指令
//输入参数：Reg:待写入的指令值
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_WR_REG(int Reg)	 
{	
	LCD_RS=0;
	LCD_Write_Bus(Reg>>8,Reg);
} 

//******************************************************************
//函数名：  LCD_WR_DATA
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    向液晶屏总线写入写16位数据
//输入参数：Data:待写入的数据
//返回值：  无
//修改记录：无
//******************************************************************
 void LCD_WR_DATA(int Data)
{
	LCD_RS=1;
	LCD_Write_Bus(Data>>8,Data);
}

//******************************************************************
//函数名：  LCD_WriteReg
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    写寄存器数据
//输入参数：LCD_Reg:寄存器地址
//			LCD_RegValue:要写入的数据
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
{
  LCD_WR_REG(LCD_Reg);
	LCD_WR_DATA(LCD_RegValue);
}

//******************************************************************
//函数名：  LCD_WriteRAM_Prepare
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    开始写GRAM
//			在给液晶屏传送RGB数据前，应该发送写GRAM指令
//输入参数：无
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_WriteRAM_Prepare(void)
{
 	LCD_WR_REG(lcddev.wramcmd);	  
}


//******************************************************************
//函数名：  LCD_Clear
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    LCD全屏填充清屏函数
//输入参数：Color:要清屏的填充色
//返回值：  无
//修改记录：无
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
//函数名：  LCD_DrawPoint
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    在指定位置写入一个像素点数据
//输入参数：(x,y):光标坐标
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_DrawPoint(u16 x,u16 y)
{
	LCD_SetCursor(x,y);//设置光标位置 
#if LCD_USE8BIT_MODEL==1
	LCD_CS=0;
	LCD_RD=1;
	LCD_RS=1;//写地址  	 
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
//函数名：  LCD_DrawPoint_16Bit
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    8位总线下如何写入一个16位数据
//输入参数：(x,y):光标坐标
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_DrawPoint_16Bit(u16 color)
{
#if LCD_USE8BIT_MODEL==1
	LCD_CS=0;
	LCD_RD=1;
	LCD_RS=1;//写地址  	 
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
//函数名：  LCD_Reset
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    LCD复位函数，液晶初始化前要调用此函数
//输入参数：无
//返回值：  无
//修改记录：无
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
//函数名：  LCD_Init
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    LCD初始化
//输入参数：无
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_Init(void)
{
	LCD_Reset(); //初始化之前复位
	//LCD_RD=1;	 //RD引脚没有用到，拉高处理

	//=========================液晶屏初始化=============================//
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

	//设置LCD属性参数
	LCD_SetParam();//设置LCD参数	 
	LCD_BL=1;//点亮背光	 
}
//******************************************************************
//函数名：  LCD_SetWindows
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    设置显示窗口
//输入参数：(xStar,yStar):窗口左上角起始坐标
//	 	   	(xEnd,yEnd):窗口右下角结束坐标
//返回值：  无
//修改记录：无
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

	LCD_WriteRAM_Prepare();	//开始写入GRAM		
}   

//******************************************************************
//函数名：  LCD_SetCursor
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    设置光标位置
//输入参数：Xpos:横坐标
//			Ypos:纵坐标
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_SetCursor(u16 Xpos, u16 Ypos)
{	  	    			
	LCD_SetWindows(Xpos,Ypos,Xpos+1,Ypos+1);			
} 

//******************************************************************
//函数名：  LCD_SetParam
//作者：    xiao冯@全动电子
//日期：    2013-02-22
//功能：    设置LCD参数，方便进行横竖屏模式切换
//输入参数：无
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_SetParam(void)
{ 
	lcddev.setxcmd=0x2A;
	lcddev.setycmd=0x2B;
	lcddev.wramcmd=0x2C;
#if USE_HORIZONTAL==1	//使用横屏	  
	lcddev.dir=1;//横屏
	lcddev.width=480;
	lcddev.height=320;			
	LCD_WriteReg(0x36,0x3B);//BGR==1,MY==1,MX==0,MV==1  63
#else//竖屏
	lcddev.dir=0;//竖屏				 	 		
	lcddev.width=320;
	lcddev.height=480;	
	LCD_WriteReg(0x36,0X0A);//BGR==1,MY==0,MX==0,MV==0
#endif
}	  







