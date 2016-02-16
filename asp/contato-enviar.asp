<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'SETA DATA CORRENTE BRASIL'
Session.LCID =  1046
'CARREGA TEMPLATE'
Function ReadFile(filename)
   Dim objFSO
   Dim objTStream
   Dim strText
   Const ForReading = 1
   Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
   Set objTStream = objFSO.OpenTextFile(Server.MapPath(filename), ForReading)
   strText = objTStream.ReadAll
   Set objTStream = Nothing
   Set objFSO = Nothing
   strText = Replace(strText, "[#data#]", Date())
   strText = Replace(strText, "[#hora#]", Time())
   strText = Replace(strText, "[#nome#]", Request("nome"))
   strText = Replace(strText, "[#email#]", Request("email"))
   strText = Replace(strText, "[#telefone#]", Request("telefone"))
   strText = Replace(strText, "[#mensagem#]", Replace(Request("mensagem"), vbcrlf, "<br>"))
   'strText = Replace(strText, "[#mensagem#]", Replace(Request("mensagem"), vbcr, "<br>"))
   '-- Notice that below I am replacing all line breaks with the HTML <br>.
   ' This applies to all form textboxes, where the user can enter line breaks
   ' and it achieves proper display of the contents in HTML.
   ReadFile = strText
End Function

'SETA PARA TRATAMENTOS DE ERRO CASO NAO ENVIE'
On Error Resume Next

'email
Set Mail = CreateObject("CDO.Message")
'This section provides the configuration information for the remote SMTP server.
'Send the message using the network (SMTP over the network).
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "server_smtp"
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
'Use SSL for the connection (True or False)
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False 
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
'If your server requires outgoing authentication, uncomment the lines below and use a valid email address and password.
'Basic (clear-text) authentication
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 
'Your UserID on the SMTP server
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "usuario_envia"
Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "senha_envia"
Mail.Configuration.Fields.Update
Mail.Subject="Contato Através do Site"
Mail.From= Request("nome")&"<noreply@noreply.org.br>"
Mail.To="to@paraquemvai.com.br"
Mail.ReplyTo="paraquemrepsonder@paraquemvairesposta.com.br"
Mail.Bcc="copia@copiaoculta.com.br"
Mail.HTMLBody= ReadFile("templates/template-email.html")
Mail.Send
'SE DER ERRO, CONTATO-ERRO'
If Err.Number <> 0 Then
Set Mail = Nothing
Response.Redirect("contato-erro.asp")
'SE NAO, CONTATO-SUCESSO'
ELSE
Set Mail = Nothing
Response.Redirect("contato-sucesso.asp")
END IF
%>