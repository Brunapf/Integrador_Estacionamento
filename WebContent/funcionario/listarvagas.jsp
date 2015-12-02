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
      
      <!-- Example row of columns -->
      <div class="row-fluid">
      	<table class="table table-striped tabelacentralizada">
       		<thead> <tr><th>C�digo</th> <th>Vagas Cadastradas</th><th colspan=2>A��o</th></tr> </thead>
       		<c:forEach items="${lista}" var="x">
       		<tr>
       		<td>${x.codVaga}</td>
       			<td>Vaga ${x.numero}</td>
       			<td><a
href="<%=request.getContextPath()%>/VagaCRUD?cmd=editar&cod=${x.codVaga}">Editar</a></td>

<td><a
href="<%=request.getContextPath()%>/VagaCRUD?cmd=deletar&cod=${x.codVaga}">Excluir</a></td>
       		</tr>
       		</c:forEach>
        </table>
        <p><a href="<%=request.getContextPath()%>/VagaCRUD?cmd=novo">Cadastrar Nova Vaga</a></p>

      <hr>

  
    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
