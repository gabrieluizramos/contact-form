<?php
date_default_timezone_get("America/Sao_Paulo");
$to      = 'email@email.com.br';
$subject = 'Contato Através do Site';
$tpl = file_get_contents('templates/template.email.sf.html');
$tpl = str_replace('[#data#]', date("d/m/Y"), $tpl);
$tpl = str_replace('[#hora#]', date("H:i"), $tpl);
$tpl = str_replace('[#nome#]', $_POST['nome_'], $tpl);
$tpl = str_replace('[#email#]', $_POST['email_'], $tpl);
$tpl = str_replace('[#telefone#]', $_POST['telefone_'], $tpl);
$linhas = array("<br />","<br>","<br/>");  
$tpl = str_replace($linhas, "\n", $tpl);
$message = str_replace("\n", nl2br("\n"), $_POST['mensagem_']);
$tpl = str_replace('[#mensagem#]', $message, $tpl);
$message = $tpl;
$message = html_entity_decode($message);
$headers = "MIME-Version: 1.1\r\n";
$headers .= "Content-type: text/html; charset=utf-8\r\n";
$headers .= 'From: '.utf8_decode($_POST['nome_']).'<'.$_POST['email_'].'>' . "\r\n" . "Bcc: copiaoculta@copiaoculta.com.br" . "\r\n" .
'Reply-To: email@email.com.br' . "\r\n" .
'X-Mailer: PHP/' . phpversion();
if (mail($to, $subject, $message, $headers)) {
	return true;
}
else{
	return false;
}
?>