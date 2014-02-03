#Include "aarray.ch"
#Include "json.ch" 

user function tativa()
Local aArea    	:= GetArea()       
Local cAlias	:= "AI3"
Local lRetorno 	:= .T.
Local aColunas	:= {}     
Local cLogin	:= ""
Local cPSW		:= ""     
Local aaMsgRetorno	:= Array(#) 
Local CODUSU	:= "000006"

	// Seleciona o "Base de dados" ( Tabela )
	dbSelectArea(cAlias)
	// Seleciona o Indice do "Alias"
	dbSetOrder(1)
	// Busca por FILIAL+CODUSUARIO ( ID )
    dbSeek(xFilial("AI3")+CODUSU)
	IF (cAlias)->AI3_CODUSU == CODUSU   
		cLogin := AllTrim((cAlias)->AI3_LOGIN2)
		cPSW := AllTrim((cAlias)->AI3_PSW2)
		IF FOUND()
		    IF !empty(cLogin) .And. !empty(cPSW)
		    RECLOCK("AI3", .F.)
			AI3->AI3_LOGIN 	:= cLogin
		  	AI3->AI3_PSW 	:= cPSW
		    (cAlias)->(MsUnlock())
			ENDIF
		  //	aaMsgRetorno["msg"] = "sucesso"
		  Alert(cLogin+" - "+cPSW)
	    ENDIF			
	ENDIF
return