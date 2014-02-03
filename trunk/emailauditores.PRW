user function emailauditores()
Local aArea    := GetArea()
Local lRetorno := .T.
Local nX       := 0
Local aDadosAu := {}

	dbSelectArea("AI3")
	dbSetOrder(1)
	//MsSeek(::Alias)
	nX := 0
	While !Eof() //.And. 
		nX++							
		//aadd(::rDadosAuditores,WSClassNew("eDadosAuditores"))
		//::rDadosAuditores[nX]:cNome		:= AI3->AI3_NOME
		//::rDadosAuditores[nX]:cEmail	:= AI3->AI3_EMAIL
	   //	aAdd(aDadosAu,{"Nome",AI3->AI3_NOME})   
		
		alert(AI3->AI3_NOME)
			dbSelectArea("AI3")
		dbSkip()
	EndDo
RestArea(aArea)
return