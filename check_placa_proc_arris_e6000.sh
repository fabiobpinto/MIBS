#!/bin/bash
# check_placa e6000.sh 
# Autor: Tiago Alves Honorato
# Alteracao: Fabio Brito Pinto
#--------------------------------------------------------------------------------------------------------------------------
#
# Exemplo para uso manual:
# ./check_placa36000.sh 192.168.0.1 UCAM0
#
# Declaracao de variaveis locais
IP="$1";
PLACA="$2";
COMMUNITY="public";
PATH_SNMPWALK="/usr/bin/snmpwalk -Oqv -v2c -c";
DCAM8="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.9";
DCAM9="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.10";
DCAM10="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.11";
DCAM11="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.12";
DCAM12="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.13";
DCAM13="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.14";
RSMA="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.7";
RSMB="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.8";
UCAM0="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.1";
UCAM1="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.2";
UCAM2="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.3";
UCAM3="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.4";
UCAM4="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.5";
UCAM5="1.3.6.1.4.1.4998.1.1.10.1.4.12.1.15.6";

case $PLACA in
	UCAM0)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM0 ) ;;
	UCAM1)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM1 ) ;;
	UCAM2)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM2 ) ;;
	UCAM3)  R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM3 ) ;;
	UCAM4)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM4 ) ;;
	UCAM5)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM5 ) ;;
	RSMA)	R=$($PATH_SNMPWALK $COMMUNITY $IP $RSMA ) ;;
	RSMB)	R=$($PATH_SNMPWALK $COMMUNITY $IP $RSMB ) ;;
	DCAM8)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM8 ) ;;
	DCAM9)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM9 ) ;;
	DCAM10)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM10 ) ;;
	DCAM11)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM11 ) ;;
	DCAM12)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM12 ) ;;
	DCAM13)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM13 ) ;;
esac

case $PLACA in
	UCAM0|RSMB|DCAM13)	
		case $R in
			1) echo "Status: ATIVA - [PLACA: "$PLACA"]"; exit 2 ;;
			2) echo "Status: STANDBY - [PLACA: "$PLACA"]"; exit 0 ;;
			*) echo "Status: Não reconhecido - [Placa:" $PLACA"]"; exit 3 ;;
		esac
	;;		
	UCAM1|UCAM2|UCAM3|UCAM4|UCAM5|RSMA|DCAM8|DCAM9|DCAM10|DCAM11|DCAM12)	
		case $R in
			1|3) echo "Status: ATIVA - [PLACA: "$PLACA"]"; exit 0 ;;
			0) echo "Status: Não reconhecido - [PLACA:" $PLACA"]"; exit 3 ;;
			*) echo "Status: FALHA - [Placa:" $PLACA"]"; exit 1 ;;
		esac
			
esac

