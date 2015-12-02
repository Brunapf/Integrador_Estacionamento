<div class="container">

      <div class="masthead">
        <a href="index.jsp"><h3 class="muted"><img style="height:80px; width:80px " src="<%=request.getContextPath()%>/resources/img/logo.png"> Estacionamento Integrador</h3></a>
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul role="navigation" class="nav">
                    <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="veiculo">Veiculo <b class="caret"></b></a>
                      <ul aria-labelledby="veiculo" role="menu" class="dropdown-menu">
                        <li role="presentation"><a href="<%=request.getContextPath()%>/VeiculoCRUD?cmd=escolherCliente" tabindex="-1" role="menuitem">Cadastrar Veiculo</a></li>
                        <li role="presentation"><a href="<%=request.getContextPath()%>/VeiculoCRUD" tabindex="-1" role="menuitem">Listar Veiculos</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="vaga">Vagas <b class="caret"></b></a>
                      <ul aria-labelledby="vaga" role="menu" class="dropdown-menu">
                        <li role="presentation"><a href="<%=request.getContextPath()%>/VagaCRUD?cmd=novo" tabindex="-1" role="menuitem">Cadastrar Vaga</a></li>
                        <li role="presentation"><a href="<%=request.getContextPath()%>/VagaCRUD" tabindex="-1" role="menuitem">Listar Vagas</a></li>
                      	<li role="presentation"><a href="<%=request.getContextPath()%>/VagaCRUD?cmd=habilitar" tabindex="-1" role="menuitem">Gerenciar Vagas</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="cliente">Clientes <b class="caret"></b></a>
                      <ul aria-labelledby="cliente" role="menu" class="dropdown-menu">
                        <li role="presentation"><a href="<%=request.getContextPath()%>/ClienteCRUD?cmd=novo" tabindex="-1" role="menuitem" >Cadastrar Cliente</a></li>
                        <li role="presentation"><a href="<%=request.getContextPath()%>/ClienteCRUD" tabindex="-1" role="menuitem">Listar Clientes</a></li>
                      </ul>
                    </li>
                    
                    <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="locacao">Locação <b class="caret"></b></a>
                      <ul aria-labelledby="locacao" role="menu" class="dropdown-menu">
                        <li role="presentation"><a href="#" tabindex="-1" role="menuitem">Registrar Locação</a></li>
                        <li role="presentation"><a href="#anotherAction" tabindex="-1" role="menuitem">Atualizar Valores</a></li>
                        <li role="presentation"><a href="#anotherAction" tabindex="-1" role="menuitem">Finalizar Locação</a></li>
                      </ul>
                    </li>
                    
                  </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
     
      