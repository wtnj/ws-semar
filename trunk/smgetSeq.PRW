#Include "TOPCONN.CH" 
#include "TOTVS.CH"
////////////////////////////////////////
//
// SEQUENCIAL PARA O NUMERO DO LOTE 
//
////////////////////////////////////////

  
user function smgetSeq(p_cAlias, p_cCampo)
		 local warea:= getArea()
		 local wCmpFilial:= iif( left(p_cAlias,1)=='S' ,left(p_cCampo,3),left(p_cCampo,4))+"FILIAL"
		 local wRet:= '0'
		 local wTam := tamSX3(p_cCampo)[1] 
		 
	   //	 select max(zzo_lote) from siga.zzo010;

		 
		 cSql := "SELECT MAX( " +p_cCampo+ ") NUMSEQ FROM "+RetSqlName(p_cAlias)
		 cSql += " WHERE D_E_L_E_T_ = ' '"
		 cSql += " AND   "+wCmpFilial+"  = '" +xFilial(p_cAlias)+ "'"
		
		 If Select("QryXEXF") > 0
			  dbSelectArea("QryXEXF")
			  QryXEXF->(DbCloseArea())
		 EndIf
		 //wSQL := ChangeQuery(wSQL)
		 TcQuery cSql New Alias "QryXEXF"
		 wRet:= strzero( val( QryXEXF->NUMSEQ) +1 , wTam)
		 restArea(wArea)
Return (wret)