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
		
		<link href='${pageContext.servletContext.contextPath}/css/fullcalendar.css' rel='stylesheet' />
		<link href='${pageContext.servletContext.contextPath}/css/fullcalendar.print.css' rel='stylesheet' media='print' />
		<script src='${pageContext.servletContext.contextPath}/js/moment.min.js'></script>
		<script src='${pageContext.servletContext.contextPath}/js/jquery.min.js'></script>
		<script src='${pageContext.servletContext.contextPath}/js/fullcalendar.min.js'></script>
		<script>
	
		$(document).ready(function() {
	
			$('#calendar').fullCalendar({
				defaultDate: '2015-02-12',
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				events:
					[
	// INSERIR OS EVENTOS AQUI
					{
						title: 'All Day Event',
						start: '2015-02-01'
					},
					{
						title: 'Long Event',
						start: '2015-02-07',
						end: '2015-02-10'
					},
					{
						id: 999,
						title: 'Repeating Event',
						start: '2015-02-09T16:00:00'
					},
					{
						id: 999,
						title: 'Repeating Event',
						start: '2015-02-16T16:00:00'
					},
					{
						title: 'Conference',
						start: '2015-02-11',
						end: '2015-02-13'
					},
					{
						title: 'Meeting',
						start: '2015-02-12T10:30:00',
						end: '2015-02-12T12:30:00'
					},
					{
						title: 'Lunch',
						start: '2015-02-12T12:00:00'
					},
					{
						title: 'Meeting',
						start: '2015-02-12T14:30:00'
					},
					{
						title: 'Happy Hour',
						start: '2015-02-12T17:30:00'
					},
					{
						title: 'Dinner',
						start: '2015-02-12T20:00:00'
					},
					{
						title: 'Birthday Party',
						start: '2015-02-13T07:00:00'
					},
					{
						title: 'Click for Google',
						url: 'http://google.com/',
						start: '2015-02-28'
					}
				]
			});
			
		});
	
		</script>
		<style>
	
		body {
			margin: 40px 10px;
			padding: 0;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
			font-size: 14px;
		}
	
		#calendar {
			max-width: 900px;
			margin: 0 auto;
			padding-top: 2em;
		}
	
		</style>
		
		
	</head>
<body>