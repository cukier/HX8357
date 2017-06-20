EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:m_device
LIBS:w_relay
LIBS:w_rtx
LIBS:ds1307
LIBS:HX8357-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "HX8357"
Date "2017-06-20"
Rev "0"
Comp ""
Comment1 ""
Comment2 "mauriciocukier@gmail.com"
Comment3 "Engenheiro Eletrico"
Comment4 "Mauricio Cukier"
$EndDescr
$Comp
L BARREL_JACK J1
U 1 1 5948FE18
P 1250 950
F 0 "J1" H 1250 1145 50  0000 C CNN
F 1 "BARREL_JACK" H 1250 795 50  0000 C CNN
F 2 "w_conn_misc:dc_socket" H 1250 950 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/670/pj-002ah-516007.pdf" H 1250 950 50  0001 C CNN
F 4 "PJ-002AH" H 1250 950 60  0001 C CNN "MNP"
F 5 "6460" H 1250 950 60  0001 C CNN "Equitronic"
	1    1250 950 
	1    0    0    -1  
$EndComp
$Comp
L D_AK D1
U 1 1 5948FEBF
P 2100 850
F 0 "D1" H 2100 950 50  0000 C CNN
F 1 "RGF1A" H 2100 750 50  0000 C CNN
F 2 "w_smd_diode:do214ac" H 2100 850 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/RGF1A-890104.pdf" H 2100 850 50  0001 C CNN
F 4 "RGF1A" H 2100 850 60  0001 C CNN "MNP"
F 5 "5900" H 2100 850 60  0001 C CNN "Equitronic"
	1    2100 850 
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 5949074A
P 1700 1100
F 0 "#PWR01" H 1700 850 50  0001 C CNN
F 1 "GND" H 1700 950 50  0000 C CNN
F 2 "" H 1700 1100 50  0001 C CNN
F 3 "" H 1700 1100 50  0001 C CNN
	1    1700 1100
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 594907A6
P 2550 1150
F 0 "C1" H 2575 1250 50  0000 L CNN
F 1 "470uF 63V" H 2575 1050 50  0000 L CNN
F 2 "w_capacitors:CP_12.5x25mm" H 2588 1000 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/ABA0000C1047-947484.pdf" H 2550 1150 50  0001 C CNN
F 4 "ECA-1JM471" H 2550 1150 60  0001 C CNN "MNP"
F 5 "1984" H 2550 1150 60  0001 C CNN "Equitronic"
	1    2550 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 594907DF
P 2550 1400
F 0 "#PWR02" H 2550 1150 50  0001 C CNN
F 1 "GND" H 2550 1250 50  0000 C CNN
F 2 "" H 2550 1400 50  0001 C CNN
F 3 "" H 2550 1400 50  0001 C CNN
	1    2550 1400
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 594908C0
P 3200 1150
F 0 "C3" H 3225 1250 50  0000 L CNN
F 1 "100nF 50V" H 3225 1050 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 3238 1000 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 3200 1150 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 3200 1150 60  0001 C CNN "MNP"
F 5 "6023" H 3200 1150 60  0001 C CNN "Equitronic"
	1    3200 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 594908F9
P 3200 1400
F 0 "#PWR03" H 3200 1150 50  0001 C CNN
F 1 "GND" H 3200 1250 50  0000 C CNN
F 2 "" H 3200 1400 50  0001 C CNN
F 3 "" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Connection ~ 2550 850 
Wire Wire Line
	3200 850  3200 1000
Wire Wire Line
	3200 1400 3200 1300
Wire Wire Line
	2550 1400 2550 1300
Wire Wire Line
	2250 850  3650 850 
Wire Wire Line
	2550 1000 2550 850 
$Comp
L LM7805CT U1
U 1 1 59491706
P 4050 900
F 0 "U1" H 3850 1100 50  0000 C CNN
F 1 "LM7805CV" H 4050 1100 50  0000 L CNN
F 2 "w_to:to220_5772" H 4050 1000 50  0001 C CIN
F 3 "https://www.sparkfun.com/datasheets/Components/LM7805.pdf" H 4050 900 50  0001 C CNN
F 4 "LM7805CV" H 4050 900 60  0001 C CNN "MNP"
F 5 "16316" H 4050 900 60  0001 C CNN "Equitronic"
	1    4050 900 
	1    0    0    -1  
$EndComp
Connection ~ 3200 850 
$Comp
L GND #PWR04
U 1 1 59491956
P 4050 1250
F 0 "#PWR04" H 4050 1000 50  0001 C CNN
F 1 "GND" H 4050 1100 50  0000 C CNN
F 2 "" H 4050 1250 50  0001 C CNN
F 3 "" H 4050 1250 50  0001 C CNN
	1    4050 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1250 4050 1150
$Comp
L C C5
U 1 1 59491985
P 4600 1150
F 0 "C5" H 4625 1250 50  0000 L CNN
F 1 "100nF 50V" H 4625 1050 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 4638 1000 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 4600 1150 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 4600 1150 60  0001 C CNN "MNP"
F 5 "6023" H 4600 1150 60  0001 C CNN "Equitronic"
	1    4600 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1000 4600 850 
Wire Wire Line
	4450 850  5400 850 
$Comp
L GND #PWR05
U 1 1 594919F4
P 4600 1400
F 0 "#PWR05" H 4600 1150 50  0001 C CNN
F 1 "GND" H 4600 1250 50  0000 C CNN
F 2 "" H 4600 1400 50  0001 C CNN
F 3 "" H 4600 1400 50  0001 C CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1400 4600 1300
$Comp
L CP C7
U 1 1 59491A93
P 5150 1150
F 0 "C7" H 5175 1250 50  0000 L CNN
F 1 "470uF 10V" H 5175 1050 50  0000 L CNN
F 2 "w_capacitors:CP_8x11.5mm" H 5188 1000 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/ABA0000CE22-68457.pdf" H 5150 1150 50  0001 C CNN
F 4 "EEU-FC1A471" H 5150 1150 60  0001 C CNN "MNP"
F 5 "1978" H 5150 1150 60  0001 C CNN "Equitronic"
	1    5150 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 59491AFE
