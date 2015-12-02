package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dominio.Veiculo;
import servico.VeiculoServico;
import servico.ClienteServico;

import servico.ServicoFactory;

@WebServlet("/VeiculoCRUD")
public class VeiculoCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String CONFIRMACAO = "/funcionario/confirmacao.jsp";
	private static String INSERIR_OU_ALTERAR = "/funcionario/formveiculo.jsp";
	private static String LISTAR = "/funcionario/listarveiculo.jsp";
	private static String ERRO = "/publico/erro.jsp";
	private static String ESCOLHER_CLIENTE = "/funcionario/escolherCliente.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VeiculoServico veiculoServico = ServicoFactory.criarVeiculoServico();
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		
		String forward = "";
		String cmd = request.getParameter("cmd");
		
		if (cmd == null || cmd.equalsIgnoreCase(""))
			cmd = "listar";
		
		
		if (cmd.equalsIgnoreCase("deletar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Veiculo vei = veiculoServico.buscar(cod);
				if (vei != null) {
					veiculoServico.excluir(vei);
				}
				request.setAttribute("lista", veiculoServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} 
		
		else if (cmd.equalsIgnoreCase("editar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Veiculo vei = veiculoServico.buscar(cod);
				if (vei != null) {
					request.setAttribute("vei", vei);
					forward = INSERIR_OU_ALTERAR;
				} else {
					request.setAttribute("lista", veiculoServico.buscarTodos());
					forward = LISTAR;
				}
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		} 
		
		else if (cmd.equalsIgnoreCase("escolherCliente")) {
			try {
				request.setAttribute("lista", clienteServico.buscarTodos());
				forward = ESCOLHER_CLIENTE;
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		} 
		
		else if (cmd.equalsIgnoreCase("listar")) {
			try {
				request.setAttribute("lista", veiculoServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		else if (cmd.equalsIgnoreCase("novo")) {
			int codCliente = Integer.parseInt(request.getParameter("codCliente"));
			try {
				Veiculo vei = new Veiculo();
				vei.setCliente(clienteServico.buscar(codCliente));
				request.setAttribute("vei", vei);
				forward = INSERIR_OU_ALTERAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		VeiculoServico veiculoServico = ServicoFactory.criarVeiculoServico();
		
		String forward = "";
		try {
			Veiculo vei = instanciar(request);
			
			veiculoServico.inserirAtualizar(vei);
			//request.setAttribute("lista", veiculoServico.buscarTodos());
			request.setAttribute("vei",vei);
			forward = CONFIRMACAO;
		}catch (RuntimeException e) {
			request.setAttribute("Erro de execução: ", e.getMessage());
			forward = ERRO;
		}
			
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	private Veiculo instanciar(HttpServletRequest req) {
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		String aux;
		Veiculo x = new Veiculo();
		aux = req.getParameter("codVeiculo");
		if (aux != null && !aux.isEmpty())
			x.setCodVeiculo(Integer.parseInt(aux));
		aux = req.getParameter("placa");
		x.setPlaca(aux);
		
		aux = req.getParameter("codCliente");
		x.setCliente(clienteServico.buscar(Integer.parseInt(aux)));
		return x;
	}
}