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
      	<form method="POST" action="<%=request.getContextPath()%>/VagaCRUD">
  <div class="form-group">
    <label for="codigo">Codigo da Vaga</label>
    <input value="${vaga.codVaga}" type="text" class="form-control" name="cod">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">N�mero da Vaga</label>
    <input value="${vaga.numero}" type="text" class="form-control" name="numero">
  </div>

  <input type="submit" class="btn btn-default" value="Enviar">
</form>
        
</div>
      <hr>

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
