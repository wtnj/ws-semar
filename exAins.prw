#DEFINE CRLF Chr(13)+Chr(10)
User Function exAins()
Local aExemplo := {1, 2, {11, 22, 33}, 4, 5}
Local cMensagem := ""
//+----------------------------------------------------------------------------+
//|Exemplifica o uso da função AIns                                            |
//+----------------------------------------------------------------------------+
AIns(aExemplo[3], 2)
AIns(aExemplo, 2)
AIns(aExemplo, 3)
cMensagem += "aExemplo[1] = " + cValToChar(aExemplo[1]) + CRLF
cMensagem += "aExemplo[2] = " + cValToChar(aExemplo[2]) + CRLF
cMensagem += "aExemplo[3] = " + cValToChar(aExemplo[3]) + CRLF
cMensagem += "aExemplo[4] = " + cValToChar(aExemplo[4]) + CRLF
cMensagem += "aExemplo[5] = " + cValToChar(aExemplo[5])
//+----------------------------------------------------------------------------+
//|Apresenta uma mensagem com os resultados obtidos                            |
//+----------------------------------------------------------------------------+
Return MsgInfo(cMensagem, "Exemplo do AIns")