P 5150 1400
F 0 "#PWR06" H 5150 1150 50  0001 C CNN
F 1 "GND" H 5150 1250 50  0000 C CNN
F 2 "" H 5150 1400 50  0001 C CNN
F 3 "" H 5150 1400 50  0001 C CNN
	1    5150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1400 5150 1300
Wire Wire Line
	5150 800  5150 1000
Connection ~ 4600 850 
Connection ~ 5150 850 
$Comp
L CONN_01X02 J2
U 1 1 59492809
P 10150 3150
F 0 "J2" H 10150 3300 50  0000 C CNN
F 1 "CONN_01X02" V 10250 3150 50  0000 C CNN
F 2 "w_conn_mkds:mkds_1,5-2" H 10150 3150 50  0001 C CNN
F 3 "https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=1868733" H 10150 3150 50  0001 C CNN
F 4 "MKDS 1,5/ 2-B-5,08" H 10150 3150 60  0001 C CNN "MNP"
F 5 "BR202A" H 10150 3150 60  0001 C CNN "Metaltex"
	1    10150 3150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 950  1750 950 
Wire Wire Line
	1750 950  1750 850 
Wire Wire Line
	1750 850  1950 850 
Wire Wire Line
	1550 850  1700 850 
Wire Wire Line
	1700 850  1700 1100
Wire Wire Line
	1550 1050 1700 1050
Connection ~ 1700 1050
$Comp
L +5V #PWR07
U 1 1 59494E2A
P 5150 800
F 0 "#PWR07" H 5150 650 50  0001 C CNN
F 1 "+5V" H 5150 940 50  0000 C CNN
F 2 "" H 5150 800 50  0001 C CNN
F 3 "" H 5150 800 50  0001 C CNN
	1    5150 800 
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-PU U2
U 1 1 59495192
P 2850 3800
F 0 "U2" H 2100 5050 50  0000 L BNN
F 1 "ATMEGA328P-PU" H 3250 2400 50  0000 L BNN
F 2 "w_pth_circuits:dil_28-300_socket" H 2850 3800 50  0001 C CIN
F 3 "http://www.mouser.com/ds/2/268/atmel-8271-8-bit-avr-microcontroller-atmega48a-48p-1065900.pdf" H 2850 3800 50  0001 C CNN
F 4 "ATMEGA328P-PU" H 2850 3800 60  0001 C CNN "MNP"
F 5 "-" H 2850 3800 60  0001 C CNN "Equitronic"
	1    2850 3800
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 594955B4
P 1600 4250
F 0 "C4" H 1625 4350 50  0000 L CNN
F 1 "100nF 50V" H 1625 4150 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 1638 4100 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 1600 4250 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 1600 4250 60  0001 C CNN "MNP"
F 5 "6023" H 1600 4250 60  0001 C CNN "Equitronic"
	1    1600 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5949595C
P 1600 4500
F 0 "#PWR08" H 1600 4250 50  0001 C CNN
F 1 "GND" H 1600 4350 50  0000 C CNN
F 2 "" H 1600 4500 50  0001 C CNN
F 3 "" H 1600 4500 50  0001 C CNN
	1    1600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4500 1600 4400
$Comp
L +5V #PWR09
U 1 1 59495AA4
P 1600 4000
F 0 "#PWR09" H 1600 3850 50  0001 C CNN
F 1 "+5V" H 1600 4140 50  0000 C CNN
F 2 "" H 1600 4000 50  0001 C CNN
F 3 "" H 1600 4000 50  0001 C CNN
	1    1600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4000 1600 4100
$Comp
L +5V #PWR010
U 1 1 59495C8D
P 1850 2600
F 0 "#PWR010" H 1850 2450 50  0001 C CNN
F 1 "+5V" H 1850 2740 50  0000 C CNN
F 2 "" H 1850 2600 50  0001 C CNN
F 3 "" H 1850 2600 50  0001 C CNN
	1    1850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2600 1850 2700
Wire Wire Line
	1850 2700 1950 2700
$Comp
L CP C2
U 1 1 59496670
P 1400 3300
F 0 "C2" H 1425 3400 50  0000 L CNN
F 1 "10uF 6.3V" H 1425 3200 50  0000 L CNN
F 2 "w_capacitors:CP_4x5mm" H 1438 3150 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/293/e-ump-880102.pdf" H 1400 3300 50  0001 C CNN
F 4 "UMP1A100MDD" H 1400 3300 60  0001 C CNN "MNP"
F 5 "-" H 1400 3300 60  0001 C CNN "Equitronic"
	1    1400 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 59496676
P 1400 3550
F 0 "#PWR011" H 1400 3300 50  0001 C CNN
F 1 "GND" H 1400 3400 50  0000 C CNN
F 2 "" H 1400 3550 50  0001 C CNN
F 3 "" H 1400 3550 50  0001 C CNN
	1    1400 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3550 1400 3450
Wire Wire Line
	1400 3150 1400 3000
Wire Wire Line
	1400 3000 1950 3000
$Comp
L GND #PWR012
U 1 1 594966C0
P 1900 3400
F 0 "#PWR012" H 1900 3150 50  0001 C CNN
F 1 "GND" H 1900 3250 50  0000 C CNN
F 2 "" H 1900 3400 50  0001 C CNN
F 3 "" H 1900 3400 50  0001 C CNN
	1    1900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3400 1900 3300
Wire Wire Line
	1900 3300 1950 3300
$Comp
L GND #PWR013
U 1 1 59496719
P 1850 5150
F 0 "#PWR013" H 1850 4900 50  0001 C CNN
F 1 "GND" H 1850 5000 50  0000 C CNN
F 2 "" H 1850 5150 50  0001 C CNN
F 3 "" H 1850 5150 50  0001 C CNN
	1    1850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4900 1850 5150
Wire Wire Line
	1850 4900 1950 4900
Wire Wire Line
	1950 5000 1850 5000
