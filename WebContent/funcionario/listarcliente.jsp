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

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/bootstrap_inicio.jsp" %>


  </head>

  <body>

<!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/menu.jsp" %>


      <!-- Example row of columns -->
      <div class="row-fluid">
      	<table class="table table-striped tabelacentralizada">
       		<thead> <tr><th>Código</th> <th>Nome Cliente</th><th>Telefone</th><th colspan=2>Ação</th></tr> </thead>
       		<c:forEach items="${lista}" var="x">
       		<tr>
       		<td>${x.codCliente}</td>
       			<td> ${x.nome} </td>
       			<td> ${x.telefone} </td>
       			
       			<td><a
href="<%=request.getContextPath()%>/ClienteCRUD?cmd=editar&cod=${x.codCliente}">Editar</a></td>
<td><a
href="<%=request.getContextPath()%>/ClienteCRUD?cmd=deletar&cod=${x.codCliente}">Excluir</a></td>
       		</tr>
       		</c:forEach>
        </table>
        <p><a href="<%=request.getContextPath()%>/ClienteCRUD?cmd=novo">Cadastrar Novo Cliente</a></p>
</div>
      <hr>

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
