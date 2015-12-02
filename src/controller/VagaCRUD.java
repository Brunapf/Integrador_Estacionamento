package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dominio.Vaga;
import servico.ServicoFactory;
import servico.VagaServico;

/**
 * Servlet implementation class VagaCRUD
 */
@WebServlet("/VagaCRUD")
public class VagaCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LISTAR = "/funcionario/listarvagas.jsp";
	private static String INSERIR_OU_ALTERAR = "funcionario/formvagas.jsp";
	private static String ERRO = "/public/erro.jsp";
	private static String HABILITAR = "/funcionario/gerenciarvaga.jsp";
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VagaServico vagaServico = ServicoFactory.criarVagaServico();
		String forward = "";
		String cmd = request.getParameter("cmd");
		if (cmd == null || cmd.equalsIgnoreCase("")){
			cmd = "listar";
		
			try {
				request.setAttribute("lista", vagaServico.buscarTodos());
				
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		else if (cmd.equalsIgnoreCase("deletar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Vaga vag = vagaServico.buscar(cod);
				if (vag != null) {
					vagaServico.excluir(vag);
				}
				request.setAttribute("lista", vagaServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}
		
		else if (cmd.equalsIgnoreCase("editar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Vaga vaga = vagaServico.buscar(cod);
				if (vaga != null) {
					request.setAttribute("vaga", vaga);
					forward = INSERIR_OU_ALTERAR;
				} else {
					request.setAttribute("lista", vagaServico.buscarTodos());
					forward = LISTAR;
				}
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		}
		else if (cmd.equalsIgnoreCase("habilitar")) {
			System.out.println("entrou");
			int codi = Integer.parseInt(request.getParameter("cod"));
			
			//boolean habilita = Boolean.parseBoolean(request.getParameter("disponibilidade"));
			try {
				Vaga vaga = vagaServico.buscar(codi);
				
				request.setAttribute("vaga", vaga);
					forward = HABILITAR;
				
					request.setAttribute("lista", vagaServico.buscarTodos());
					forward = LISTAR;
				}
			catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		}

		else if (cmd.equalsIgnoreCase("novo")) {
			try {
				Vaga vaga = new Vaga();
				
				request.setAttribute("vaga", vaga);
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
			VagaServico vagaServico = ServicoFactory.criarVagaServico();
			String forward = "";
			Vaga vag = instanciar(request);
			vagaServico.inserirAtualizar(vag);
			request.setAttribute("lista", vagaServico.buscarTodos());
			forward = LISTAR;
			RequestDispatcher rd = request.getRequestDispatcher(forward);
			rd.forward(request, response);
	}
	
	private Vaga instanciar(HttpServletRequest req) {
		VagaServico vagaServico = ServicoFactory.criarVagaServico();
		String aux;
		Integer numero;
		Vaga x = new Vaga();
		aux = req.getParameter("cod");
		if (aux != null && !aux.isEmpty())
			x.setCodVaga(Integer.parseInt(aux));
		
		numero = Integer.parseInt(req.getParameter("numero"));
		x.setNumero(numero);
		
		return x;
	}

}