Connection ~ 1850 5000
$Comp
L CONN_02X18 J4
U 1 1 594972DC
P 9150 4900
F 0 "J4" H 9150 5850 50  0000 C CNN
F 1 "HX8357" V 9150 4900 50  0000 C CNN
F 2 "w_pin_strip:pin_strip_18x2" H 9150 3850 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/1/TS2156-43316.pdf" H 9150 3850 50  0001 C CNN
F 4 "951218-8622-AR" H 9150 4900 60  0001 C CNN "MNP"
F 5 "592" H 9150 4900 60  0001 C CNN "Equitronic"
	1    9150 4900
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 J3
U 1 1 594978AB
P 7000 900
F 0 "J3" H 7000 1100 50  0000 C CNN
F 1 "ICSP" H 7000 700 50  0000 C CNN
F 2 "w_pin_strip:pin_strip_3x2" H 7000 -300 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/1/ts0769-35914.pdf" H 7000 -300 50  0001 C CNN
F 4 "929665-09-03-I" H 7000 900 60  0001 C CNN "MNP"
F 5 "592" H 7000 900 60  0001 C CNN "Equitronic"
	1    7000 900 
	1    0    0    -1  
$EndComp
$Comp
L switch_psw U4
U 1 1 59497B22
P 6950 1800
F 0 "U4" H 6700 2150 60  0000 C CNN
F 1 "PSW-8,5R" H 7250 2150 60  0000 C CNN
F 2 "psw:psw-8,5" H 6700 1800 60  0001 C CNN
F 3 "http://www.metaltex.com.br/produtos/componentes/5910/chaves_e_micro_chaves/6368/psw_chave_quadrada_para_ci" H 6700 1800 60  0001 C CNN
F 4 "PSW-8,5R" H 6950 1800 60  0001 C CNN "MNP"
	1    6950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 800  6500 800 
Wire Wire Line
	6750 900  6500 900 
Wire Wire Line
	6750 1000 6500 1000
Text Label 6500 800  0    60   ~ 0
MISO
Text Label 6500 900  0    60   ~ 0
SCK
Text Label 6500 1000 0    60   ~ 0
RST
Wire Wire Line
	7500 900  7250 900 
$Comp
L +5V #PWR014
U 1 1 594985EC
P 7300 750
F 0 "#PWR014" H 7300 600 50  0001 C CNN
F 1 "+5V" H 7300 890 50  0000 C CNN
F 2 "" H 7300 750 50  0001 C CNN
F 3 "" H 7300 750 50  0001 C CNN
	1    7300 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 800  7300 800 
Wire Wire Line
	7300 800  7300 750 
$Comp
L GND #PWR015
U 1 1 594988FB
P 7300 1050
F 0 "#PWR015" H 7300 800 50  0001 C CNN
F 1 "GND" H 7300 900 50  0000 C CNN
F 2 "" H 7300 1050 50  0001 C CNN
F 3 "" H 7300 1050 50  0001 C CNN
	1    7300 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1050 7300 1000
Wire Wire Line
	7300 1000 7250 1000
Text Label 7500 900  2    60   ~ 0
MOSI
Wire Wire Line
	3850 3100 4300 3100
Wire Wire Line
	3850 3200 4300 3200
Wire Wire Line
	3850 3000 4300 3000
Text Label 4300 3000 2    60   ~ 0
PB3
Text Label 4300 3100 2    60   ~ 0
PB4
Wire Wire Line
	4300 4150 3850 4150
Text Label 4300 4150 2    60   ~ 0
RST
Text Label 6450 1700 0    60   ~ 0
PB4
Wire Wire Line
	6450 1700 6650 1700
Text Label 7650 1650 2    60   ~ 0
MISO
Wire Wire Line
	7650 1650 7200 1650
Text Label 6450 1900 0    60   ~ 0
PB3
Wire Wire Line
	6450 1900 6650 1900
Wire Wire Line
	7650 1850 7200 1850
Text Label 7650 1850 2    60   ~ 0
MOSI
Wire Wire Line
	7650 1750 7200 1750
Wire Wire Line
	7650 1950 7200 1950
Text Label 4300 3200 2    60   ~ 0
SCK
$Comp
L C C12
U 1 1 594A0ADD
P 10400 4750
F 0 "C12" H 10425 4850 50  0000 L CNN
F 1 "100nF 50V" H 10425 4650 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 10438 4600 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 10400 4750 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 10400 4750 60  0001 C CNN "MNP"
F 5 "6023" H 10400 4750 60  0001 C CNN "Equitronic"
	1    10400 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 594A0AE3
P 10400 5000
F 0 "#PWR016" H 10400 4750 50  0001 C CNN
F 1 "GND" H 10400 4850 50  0000 C CNN
F 2 "" H 10400 5000 50  0001 C CNN
F 3 "" H 10400 5000 50  0001 C CNN
	1    10400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 5000 10400 4900
$Comp
L +5V #PWR017
U 1 1 594A0AEA
P 10400 4500
F 0 "#PWR017" H 10400 4350 50  0001 C CNN
F 1 "+5V" H 10400 4640 50  0000 C CNN
F 2 "" H 10400 4500 50  0001 C CNN
F 3 "" H 10400 4500 50  0001 C CNN
	1    10400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 4500 10400 4600
$Comp
L +5V #PWR018
U 1 1 594A0B69
P 8850 3950
F 0 "#PWR018" H 8850 3800 50  0001 C CNN
F 1 "+5V" H 8850 4090 50  0000 C CNN
F 2 "" H 8850 3950 50  0001 C CNN
F 3 "" H 8850 3950 50  0001 C CNN
	1    8850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3950 8850 4050
Wire Wire Line
	8850 4050 8900 4050
$Comp
L +5V #PWR019
U 1 1 594A0DCC
P 9450 3950
F 0 "#PWR019" H 9450 3800 50  0001 C CNN
F 1 "+5V" H 9450 4090 50  0000 C CNN
F 2 "" H 9450 3950 50  0001 C CNN
F 3 "" H 9450 3950 50  0001 C CNN
	1    9450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3950 9450 4050
Wire Wire Line
	9450 4050 9400 4050
