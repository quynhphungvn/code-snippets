package quynh.java.webapp.codesnippet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.service.FrontendCodeService;
import quynh.java.webapp.codesnippet.service.impl.FrontendCodeServiceImpl;

/**
 * Servlet implementation class FrontendItemPageController
 */
@WebServlet({"/frontend/item", "/frontend/item/*"})
public class FrontendItemPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private FrontendCodeService frontendCodeService = new FrontendCodeServiceImpl();  
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontendItemPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sItemId = request.getParameter("id");
		if (sItemId == null || sItemId.isBlank())
		    response.sendRedirect("/CodeSnippet/frontend/list");
		else {
		    FrontendCode fc = frontendCodeService.getById(Integer.parseInt(sItemId));
		    request.setAttribute("frontend-code", fc);
		    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/frontend-snippet/detail/index.jsp");
		    rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("/frontend/item/update-content")) {
		    processUpdateContent(request, response);
		}
	}
	private void processUpdateContent(HttpServletRequest request, HttpServletResponse response) {
	    String sId = request.getParameter("id");
	    String htmlContent = request.getParameter("html");
	    String cssContent = request.getParameter("css");
	    String jsContent = request.getParameter("js");
	    String comment = request.getParameter("comment");
	    if (sId != null && sId.isBlank() == false)
	    frontendCodeService.updateSnippetContent(Integer.parseInt(sId), htmlContent, cssContent, jsContent, comment);	   
	}
}
