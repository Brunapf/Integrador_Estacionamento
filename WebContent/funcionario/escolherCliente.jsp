<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sistema Estacionamento</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

<!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/bootstrap_inicio.jsp" %>


  </head>

  <body>

       <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/menu.jsp" %>
      
	<h1>Inserir novo Veiculo</h1>
	<hr />
	<h2>Escolha o Cliente</h2>
	<br />
	<table border=1>
		<thead>
			<tr>
				<th>Código</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Escolher</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lista}" var="x">
				<tr>
					<td>${x.codCliente}</td>
					<td>${x.nome}</td>
					<td>${x.telefone}</td>
					<td class="actions"><a
						href="<%=request.getContextPath()%>/VeiculoCRUD?cmd=novo&codCliente=${x.codCliente}">Escolher este</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
 <hr>

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
