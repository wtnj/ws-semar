#Include "aarray.ch"
#Include "json.ch" 

user function tsa1()
Local aArea    	:= GetArea()       
Local cAlias	:= "SX3"
Local lRetorno 	:= .T.
Local aColunas	:= {}     
Local aaMsgRetorno	:= Array(#)        
Local cCNPJCPF  := "85680239000102"
Local cFilial   := NIL 
Local aCampos	:={}    
Local cRetornoBusca := "0"
Local cCompara	:= NIL
	// Seleciona o "Base de dados" ( Tabela )
	dbSelectArea(cAlias)
	// Seleciona o Indice do "Alias"
	dbSetOrder(1)  
	dbSeek("SA1")
	
	aCampos			:= {"A1_NOME","A1_NREDUZ","A1_CGC","A1_END","A1_EST","A1_MUN","A1_BAIRRO","A1_CEP","A1_DDD","A1_TEL"}

	nX := 0
	While !Eof()                
	        cCompara:= cValToChar(AllTrim(SX3->X3_CAMPO))
	        /*FOR nF :=1 TO LEN(aCampos)
	             IF cValToChar(AllTrim(aCampos[nF])) = cCompara
	             	cRetornoBusca := "1"
	             ELSE 
	             	cRetornoBusca := "0"
	             ENDIF 
	        NEXT nF
	        */
        	bSeek 			:= {|x| x == cCompara}
   			cRetornoBusca 	:= cValToChar(aScan(aCampos,bSeek))
			IF cRetornoBusca <> "0"
				nX++							
				alert(cX3CAMPO)
			ENDIF
		dbSelectArea("SX3")
		dbSkip()
	EndDo			
	//::cRetorno := ToJson(aaMsgRetorno)
   	//::cRetorno := "LOGIN # "+cLogin+" SENHA # "+cPSW +" CODUSU # "+::CODUSU +" FILIAL # "+xFilial("AI3")
RestArea(aArea)
return 