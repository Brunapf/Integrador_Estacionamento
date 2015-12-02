<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sistema Estacionamento</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

     <!-- Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/bootstrap_inicio.jsp" %>


  </head>

  <body>

       <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/menu.jsp" %>
      
	
	<hr />
	<h1>Inserir novo Cliente</h1>
	<h2>Escolha o Veiculo</h2>
	<br />
	<table border=1>
		<thead>
			<tr>
				<th>Código</th>
				<th>Placa</th>
				<th>Escolher</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lista}" var="x">
				<tr>
					<td>${x.codVeiculo}</td>
					<td>${x.placa}</td>
					<td><a
						href="<%=request.getContextPath()%>/ClienteCRUD?cmd=novo&codVeiculo=${x.codVeiculo}">Escolher
							este</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
 <hr>

     <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   
  </body>
</html>
