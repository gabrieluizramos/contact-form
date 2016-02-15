<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>contato</title>
</head>
<body>
	<section class="section contato clearfix">
		<div class="wrapper">
			<h2 class="title big bold">Fale conosco</h2>
			<div class="content">
				<h3 class="title small thin">Entre em contato conosco através do formulário abaixo:</h3>
				<form action="contato-enviar.asp" class="form-contato" method="post">
					<div class="linha">
						<p id="log-contato"></p>
					</div>
					<div class="linha">
						<fieldset class="campo-100">
							<label for="nome" class="legenda required">Nome</label>
							<input type="text" class="input" id="nome" name="nome" required>
						</fieldset>
					</div>
					<div class="linha">
						<fieldset class="campo-50">
							<label for="email" class="legenda">Email</label>
							<input type="email" id="email" name="email" class="input">
						</fieldset>
						<fieldset class="campo-50">
							<label for="telefone" class="legenda required">Telefone</label>
							<input type="text" id="telefone" name="telefone" class="input" required>
						</fieldset>
					</div>
					<div class="linha">
						<fieldset class="campo-100">
							<label for="mensagem" class="legenda">Mensagem</label>
							<textarea name="mensagem" id="mensagem" cols="30" rows="10" class="input"></textarea>
						</fieldset>
					</div>
					<div class="linha">
						<button class="btn-enviar">Enviar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- MASK -->
	<script src="js/plugins/mask/jquery.maskedinput.js"></script>
	<script>
		$(document).ready(function(){
			$("#telefone").mask("(99) 9999-9999?9");
		});
	</script>
	<!-- AJAX -->
	<script>
		// $("#log-contato").css('display','none')
		// $('.form-contato').submit(function(){
		// 	$("#log-contato").css('display','none')
		// 	event.preventDefault();
		// 	var nome = $("#nome").val();
		// 	var telefone = $("#telefone").val();
		// 	var email = $("#email").val();
		// 	var mensagem = $("#mensagem").val();
		// 	var request = $.ajax({
		// 		url: "contato-enviar.asp",
		// 		type: "POST",
		// 		data: {
		// 			nome_ : nome,
		// 			telefone_: telefone,
		// 			email_: email,
		// 			mensagem_: mensagem
		// 		},
		// 		dataType: "html"
		// 	});
		// 	request.done(function(msg) {
		// 		$("#log-contato").attr("class","contato-sucesso");
		// 		$("#log-contato").html('Mensagem enviada com sucesso!');
		// 	});
		// 	request.fail(function(jqXHR, textStatus) {
		// 		$("#log-contato").attr("class","contato-erro");
		// 		$("#log-contato").html('Desculpe, sua mensagem não foi enviada. Por favor, tente novamente!')
		// 	});
		// 	$("#log-contato").slideToggle();
		// });
	</script>
</body>
</html>