$Comp
L GND #PWR020
U 1 1 594A125C
P 8850 5850
F 0 "#PWR020" H 8850 5600 50  0001 C CNN
F 1 "GND" H 8850 5700 50  0000 C CNN
F 2 "" H 8850 5850 50  0001 C CNN
F 3 "" H 8850 5850 50  0001 C CNN
	1    8850 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5850 8850 5750
Wire Wire Line
	8850 5750 8900 5750
$Comp
L GND #PWR021
U 1 1 594A1397
P 9450 5850
F 0 "#PWR021" H 9450 5600 50  0001 C CNN
F 1 "GND" H 9450 5700 50  0000 C CNN
F 2 "" H 9450 5850 50  0001 C CNN
F 3 "" H 9450 5850 50  0001 C CNN
	1    9450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5850 9450 5750
Wire Wire Line
	9450 5750 9400 5750
Wire Wire Line
	8450 4150 8900 4150
Text Label 8450 4150 0    60   ~ 0
DB8
Wire Wire Line
	8450 4250 8900 4250
Text Label 8450 4250 0    60   ~ 0
DB10
Wire Wire Line
	8450 4350 8900 4350
Text Label 8450 4350 0    60   ~ 0
DB12
Wire Wire Line
	8450 4450 8900 4450
Text Label 8450 4450 0    60   ~ 0
DB14
Wire Wire Line
	9850 4150 9400 4150
Text Label 9850 4150 2    60   ~ 0
DB9
Wire Wire Line
	9850 4250 9400 4250
Text Label 9850 4250 2    60   ~ 0
DB11
Wire Wire Line
	9850 4350 9400 4350
Text Label 9850 4350 2    60   ~ 0
DB13
Wire Wire Line
	9850 4450 9400 4450
Text Label 9850 4450 2    60   ~ 0
DB15
NoConn ~ 8900 4550
NoConn ~ 9400 4550
NoConn ~ 8900 4650
NoConn ~ 9400 4650
NoConn ~ 8900 4750
NoConn ~ 9400 4750
NoConn ~ 8900 4850
NoConn ~ 9400 4850
Wire Wire Line
	8450 4950 8900 4950
Text Label 8450 4950 0    60   ~ 0
RS
Wire Wire Line
	9850 4950 9400 4950
Text Label 9850 4950 2    60   ~ 0
WR
Wire Wire Line
	8450 5050 8900 5050
Text Label 8450 5050 0    60   ~ 0
CS
Wire Wire Line
	9850 5050 9400 5050
Text Label 9850 5050 2    60   ~ 0
LCDRST
NoConn ~ 9400 5150
NoConn ~ 8900 5150
NoConn ~ 8900 5250
NoConn ~ 8900 5350
NoConn ~ 8900 5450
NoConn ~ 9400 5450
NoConn ~ 9400 5350
Wire Wire Line
	9850 5250 9400 5250
Text Label 9850 5250 2    60   ~ 0
SPI_CS
Wire Wire Line
	9850 5550 9400 5550
Wire Wire Line
	9850 5650 9400 5650
Text Label 9850 5550 2    60   ~ 0
SPI_MOSI
Text Label 9850 5650 2    60   ~ 0
SD_CS
Wire Wire Line
	8900 5550 8450 5550
Wire Wire Line
	8900 5650 8450 5650
Text Label 8450 5550 0    60   ~ 0
SPI_MISO
Text Label 4300 2700 2    60   ~ 0
DB8
Wire Wire Line
	4300 2700 3850 2700
Text Label 4300 2800 2    60   ~ 0
DB9
Wire Wire Line
	4300 2800 3850 2800
Wire Wire Line
	4300 2900 3850 2900
Text Label 4300 2900 2    60   ~ 0
SD_CS
$Comp
L Crystal Y1
U 1 1 594AC0EC
P 2450 5600
F 0 "Y1" H 2450 5750 50  0000 C CNN
F 1 "16MHz" H 2450 5450 50  0000 C CNN
F 2 "w_crystal:crystal_hc-49%2fsmd" H 2450 5600 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/122/CSM-3X-948490.pdf" H 2450 5600 50  0001 C CNN
F 4 "ECS-160-20-3X-TR" H 2450 5600 60  0001 C CNN "MNP"
F 5 "5801" H 2450 5600 60  0001 C CNN "Equitronic"
	1    2450 5600
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 594AC593
P 2200 5900
F 0 "C6" H 2225 6000 50  0000 L CNN
F 1 "22pF" H 2225 5800 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 2238 5750 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/281/c02e-2905.pdf" H 2200 5900 50  0001 C CNN
F 4 "GQM2195C2E280JB12D" H 2200 5900 60  0001 C CNN "MNP"
F 5 "2928" H 2200 5900 60  0001 C CNN "Equitronic"
	1    2200 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 594AC81B
P 2200 6150
F 0 "#PWR022" H 2200 5900 50  0001 C CNN
F 1 "GND" H 2200 6000 50  0000 C CNN
F 2 "" H 2200 6150 50  0001 C CNN
F 3 "" H 2200 6150 50  0001 C CNN
	1    2200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6150 2200 6050
Wire Wire Line
	2200 5250 2200 5750
Wire Wire Line
	2200 5600 2300 5600
$Comp
L GND #PWR023
U 1 1 594ACB4C
P 2700 6150
F 0 "#PWR023" H 2700 5900 50  0001 C CNN
F 1 "GND" H 2700 6000 50  0000 C CNN
F 2 "" H 2700 6150 50  0001 C CNN
F 3 "" H 2700 6150 50  0001 C CNN
	1    2700 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6150 2700 6050
Wire Wire Line
	2700 5250 2700 5750
Wire Wire Line
	2700 5600 2600 5600
Connection ~ 2200 5600
Connection ~ 2700 5600
Text Label 2200 5250 3    60   ~ 0
XTAL1
Text Label 2700 5250 3    60   ~ 0
XTAL2
Wire Wire Line
	3850 3300 4300 3300
Wire Wire Line
	3850 3400 4300 3400
