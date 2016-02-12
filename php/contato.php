<!DOCTYPE html>
<html>
<head>
<title>contato</title>
<meta charset="UTF-8">
</head>
<body>
	<section class="content wrapper contato">
		<h2 class="title bigger bold clearfix">Vamos bater um papo?</h2>
		<div class="box-form content-left">
			<form class="form form-contato" method="post">
				<div class="linha">
					<p id="log-contato"></p>
				</div>
				<div class="linha">
					<fieldset class="fieldset-100">
						<input class="input" type="text" name="nome" id="nome" placeholder="Nome Completo" required maxlength="50">
					</fieldset>
				</div>
				<div class="linha">
					<fieldset class="fieldset-50">
						<input class="input" type="email" name="email" id="email" placeholder="E-mail" required maxlength="50">
					</fieldset>
					<fieldset class="fieldset-50">
						<input class="input" type="text" name="telefone" id="telefone" placeholder="Telefone"  maxlength="50">
					</fieldset>
				</div>
				<div class="linha">
					<fieldset class="fieldset-100">
						<textarea class="input"  placeholder="Mensagem" name="mensagem" id="mensagem" cols="30" rows="10" required></textarea>
					</fieldset>
				</div>
				<fieldset class="fieldset">
					<button class="round-btn green" id="btn-envia-contato">Enviar Mensagem</button>
				</fieldset>
			</form>
		</div>
	</section>
	<!-- JQUERY -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- MASKED INPUT -->
	<script src="js/jquery.maskedinput.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#telefone").mask("(99) 9999-9999?9");
		});
	</script>
	<!-- ENVIO DO FORMULARIO -->
	<script>
		$("#log-contato").css('display','none')
 // REQUISICAO AJAX
 $('.form-contato').submit(function(){
 	$("#log-contato").css('display','none')
 	event.preventDefault();
 	var nome = $("#nome").val();
 	var telefone = $("#telefone").val();
 	var email = $("#email").val();
 	var mensagem = $("#mensagem").val();
 	var request = $.ajax({
 		url: "/contato-envia",
 		type: "POST",
 		data: {
 			nome_ : nome,
 			telefone_: telefone,
 			email_: email,
 			mensagem_: mensagem
 		},
 		dataType: "html"
 	});
 	request.done(function(msg) {
 		$("#log-contato").attr("class","contato-sucesso");
 		$("#log-contato").html('Mensagem enviada com sucesso!');
 	});
 	request.fail(function(jqXHR, textStatus) {
 		$("#log-contato").attr("class","contato-erro");
 		$("#log-contato").html('Desculpe, sua mensagem não foi enviada. Por favor, tente novamente!')
 	});
 	$("#log-contato").slideToggle();
 });
</script>
</body>
</html>