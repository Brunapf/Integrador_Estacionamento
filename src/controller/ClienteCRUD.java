package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dominio.Cliente;
import servico.ServicoFactory;
import servico.ClienteServico;

/**
 * Servlet implementation class ClienteCRUD
 */
@WebServlet("/ClienteCRUD")
public class ClienteCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LISTAR = "/funcionario/listarcliente.jsp";
	private static String INSERIR_OU_ALTERAR = "funcionario/formcliente.jsp";
	private static String ERRO = "/public/erro.jsp";
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		String forward = "";
		String cmd = request.getParameter("cmd");
		if (cmd == null || cmd.equalsIgnoreCase("")){
			cmd = "listar";
		
			try {
				request.setAttribute("lista", clienteServico.buscarTodos());
				
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		else if (cmd.equalsIgnoreCase("deletar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Cliente cli = clienteServico.buscar(cod);
				if (cli != null) {
					clienteServico.excluir(cli);
				}
				request.setAttribute("lista", clienteServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		
		else if (cmd.equalsIgnoreCase("editar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Cliente cliente = clienteServico.buscar(cod);
				if (cliente != null) {
					request.setAttribute("cliente", cliente);
					forward = INSERIR_OU_ALTERAR;
				} else {
					request.setAttribute("lista", clienteServico.buscarTodos());
					forward = LISTAR;
				}
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		}
		 

		else if (cmd.equalsIgnoreCase("novo")) {
			try {
				Cliente cliente = new Cliente();
				
				request.setAttribute("cliente", cliente);
				forward = INSERIR_OU_ALTERAR;
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		}

		
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			ClienteServico clienteServico = ServicoFactory.criarClienteServico();
			String forward = "";
			Cliente cli = instanciar(request);
			clienteServico.inserirAtualizar(cli);
			request.setAttribute("lista", clienteServico.buscarTodos());
			forward = LISTAR;
			RequestDispatcher rd = request.getRequestDispatcher(forward);
			rd.forward(request, response);
	}
	
	private Cliente instanciar(HttpServletRequest req) {
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		String aux;
		
		Cliente x = new Cliente();
		aux = req.getParameter("codCliente");
		if (aux != null && !aux.isEmpty())
			x.setCodCliente(Integer.parseInt(aux));
		
		aux = req.getParameter("nome");
		x.setNome(aux);
		aux = req.getParameter("telefone");
		x.setTelefone(aux);
		return x;
	}

}