Text Label 4300 3300 2    60   ~ 0
XTAL1
Text Label 4300 3400 2    60   ~ 0
XTAL2
Wire Wire Line
	4300 3550 3850 3550
Wire Wire Line
	4300 3650 3850 3650
Wire Wire Line
	4300 3750 3850 3750
Wire Wire Line
	4300 3850 3850 3850
Wire Wire Line
	4300 3950 3850 3950
Wire Wire Line
	4300 4050 3850 4050
Text Label 4300 3550 2    60   ~ 0
DB10
Text Label 4300 3650 2    60   ~ 0
DB11
Text Label 4300 3750 2    60   ~ 0
DB12
Text Label 4300 3850 2    60   ~ 0
DB13
Text Label 4300 3950 2    60   ~ 0
SDA
Text Label 4300 4050 2    60   ~ 0
SCL
Wire Wire Line
	4300 4300 3850 4300
Wire Wire Line
	4300 4400 3850 4400
Text Label 4300 4300 2    60   ~ 0
RX
Text Label 4300 4400 2    60   ~ 0
TX
Wire Wire Line
	4300 4500 3850 4500
Wire Wire Line
	4300 4600 3850 4600
Text Label 4300 4500 2    60   ~ 0
DB14
Text Label 4300 4600 2    60   ~ 0
DB15
Wire Wire Line
	4300 4700 3850 4700
Wire Wire Line
	4300 4800 3850 4800
Wire Wire Line
	4300 4900 3850 4900
Text Label 4300 4700 2    60   ~ 0
RS
Text Label 4300 4800 2    60   ~ 0
WR
Text Label 4300 4900 2    60   ~ 0
CS
Text Label 8450 5650 0    60   ~ 0
SCK
Text Label 7650 1950 2    60   ~ 0
SPI_MOSI
Text Label 7650 1750 2    60   ~ 0
SPI_MISO
$Comp
L DS1307 U3
U 1 1 594B5110
P 6200 3350
F 0 "U3" H 6000 3650 60  0000 C CNN
F 1 "DS1307" H 6300 3650 60  0000 C CNN
F 2 "w_smd_dil:so-8" H 6200 3350 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1307.pdf" H 6200 3350 60  0001 C CNN
F 4 "DS1307Z+" H 6200 3350 60  0001 C CNN "MNP"
F 5 "12126" H 6200 3350 60  0001 C CNN "Equitronic"
	1    6200 3350
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y2
U 1 1 594B58DA
P 6600 4400
F 0 "Y2" H 6600 4550 50  0000 C CNN
F 1 "32.768KHz" H 6600 4250 50  0000 C CNN
F 2 "w_crystal:crystal_tc-26_horiz" H 6600 4400 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/77/CMR200T-365061.pdf" H 6600 4400 50  0001 C CNN
F 4 "CMR200T-32.768KDZB-UT" H 6600 4400 60  0001 C CNN "MNP"
F 5 "6955" H 6600 4400 60  0001 C CNN "Equitronic"
	1    6600 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 594B58E8
P 6350 4950
F 0 "#PWR024" H 6350 4700 50  0001 C CNN
F 1 "GND" H 6350 4800 50  0000 C CNN
F 2 "" H 6350 4950 50  0001 C CNN
F 3 "" H 6350 4950 50  0001 C CNN
	1    6350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4950 6350 4850
Wire Wire Line
	6350 4050 6350 4550
Wire Wire Line
	6350 4400 6450 4400
$Comp
L GND #PWR025
U 1 1 594B58FA
P 6850 4950
F 0 "#PWR025" H 6850 4700 50  0001 C CNN
F 1 "GND" H 6850 4800 50  0000 C CNN
F 2 "" H 6850 4950 50  0001 C CNN
F 3 "" H 6850 4950 50  0001 C CNN
	1    6850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4950 6850 4850
Wire Wire Line
	6850 4050 6850 4550
Wire Wire Line
	6850 4400 6750 4400
Connection ~ 6350 4400
Connection ~ 6850 4400
Text Label 6350 4050 3    60   ~ 0
XTAL3
Text Label 6850 4050 3    60   ~ 0
XTAL4
Wire Wire Line
	5700 3150 5400 3150
Wire Wire Line
	5700 3300 5400 3300
Text Label 5400 3150 0    60   ~ 0
XTAL3
Text Label 5400 3300 0    60   ~ 0
XTAL4
$Comp
L Battery BT1
U 1 1 594B6617
P 5550 4650
F 0 "BT1" H 5650 4750 50  0000 L CNN
F 1 "Battery" H 5650 4650 50  0000 L CNN
F 2 "w_battery_holders:keystone_103" V 5550 4710 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/215/03-745368.pdf" V 5550 4710 50  0001 C CNN
F 4 "103" H 5550 4650 60  0001 C CNN "MNP"
F 5 "16847" H 5550 4650 60  0001 C CNN "Equitronic"
	1    5550 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 594B6B7C
P 5550 4900
F 0 "#PWR026" H 5550 4650 50  0001 C CNN
F 1 "GND" H 5550 4750 50  0000 C CNN
F 2 "" H 5550 4900 50  0001 C CNN
F 3 "" H 5550 4900 50  0001 C CNN
	1    5550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4900 5550 4850
$Comp
L +BATT #PWR027
U 1 1 594B6C49
P 5550 4400
F 0 "#PWR027" H 5550 4250 50  0001 C CNN
F 1 "+BATT" H 5550 4540 50  0000 C CNN
F 2 "" H 5550 4400 50  0001 C CNN
F 3 "" H 5550 4400 50  0001 C CNN
	1    5550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4400 5550 4450
$Comp
L +BATT #PWR028
U 1 1 594B6FED
P 5250 3400
F 0 "#PWR028" H 5250 3250 50  0001 C CNN
F 1 "+BATT" H 5250 3540 50  0000 C CNN
F 2 "" H 5250 3400 50  0001 C CNN
F 3 "" H 5250 3400 50  0001 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3400 5250 3450
Wire Wire Line
	5250 3450 5700 3450
