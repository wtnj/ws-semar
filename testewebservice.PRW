#Include "aarray.ch"
#Include "json.ch" 
user function testewebservice()

Local aArea 		:= getArea()
Local lRetorno 		:= .T.
Local cAlias		:= "ZI3"  
Local aaMsgRetorno	:= Array(#)
Local cCPF			:= NIL
Local cCNPJ			:= NIL
Local cLOGIN		:= NIL
Local cDadosJson	:= '[{"Valor":"1234","Coluna":"ZI3_PSW2"},{"Valor":"Alexandre Clayton","Coluna":"ZI3_NOME"},{"Valor":"alexandreclayton@hotmail.com","Coluna":"ZI3_EMAIL"},{"Valor":"022","Coluna":"ZI3_CPF"},{"Valor":"Alexandre Clayton","Coluna":"ZI3_RAZAOS"},{"Valor":"alexandresette","Coluna":"ZI3_LOGIN"},{"Valor":"1234","Coluna":"ZI3_PSW"},{"Valor":"020220","Coluna":"ZI3_CNPJ"}]'
Local lResultBusca	:= .T.        
Local cColuna		:= NIL
    
	aaDadosJson := FromJson(cDadosJson)
	// Seleciona o alias
	DbSelectArea(cAlias)
	// Seta a ordem do indice (CPF,CNPJ,LOGIN)
	dbSetOrder(2)
	// Busca os dados na string json para adicionar na pesquisa do indice
	For nY := 1 To Len(aaDadosJson)    
		cColuna := aaDadosJson[nY][#'Coluna']                                     
		IF cColuna == "ZI3_CPF"
			cCPF 	:= aaDadosJson[nY][#'Valor'] 
		ENDIF
		IF cColuna == "ZI3_CNPJ"
			cCNPJ 	:= aaDadosJson[nY][#'Valor']
		ENDIF
		IF cColuna == "ZI3_LOGIN"
			cLOGIN 	:= aaDadosJson[nY][#'Valor']
		ENDIF
	Next nY                                                   
   //	alert("022"+"020220"+"alexandresette")
	// Seta valores para busca no Aliases
	
	// Verifica se existe o registro
	// Caso exista verifica o status atual do registro
	lResultBusca := dbSeek(cValToChar(cCPF))
	alert(cValToChar(lResultBusca))
	IF lResultBusca
		IF (cAlias)->ZI3_ATIVO == "SIM" .And. (cAlias)->ZI3_CNPJ == cCNPJ .And. (cAlias)->ZI3_LOGIN == cLOGIN
			aaMsgRetorno[#'msg'] := "ativado"
		ELSE
			aaMsgRetorno[#'msg'] := "aguarde"  
		ENDIF
	ELSE
		RecLock(cAlias,.T.)
		For nX := 1 To Len(aaDadosJson)
			(cAlias)->&(aaDadosJson[nX][#'Coluna']) := aaDadosJson[nX][#'Valor']
		Next nX
		(cAlias)->(MsUnlock())		
		aaMsgRetorno[#'msg'] := "sucesso"
	ENDIF                     
		alert(aaMsgRetorno[#'msg'])
//		::cRetorno := ToJson(aaMsgRetorno)
return 