
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
      	<form method="POST" action="<%=request.getContextPath()%>/VeiculoCRUD">
      	
 	<input value="${vei.cliente.codCliente}" type="hidden"  name="codCliente" >
 	
  <div class="form-group">
    <label for="codVeiculo">Codigo da Veiculo</label>
    <input value="${vei.codVeiculo}" type="text" class="form-control" name="codVeiculo" id="codVeiculo" readonly="readonly">
   </div>
   <div class="form-group">
	    <label for="cliente">Cliente :</label>
	   	<input type="text" readonly="readonly" name="cliente" value="${vei.cliente.nome}" id="artista"/>
   </div>
  
  <div class="form-group">
    <label for="placa">Placa do Veiculo</label>
    <input value="${vei.placa}" type="text" class="form-control" name="placa" placeholder="Digite a placa do carro">
  </div>

  <input type="submit" class="btn btn-default" value="Enviar">
</form>
        
</div>
      <hr>

    <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   
  </body>
</html>