$Comp
L GND #PWR029
U 1 1 594B7329
P 5600 3700
F 0 "#PWR029" H 5600 3450 50  0001 C CNN
F 1 "GND" H 5600 3550 50  0000 C CNN
F 2 "" H 5600 3700 50  0001 C CNN
F 3 "" H 5600 3700 50  0001 C CNN
	1    5600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3700 5600 3600
Wire Wire Line
	5600 3600 5700 3600
$Comp
L +BATT #PWR030
U 1 1 594B7FC0
P 4450 4850
F 0 "#PWR030" H 4450 4700 50  0001 C CNN
F 1 "+BATT" H 4450 4990 50  0000 C CNN
F 2 "" H 4450 4850 50  0001 C CNN
F 3 "" H 4450 4850 50  0001 C CNN
	1    4450 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4850 4450 5000
Wire Wire Line
	4450 5000 3850 5000
$Comp
L +5V #PWR031
U 1 1 594B94E4
P 6800 3100
F 0 "#PWR031" H 6800 2950 50  0001 C CNN
F 1 "+5V" H 6800 3240 50  0000 C CNN
F 2 "" H 6800 3100 50  0001 C CNN
F 3 "" H 6800 3100 50  0001 C CNN
	1    6800 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3100 6800 3150
Wire Wire Line
	6800 3150 6700 3150
NoConn ~ 6700 3300
Wire Wire Line
	7000 3450 6700 3450
Wire Wire Line
	7000 3600 6700 3600
Text Label 7000 3600 2    60   ~ 0
SDA
Text Label 7000 3450 2    60   ~ 0
SCL
$Comp
L C C11
U 1 1 594BBF57
P 7450 3450
F 0 "C11" H 7475 3550 50  0000 L CNN
F 1 "100nF 50V" H 7475 3350 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 7488 3300 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 7450 3450 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 7450 3450 60  0001 C CNN "MNP"
F 5 "6023" H 7450 3450 60  0001 C CNN "Equitronic"
	1    7450 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 594BBF5D
P 7450 3700
F 0 "#PWR032" H 7450 3450 50  0001 C CNN
F 1 "GND" H 7450 3550 50  0000 C CNN
F 2 "" H 7450 3700 50  0001 C CNN
F 3 "" H 7450 3700 50  0001 C CNN
	1    7450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3700 7450 3600
$Comp
L +5V #PWR033
U 1 1 594BBF64
P 7450 3200
F 0 "#PWR033" H 7450 3050 50  0001 C CNN
F 1 "+5V" H 7450 3340 50  0000 C CNN
F 2 "" H 7450 3200 50  0001 C CNN
F 3 "" H 7450 3200 50  0001 C CNN
	1    7450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3200 7450 3300
$Comp
L PZT2222A Q1
U 1 1 594C3F74
P 8550 1850
F 0 "Q1" H 8750 1925 50  0000 L CNN
F 1 "MMBT2222A" H 8750 1850 50  0000 L CNN
F 2 "w_smd_trans:sot23" H 8750 1775 50  0001 L CIN
F 3 "http://www.mouser.com/ds/2/149/MMBT2222A-889894.pdf" H 8550 1850 50  0001 L CNN
F 4 "MMBT2222A" H 8550 1850 60  0001 C CNN "SKU"
F 5 "13136" H 8550 1850 60  0001 C CNN "Equitronic"
	1    8550 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 594C477F
P 8650 2150
F 0 "#PWR034" H 8650 1900 50  0001 C CNN
F 1 "GND" H 8650 2000 50  0000 C CNN
F 2 "" H 8650 2150 50  0001 C CNN
F 3 "" H 8650 2150 50  0001 C CNN
	1    8650 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2150 8650 2050
$Comp
L R R2
U 1 1 594C4CB8
P 8100 1850
F 0 "R2" V 8180 1850 50  0000 C CNN
F 1 "1k" V 8100 1850 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 8030 1850 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 8100 1850 50  0001 C CNN
F 4 "ERA-6AEB102V" V 8100 1850 60  0001 C CNN "MNP"
F 5 "2527" V 8100 1850 60  0001 C CNN "Equitronic"
	1    8100 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 1850 8350 1850
Wire Wire Line
	7950 1850 7800 1850
Text Label 7800 1850 0    60   ~ 0
TX
$Comp
L R R3
U 1 1 59497957
P 8650 1350
F 0 "R3" V 8730 1350 50  0000 C CNN
F 1 "10k" V 8650 1350 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 8580 1350 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 8650 1350 50  0001 C CNN
F 4 "ERA-6AEB103V" V 8650 1350 60  0001 C CNN "MNP"
F 5 "4759" V 8650 1350 60  0001 C CNN "Equitronic"
	1    8650 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8650 1500 8650 1650
$Comp
L +5V #PWR035
U 1 1 5949809C
P 8650 1100
F 0 "#PWR035" H 8650 950 50  0001 C CNN
F 1 "+5V" H 8650 1240 50  0000 C CNN
F 2 "" H 8650 1100 50  0001 C CNN
F 3 "" H 8650 1100 50  0001 C CNN
	1    8650 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1100 8650 1200
