<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Projeto de Pweb II - IFPB">
		<meta name="author" content="Emerson Raniere e Jonathan Almeida">
		
		<title>Calendário - PwebII</title>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
		<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/css/bootstrap.css">
		<script	src="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/js/bootstrap.js"></script>
		<script	src="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js"></script>
		
		<link href='${pageContext.request.contextPath}/caledar/css/fullcalendar.min.css' rel='stylesheet' />
		<link href='${pageContext.request.contextPath}/caledar/css/fullcalendar.print.css' rel='stylesheet' media='print' />
		<link href='${pageContext.request.contextPath}/caledar/css/bootstrap.min.css' rel='stylesheet' />
		<link href='${pageContext.request.contextPath}/caledar/css/bootstrap-datepicker3.min.css' rel='stylesheet' />
	
		<!-- http://momentjs.com/ -->
		<script src='${pageContext.request.contextPath}/caledar/js/moment.min.js'></script>
		<script src='${pageContext.request.contextPath}/caledar/js/jquery.min.js'></script>
	
		<!-- http://fullcalendar.io -->
		<script src='${pageContext.request.contextPath}/caledar/calendar/js/fullcalendar.min.js'></script>
		<script src='${pageContext.request.contextPath}/caledar/calendar/js/lang-all.js'></script>
	
		<!-- https://github.com/eternicode/bootstrap-datepicker -->
		<script src='${pageContext.request.contextPath}/caledar/js/bootstrap-datepicker.min.js'></script>
	
		<script>

			$(document).ready(function() {
				var titulo = $('#evModal #evTitulo');
				var mensagem = $('#evModal #evMensabem');
				var data = $('#evModal #evData');
				var salvar = $('#evModal #evBtnSalvar');
				var excluir = $('#evModal #evBtnExcluir');
				var evento;
	
			/*salvar.on('click',function(e){
			e.preventDefault();
			switch($(this).val()){
			case 'criar':
			eventData = {
			title: titulo.val(),
			mensagem: mensagem.val(),
			start: moment(data.datepicker('getDate')),
			allDay: true
			};
			$('#calendar').fullCalendar('renderEvent', eventData);
			break;
			
			case 'atualizar':
			evento.title = titulo.val();
			evento.mensagem = mensagem.val();
			evento.start = moment(data.datepicker('getDate'));
			evento.allDay = true;
			$('#calendar').fullCalendar('updateEvent', eventos);
			break;
			}
			$('#evModal').modal('hide');
			});*/
	
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				selectable: true,
				selectHelper: true,
				lang: 'pt-br',
				editable: true,
				eventClick: function(calEvent, jsEvent, view) {
					$('#evModal .modal-title').html('Atualizar evento.');
					titulo.val(calEvent.title);
					mensagem.val(calEvent.mensagem);
					data.datepicker('setDate',calEvent.start.format('DD/MM/YYYY'));
					salvar.val('atualizar');
					$('#eventoForm input[name=op]').val("altEvento");
					evento = calEvent;
					$('#evModal').modal();
					
					console.log(calEvent);
				},
				eventLimit: true,
				eventSources: [
				{
					url: 'agenda.do?op=eventos',
					type: 'GET',
					data: {},
					error: function() {
						alert('Não foi possível obter os eventos!');
					}
				}
				]
			});
			
			$('#criarEvento').on('click',function(e){
				e.preventDefault();
				mensagem.val('');
				titulo.val('');
				data.val('');
				$('#eventoForm input[name=op]').val("criarEvento");
				$('#evModal .modal-title').html('Criar evento.');
				$('#evModal').modal();						
			});
			
			$('#eventoForm').submit(function(e){
				e.preventDefault();
				$.post("agenda.do", $(this).serialize())
				.done(function() {
					$('#evModal .alert').hide();
					eventData ={
						title: titulo.val(),
						mensagem: mensagem.val(),
						start: moment(data.datepicker('getDate'))
					};	
					if ($('#eventoForm input[name=op]').val=="criarEvento")
					   $('#calendar').fullCalendar('renderEvent', eventData);
					else{
						history.go(0);
						
					}
					$('#evModal').modal('hide');
					history.go(0);
					
				}).fail(function(data) {
					var error = JSON.parse(data.responseText)
					$('#evModal .alert').show().attr('class','alert alert-danger').html(error.mensagem);
				});
			
			
			
			});
			
			
			$('#eventoForm button').on('click',function(){
				
				$('#eventoForm input[name=op]').val("excEvento");
				$.post("agenda.do", $('#eventoForm').serialize())
				.done(function() {
					$('#evModal .alert').hide();
					eventData ={
						title: titulo.val(),
						mensagem: mensagem.val(),
						start: moment(data.datepicker('getDate'))
					};	
			    	history.go(0);
					$('#evModal').modal('hide');
				
				
				}).fail(function(data) {
					var error = JSON.parse(data.responseText)
					$('#evModal .alert').show().attr('class','alert alert-danger').html(error.mensagem);	
			});});
			
			
			$('.datepicker').datepicker({
				format: 'dd-mm-yyyy',
				autoclose: true
			});
			
			$('#alterarSenha').on('click',function(event){
				event.preventDefault();
				$('#senhaModal').modal();
			
			});
			
			$("#alterarSenhaForm").submit(function(event) {
				event.preventDefault();
				$.post("agenda.do?op=alterarSenha", $(this).serialize())
				.done(function(data) {
					$('#senhaModal .alert').show().attr('class','alert alert-success').html(data);
					console.log(data);
				}).fail(function(data) {
					var error = JSON.parse(data.responseText)
					$('#senhaModal .alert').show().attr('class','alert alert-danger').html(error.mensagem);
				});
			
			});
			
			
			
			});
			
	</script>

	<style>
		body {
			margin: 40px 10px;
			padding: 0;
			font-size: 14px;
		}
	
		#calendar {
			padding-top: 40px;
		}
	
		.alert{
			display: none;
		}

	</style>
		
	</head>
<body>