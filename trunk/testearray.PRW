#Include "aarray.ch"
#Include "json.ch" 

user function testearray()
// Inicia um Vetor Associativo
/*
aaBusiness := Array(#)
aaBusiness[#'Products'] := Array(2)
aaBusiness[#'Products'][1] := Array(#)
aaBusiness[#'Products'][1][#'Name'] := "Water"
aaBusiness[#'Products'][1][#'Cost'] := 1.3
aaBusiness[#'Products'][2] := Array(#)
aaBusiness[#'Products'][2][#'Name'] := "Bread"
aaBusiness[#'Products'][2][#'Cost'] := 0.4
*/
//aaBusiness := Array(#)
//aaBusiness[#'Coluna'] := Array(#) 
//aaBusiness[#'Valor'] := Array(#)    
cJSON := '[{"Valor":"1234","Coluna":"ZI3_PSW2"},{"Valor":"Alexandre Clayton","Coluna":"ZI3_NOME"},{"Valor":"alexandreclayton@hotmail.com","Coluna":"ZI3_EMAIL"},{"Valor":"022","Coluna":"ZI3_CPF"},{"Valor":"Alexandre Clayton","Coluna":"ZI3_RAZAOS"},{"Valor":"alexandresette","Coluna":"ZI3_LOGIN"},{"Valor":"1234","Coluna":"ZI3_PSW"},{"Valor":"020220","Coluna":"ZI3_CNPJ"}]'
aaBusiness := FromJson(cJSON)
/* 
For nX := 1 To (2)                               
	// Block
	aaBusiness[#(cValToChar(nX))] := Array(#)    
	nW = 1
		For nY := 1 To (5)
			aaBusiness[#(cValToChar(nX))][#(cValToChar(nY))] := nW
			nW++
		Next nY
Next nX
       
cJSON := ToJson(aaBusiness)
*/     

For nX :=1 To Len(aaBusiness)
   	alert(aaBusiness[nX][#'Coluna'] +" => "+aaBusiness[nX][#'Valor'] )
Next nX
alert( cJSON  )
alert( cValToChar( Len(aaBusiness) ) )
alert( JsonPrettify(cJSON, 4) )
return 