$Comp
L SP3485EN U5
U 1 1 594990E9
P 9700 1600
F 0 "U5" H 9400 1950 50  0000 L CNN
F 1 "MAX485CSA" H 9800 1950 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 10750 1250 50  0001 C CIN
F 3 "" H 9700 1600 50  0001 C CNN
	1    9700 1600
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 59499F0D
P 2700 5900
F 0 "C8" H 2725 6000 50  0000 L CNN
F 1 "22pF" H 2725 5800 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 2738 5750 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/281/c02e-2905.pdf" H 2700 5900 50  0001 C CNN
F 4 "GQM2195C2E280JB12D" H 2700 5900 60  0001 C CNN "MNP"
F 5 "2928" H 2700 5900 60  0001 C CNN "Equitronic"
	1    2700 5900
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 5949A12E
P 6350 4700
F 0 "C9" H 6375 4800 50  0000 L CNN
F 1 "22pF" H 6375 4600 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 6388 4550 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/281/c02e-2905.pdf" H 6350 4700 50  0001 C CNN
F 4 "GQM2195C2E280JB12D" H 6350 4700 60  0001 C CNN "MNP"
F 5 "2928" H 6350 4700 60  0001 C CNN "Equitronic"
	1    6350 4700
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 5949A644
P 6850 4700
F 0 "C10" H 6875 4800 50  0000 L CNN
F 1 "22pF" H 6875 4600 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 6888 4550 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/281/c02e-2905.pdf" H 6850 4700 50  0001 C CNN
F 4 "GQM2195C2E280JB12D" H 6850 4700 60  0001 C CNN "MNP"
F 5 "2928" H 6850 4700 60  0001 C CNN "Equitronic"
	1    6850 4700
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 5949B99A
P 10700 1550
F 0 "C13" H 10725 1650 50  0000 L CNN
F 1 "100nF 50V" H 10725 1450 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 10738 1400 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/212/KEM_C1023_X7R_AUTO_SMD-1093309.pdf" H 10700 1550 50  0001 C CNN
F 4 "C0805C104J5RACAUTO" H 10700 1550 60  0001 C CNN "MNP"
F 5 "6023" H 10700 1550 60  0001 C CNN "Equitronic"
	1    10700 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 5949B9A0
P 10700 1800
F 0 "#PWR036" H 10700 1550 50  0001 C CNN
F 1 "GND" H 10700 1650 50  0000 C CNN
F 2 "" H 10700 1800 50  0001 C CNN
F 3 "" H 10700 1800 50  0001 C CNN
	1    10700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1800 10700 1700
$Comp
L +5V #PWR037
U 1 1 5949B9A7
P 10700 1300
F 0 "#PWR037" H 10700 1150 50  0001 C CNN
F 1 "+5V" H 10700 1440 50  0000 C CNN
F 2 "" H 10700 1300 50  0001 C CNN
F 3 "" H 10700 1300 50  0001 C CNN
	1    10700 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1300 10700 1400
$Comp
L GND #PWR038
U 1 1 5949BA79
P 9700 2150
F 0 "#PWR038" H 9700 1900 50  0001 C CNN
F 1 "GND" H 9700 2000 50  0000 C CNN
F 2 "" H 9700 2150 50  0001 C CNN
F 3 "" H 9700 2150 50  0001 C CNN
	1    9700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2150 9700 2000
$Comp
L +5V #PWR039
U 1 1 5949BEB2
P 9700 1050
F 0 "#PWR039" H 9700 900 50  0001 C CNN
F 1 "+5V" H 9700 1190 50  0000 C CNN
F 2 "" H 9700 1050 50  0001 C CNN
F 3 "" H 9700 1050 50  0001 C CNN
	1    9700 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1050 9700 1200
Wire Wire Line
	9250 1700 9300 1700
Wire Wire Line
	9250 1500 9250 1700
Wire Wire Line
	9250 1500 9300 1500
Wire Wire Line
	8650 1600 9250 1600
Connection ~ 8650 1600
Connection ~ 9250 1600
$Comp
L R R4
U 1 1 5949CCBF
P 9100 1150
F 0 "R4" V 9180 1150 50  0000 C CNN
F 1 "1k" V 9100 1150 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 9030 1150 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 9100 1150 50  0001 C CNN
F 4 "ERA-6AEB102V" V 9100 1150 60  0001 C CNN "MNP"
F 5 "2527" V 9100 1150 60  0001 C CNN "Equitronic"
	1    9100 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 1400 9100 1400
Wire Wire Line
	9100 1400 9100 1300
Wire Wire Line
	9100 1000 9100 800 
Wire Wire Line
	9100 800  8800 800 
$Comp
L R R5
U 1 1 5949D269
P 9200 2100
F 0 "R5" V 9280 2100 50  0000 C CNN
F 1 "1k" V 9200 2100 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 9130 2100 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 9200 2100 50  0001 C CNN
F 4 "ERA-6AEB102V" V 9200 2100 60  0001 C CNN "MNP"
F 5 "2527" V 9200 2100 60  0001 C CNN "Equitronic"
	1    9200 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 1950 9200 1800
Wire Wire Line
	9200 1800 9300 1800
Wire Wire Line
	9200 2250 9200 2350
Wire Wire Line
	9200 2350 8850 2350
Text Label 8850 2350 0    60   ~ 0
TX
Text Label 8800 800  0    60   ~ 0
RX
Wire Wire Line
	10350 1500 10100 1500
Wire Wire Line
	10350 1700 10100 1700
Text Label 10350 1500 2    60   ~ 0
A
Text Label 10350 1700 2    60   ~ 0
B
$Comp
L R R8
U 1 1 594A28AF
P 10750 2700
F 0 "R8" V 10830 2700 50  0000 C CNN
F 1 "560R" V 10750 2700 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 10680 2700 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 10750 2700 50  0001 C CNN
F 4 "ERA-6APB561V" V 10750 2700 60  0001 C CNN "MNP"
F 5 "1418" V 10750 2700 60  0001 C CNN "Equitronic"
	1    10750 2700
	-1   0    0    1   
$EndComp
$Comp
L R R9
U 1 1 594A2C93
P 10750 3150
F 0 "R9" V 10830 3150 50  0000 C CNN
F 1 "120R" V 10750 3150 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 10680 3150 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 10750 3150 50  0001 C CNN
F 4 "ERA-6AEB121V" V 10750 3150 60  0001 C CNN "MNP"
F 5 "7602" V 10750 3150 60  0001 C CNN "Equitronic"
	1    10750 3150
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 594A3158
P 10750 3650
F 0 "R10" V 10830 3650 50  0000 C CNN
F 1 "560R" V 10750 3650 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 10680 3650 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 10750 3650 50  0001 C CNN
F 4 "ERA-6APB561V" V 10750 3650 60  0001 C CNN "MNP"
F 5 "1418" V 10750 3650 60  0001 C CNN "Equitronic"
	1    10750 3650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR040
