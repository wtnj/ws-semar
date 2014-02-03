#INCLUDE "APWEBSRV.CH"
#INCLUDE "PROTHEUS.CH"
#Include "Topconn.ch"
#Include "aarray.ch"
#Include "json.ch"

#DEFINE STR0001 "Web Service respons�vel por integrar os portais de Cliente/Fornecedor com o Protheus"
#DEFINE STR0002 "Web Service respons�vel por integrar os portais de Cliente/Fornecedor com o Protheus" 

WSSERVICE MARLON DESCRIPTION STR0001 NAMESPACE "http://webservice.semarsistemas.com.br/wssemar.prw"

WSDATA cNome 	    AS String 
WSDATA cSobreNome   AS String         
WSDATA cCelular 	AS String
WSDATA cTelefone    AS String Optional 
                
WSMETHOD WScadastro			DESCRIPTION STR0002 // Retorna os dados                   
ENDWSSERVICE

WSMETHOD WScadastro WSRECEIVE cNome,cSobreNome WSSEND cRetorno WSSERVICE MARLON 
	Local lRetorno 		:= .T.    
    Local cFrase :="seu nome:"+::cNome+" "+::cSobreNome
    
    ::cRetorno := cFrase
    
RETURN (lRetorno)