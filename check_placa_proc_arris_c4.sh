#!/bin/bash
# check_placa_c4.sh
# Autor: Tiago Alves Honorato
# Alterado: Fabio Brito Pinto
# Exemplo para uso manual:
# ./check_placa_c4.sh 192.168.0.1 <PLACA>
# ./check_placa_c4.sh 192.168.0.1 UCAM0
#
#--------------------------------------------------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------------------------------------------------
# Declaracao de variaveis locais
IP="$1";
PLACA="$2";
COMMUNITY="public";
PATH_SNMPWALK="/usr/bin/snmpwalk -Oqv -v2c -c";

UCAM0="enterprises.4998.1.1.10.1.4.2.1.15.1.1";		 
UCAM1="enterprises.4998.1.1.10.1.4.2.1.15.1.2";	
UCAM2="enterprises.4998.1.1.10.1.4.2.1.15.1.3";	
UCAM3="enterprises.4998.1.1.10.1.4.2.1.15.1.4";	
UCAM4="enterprises.4998.1.1.10.1.4.2.1.15.1.5";	
UCAM5="enterprises.4998.1.1.10.1.4.2.1.15.1.6";	
UCAM6="enterprises.4998.1.1.10.1.4.2.1.15.1.7";	
UCAM7="enterprises.4998.1.1.10.1.4.2.1.15.1.8";
UCAM8="enterprises.4998.1.1.10.1.4.2.1.15.1.9";	
DCAM9="enterprises.4998.1.1.10.1.4.2.1.15.1.10";
DCAM10="enterprises.4998.1.1.10.1.4.2.1.15.1.11";
DCAM11="enterprises.4998.1.1.10.1.4.2.1.15.1.12";	
DCAM12="enterprises.4998.1.1.10.1.4.2.1.15.1.13";	
DCAM13="enterprises.4998.1.1.10.1.4.2.1.15.1.14";	
DCAM14="enterprises.4998.1.1.10.1.4.2.1.15.1.15";	
DCAM15="enterprises.4998.1.1.10.1.4.2.1.15.1.16";	 
RCMA17="enterprises.4998.1.1.10.1.4.2.1.15.1.18";
RCMB18="enterprises.4998.1.1.10.1.4.2.1.15.1.19";
SCMA19="enterprises.4998.1.1.10.1.4.2.1.15.1.20";
SCMB20="enterprises.4998.1.1.10.1.4.2.1.15.1.21";

case $PLACA in
	UCAM0)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM0 ) ;;
	UCAM1)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM1 ) ;;
	UCAM2)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM2 ) ;;
	UCAM3)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM3 ) ;;
	UCAM4)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM4 ) ;;
	UCAM5) 	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM5 ) ;; 
	UCAM6)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM6 ) ;;		
	UCAM7)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM7 ) ;;
	UCAM8)	R=$($PATH_SNMPWALK $COMMUNITY $IP $UCAM8 ) ;;	
	DCAM9)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM9 ) ;;
	DCAM10)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM10 );;
	DCAM11)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM11 );;
	DCAM12)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM12 );;
	DCAM13)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM13 );;
	DCAM14)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM14 );;
	DCAM15)	R=$($PATH_SNMPWALK $COMMUNITY $IP $DCAM15 );;
	RCMA17)	R=$($PATH_SNMPWALK $COMMUNITY $IP $RCMA17 ) ;;
	RCMB18)	R=$($PATH_SNMPWALK $COMMUNITY $IP $RCMB18 ) ;;		
	SCMA19)	R=$($PATH_SNMPWALK $COMMUNITY $IP $SCMA19 ) ;;		
	SCMB20)	R=$($PATH_SNMPWALK $COMMUNITY $IP $SCMB20 ) ;;		
esac


case $PLACA in
	UCAM0|DCAM15|RCMB18|SCMB20)	
		case $R in
			1) echo "Status: ATIVA - [PLACA: "$PLACA"]"; exit 2 ;;
			2) echo "Status: STANDBY - [PLACA: "$PLACA"]"; exit 0 ;;
			*) echo "Status: Não reconhecido - [Placa:" $PLACA"]"; exit 3 ;;
		esac
	;;		
	UCAM1|UCAM2|UCAM3|UCAM4|UCAM5|UCAM6|UCAM7|UCAM8|DCAM9|DCAM9|DCAM10|DCAM11|DCAM12|DCAM13|DCAM14|DCAM15|DCAM16|DCAM17|DCAM18|DCAM19)	
		case $R in
			1|3) echo "Status: ATIVA - [PLACA: "$PLACA"]"; exit 0 ;;
			0) echo "Status: Não reconhecido - [PLACA:" $PLACA"]"; exit 3 ;;
			*) sleep 30; echo "Status: FALHA - [Placa:" $PLACA"]"; exit 1 ;;
		esac
			
esac