U 1 1 594A399A
P 10750 3900
F 0 "#PWR040" H 10750 3650 50  0001 C CNN
F 1 "GND" H 10750 3750 50  0000 C CNN
F 2 "" H 10750 3900 50  0001 C CNN
F 3 "" H 10750 3900 50  0001 C CNN
	1    10750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 3900 10750 3800
Wire Wire Line
	10750 3300 10750 3500
Wire Wire Line
	10750 2850 10750 3000
$Comp
L +5V #PWR041
U 1 1 594A3FB0
P 10750 2400
F 0 "#PWR041" H 10750 2250 50  0001 C CNN
F 1 "+5V" H 10750 2540 50  0000 C CNN
F 2 "" H 10750 2400 50  0001 C CNN
F 3 "" H 10750 2400 50  0001 C CNN
	1    10750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 2400 10750 2550
Wire Wire Line
	10550 2950 11050 2950
Connection ~ 10750 2950
Wire Wire Line
	10550 3450 11050 3450
Connection ~ 10750 3450
Text Label 11050 2950 2    60   ~ 0
A
Text Label 11050 3450 2    60   ~ 0
B
Wire Wire Line
	10350 3100 10550 3100
Wire Wire Line
	10550 3100 10550 2950
Wire Wire Line
	10350 3200 10550 3200
Wire Wire Line
	10550 3200 10550 3450
$Comp
L LED_AK D4
U 1 1 594A83CF
P 9700 700
F 0 "D4" H 9700 800 50  0000 C CNN
F 1 "RX" H 9700 600 50  0000 C CNN
F 2 "w_smd_leds:Led_0805" H 9700 700 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/678/V02-0977EN0-909004.pdf" H 9700 700 50  0001 C CNN
F 4 "HSMR-C170-R0000" H 9700 700 60  0001 C CNN "MNP"
F 5 "452" H 9700 700 60  0001 C CNN "Equitronic"
	1    9700 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1400 9200 700 
Wire Wire Line
	9200 700  9550 700 
Connection ~ 9200 1400
$Comp
L R R7
U 1 1 594A8C26
P 10150 700
F 0 "R7" V 10230 700 50  0000 C CNN
F 1 "1k" V 10150 700 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 10080 700 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 10150 700 50  0001 C CNN
F 4 "ERA-6AEB102V" V 10150 700 60  0001 C CNN "MNP"
F 5 "2527" V 10150 700 60  0001 C CNN "Equitronic"
	1    10150 700 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 700  10000 700 
$Comp
L +5V #PWR042
U 1 1 594A8EA8
P 10450 650
F 0 "#PWR042" H 10450 500 50  0001 C CNN
F 1 "+5V" H 10450 790 50  0000 C CNN
F 2 "" H 10450 650 50  0001 C CNN
F 3 "" H 10450 650 50  0001 C CNN
	1    10450 650 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 650  10450 700 
Wire Wire Line
	10450 700  10300 700 
$Comp
L LED_AK D2
U 1 1 594AA93A
P 5850 1200
F 0 "D2" H 5850 1300 50  0000 C CNN
F 1 "PWR" H 5850 1100 50  0000 C CNN
F 2 "w_smd_leds:Led_0805" H 5850 1200 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/311/LG%20R971%20-%20CHIPLED%200805-318376.pdf" H 5850 1200 50  0001 C CNN
F 4 "LG R971-KN-1" H 5850 1200 60  0001 C CNN "MNP"
F 5 "16598" H 5850 1200 60  0001 C CNN "Equitronic"
	1    5850 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9450 2650 9600 2650
$Comp
L +5V #PWR043
U 1 1 594AA949
P 10050 2600
F 0 "#PWR043" H 10050 2450 50  0001 C CNN
F 1 "+5V" H 10050 2740 50  0000 C CNN
F 2 "" H 10050 2600 50  0001 C CNN
F 3 "" H 10050 2600 50  0001 C CNN
	1    10050 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2600 10050 2650
Wire Wire Line
	10050 2650 9900 2650
Wire Wire Line
	9150 2650 9050 2650
Wire Wire Line
	9050 2650 9050 2350
Connection ~ 9050 2350
$Comp
L R R6
U 1 1 594AAF3E
P 9750 2650
F 0 "R6" V 9830 2650 50  0000 C CNN
F 1 "560R" V 9750 2650 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 9680 2650 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 9750 2650 50  0001 C CNN
F 4 "ERA-6APB561V" V 9750 2650 60  0001 C CNN "MNP"
F 5 "1418" V 9750 2650 60  0001 C CNN "Equitronic"
	1    9750 2650
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 594ACB0B
P 5550 850
F 0 "R1" V 5630 850 50  0000 C CNN
F 1 "1k" V 5550 850 50  0000 C CNN
F 2 "w_smd_resistors:r_0805" V 5480 850 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/315/AOA0000C237-1100991.pdf" H 5550 850 50  0001 C CNN
F 4 "ERA-6AEB102V" V 5550 850 60  0001 C CNN "MNP"
F 5 "2527" V 5550 850 60  0001 C CNN "Equitronic"
	1    5550 850 
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 1050 5850 850 
Wire Wire Line
	5850 850  5700 850 
$Comp
L GND #PWR044
U 1 1 594AD0ED
P 5850 1500
F 0 "#PWR044" H 5850 1250 50  0001 C CNN
F 1 "GND" H 5850 1350 50  0000 C CNN
F 2 "" H 5850 1500 50  0001 C CNN
F 3 "" H 5850 1500 50  0001 C CNN
	1    5850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1500 5850 1350
$Comp
L LED_AK D3
U 1 1 594AE0AB
P 9300 2650
F 0 "D3" H 9300 2750 50  0000 C CNN
F 1 "TX" H 9300 2550 50  0000 C CNN
F 2 "w_smd_leds:Led_0805" H 9300 2650 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/311/LS%20R976%20-%20CHIPLED%200805-318756.pdf" H 9300 2650 50  0001 C CNN
F 4 "LS R976-NR-1" H 9300 2650 60  0001 C CNN "MNP"
F 5 "449" H 9300 2650 60  0001 C CNN "Equitronic"
	1    9300 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC