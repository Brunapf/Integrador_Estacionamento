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

      <hr>

      <!-- Example row of columns -->
      <div class="row-fluid">
        <div class="span4">
          <h2 style="text-align:center">Vaga 1</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-success"  href="#">Disponível &raquo;</a></p>
        </div>
        <div class="span4">
          <h2 style="text-align:center">Vaga 2</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-danger"  href="#">Ocupado &raquo;</a></p>
        </div>
        <div class="span4">
          <h2 style="text-align:center">Vaga 3</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-success"  href="#">Disponível &raquo;</a></p>
        </div>
      </div>
      <hr>
      <!-- Example row of columns -->
      <div class="row-fluid">
        <div class="span4">
          <h2 style="text-align:center">Vaga 4</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-success"  href="#">Disponível &raquo;</a></p>
        </div>
        <div class="span4">
          <h2 style="text-align:center">Vaga 5</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-danger"  href="#">Ocupado &raquo;</a></p>
        </div>
        <div class="span4">
          <h2 style="text-align:center">Vaga 6</h2>
          <p style="text-align:center"><img src="resources/img/carro.png" class="img-circle"></p>
          <p  style="text-align:center"><a class="btn btn-danger"  href="#">Ocupado &raquo;</a></p>
        </div>
      </div>

      <hr>

          <!--  Referencias basicas do bootstrap -->
<%@ include file="/resources/includes/rodape.jsp" %>   

  </body>
</html>
