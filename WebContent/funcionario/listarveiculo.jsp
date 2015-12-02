<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
       		<thead>
       		 <tr>
       		 	<th>Código</th>
       		 	<th>Placa Veiculo</th>
       		 	<th>Cliente Veiculo</th>
       		 	<th colspan=2>Ação</th>
       		 </tr>
       		</thead>
       		<tbody>
       			<c:forEach items="${lista}" var="x">
       				<tr>
	       				<td>${x.codVeiculo}</td>
	       				<td> ${x.placa} </td>
       			   			<td> ${x.cliente.nome} </td>
       			<td><a
href="<%=request.getContextPath()%>/VeiculoCRUD?cmd=editar&cod=${x.codVeiculo}">Editar</a></td>
<td><a
href="<%=request.getContextPath()%>/VeiculoCRUD?cmd=deletar&cod=${x.codVeiculo}">Excluir</a></td>
       		</tr>
       		</c:forEach>
       		</tbody>
        </table>
        <p><a href="<%=request.getContextPath()%>/VeiculoCRUD?cmd=escolherCliente">Cadastrar Novo Veiculo</a></p>
</div>
      <hr>

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
