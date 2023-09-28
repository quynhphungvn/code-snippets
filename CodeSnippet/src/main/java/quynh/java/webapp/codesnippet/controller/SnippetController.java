package quynh.java.webapp.codesnippet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.CodeSnippet;
import quynh.java.webapp.codesnippet.model.Technology;
import quynh.java.webapp.codesnippet.service.CodeGroupService;
import quynh.java.webapp.codesnippet.service.CodeSnippetService;
import quynh.java.webapp.codesnippet.service.TechnologyService;
import quynh.java.webapp.codesnippet.service.impl.CodeGroupServiceImpl;
import quynh.java.webapp.codesnippet.service.impl.CodeSnippetServiceImpl;
import quynh.java.webapp.codesnippet.service.impl.TechnologyServiceImpl;
import quynh.java.webapp.codesnippet.support.util.StringChecker;

/**
 * Servlet implementation class codeSnippetListController
 */
@WebServlet({"/view","/view/*"})
public class SnippetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CodeGroupService codeGroupService = new CodeGroupServiceImpl();   
    private TechnologyService technologyService = new TechnologyServiceImpl();
    private CodeSnippetService codeSnippetService = new CodeSnippetServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SnippetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRequestURI();
		if (path.contains("/code")) {
		    prepareFoward(request);		
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/code-snippet/index.jsp");
			rd.forward(request, response);		
		}
	}
	private void prepareFoward(HttpServletRequest request) {
		System.out.println("Prepare forward");
		int cid = getParameterId(request, "cid");
		if (cid != 0) {
			prepareWhenCidAvailable(request, cid);
		} else {
			int gId = getParameterId(request, "gid");
			if (gId != 0)
				prepareWhenGidAvailable(request, gId);
			else {
				int tId = getParameterId(request, "tid");
				if (tId != 0) {
					prepareWhenTidAvailable(request, tId);
				} else {
					prepareWhenAllParamIdUnavailable(request);
				}
			}
		}
	}
	private int getParameterId(HttpServletRequest request, String paramName) {
		String paramValue = request.getParameter(paramName);
		if (StringChecker.isInteger(paramValue))
			return Integer.parseInt(paramValue);
		return 0;
	}
	private void prepareWhenCidAvailable(HttpServletRequest request, int cId) {
		System.out.println("Cid processing");
		CodeSnippet	codeSnippet = codeSnippetService.getById(cId);
		if (codeSnippet == null) {
			int gId = getParameterId(request, "gid");
			if (gId != 0)
				prepareWhenGidAvailable(request, gId);
			else {
				int tId = getParameterId(request, "tid");
				if (tId != 0) {
					prepareWhenTidAvailable(request, tId);
				} else {
					prepareWhenAllParamIdUnavailable(request);
				}
			}
		} else {
			CodeGroup codeGroup = codeSnippet.getCodeGroup();
			Technology technology = codeGroup.getTechnology();
			List<CodeSnippet> codeSnippets = codeSnippetService.getAll(codeGroup);
			List<CodeGroup>	codeGroups = codeGroupService.getAll(technology);
			List<Technology> technologies = technologyService.getAll();
			setValueAttribute(request, technology, technologies, codeGroup, codeGroups, codeSnippet, codeSnippets);	
		}
	}
	private void prepareWhenGidAvailable(HttpServletRequest request, int gId) {
		System.out.println("Gid processing");
		CodeSnippet codeSnippet = null;
		List<CodeSnippet> codeSnippets = null;
		List<CodeGroup> codeGroups = null;
		List<Technology> technologies = null;
		Technology technology = null;
		CodeGroup codeGroup = codeGroupService.getById(gId);
		if (codeGroup != null) {
			technology = codeGroup.getTechnology();
			codeSnippets = codeSnippetService.getAll(codeGroup);
			codeGroups = codeGroupService.getAll(technology);
			technologies = technologyService.getAll();
			setValueAttribute(request, technology, technologies, codeGroup, codeGroups, codeSnippet, codeSnippets);	
		} else {
			int tId = getParameterId(request, "tid");
			if (tId != 0)
				prepareWhenTidAvailable(request, tId);
			else {
				prepareWhenAllParamIdUnavailable(request);
			}
		}
	}
	private void prepareWhenTidAvailable(HttpServletRequest request, int tId) {
		System.out.println("Tid processing");
		CodeSnippet codeSnippet = null;
		CodeGroup codeGroup = null;
		List<CodeSnippet> codeSnippets = null;
		List<CodeGroup> codeGroups = null;
		List<Technology> technologies = null;
		Technology technology = technologyService.getById(tId);		
		if (technology != null) {
			codeGroups = codeGroupService.getAll(technology);
			technologies = technologyService.getAll();
			setValueAttribute(request, technology, technologies, codeGroup, codeGroups, codeSnippet, codeSnippets);
		} else {
			prepareWhenAllParamIdUnavailable(request);
		}
	}
	private void prepareWhenAllParamIdUnavailable(HttpServletRequest request) {
		CodeSnippet codeSnippet = null;
		CodeGroup codeGroup = null;
		List<CodeSnippet> codeSnippets = null;
		Technology technology = null;					
		List<CodeGroup> codeGroups = null;
		List<Technology> technologies = technologyService.getAll();
		setValueAttribute(request, technology, technologies, codeGroup, codeGroups, codeSnippet, codeSnippets);
	}
	private void setValueAttribute(HttpServletRequest request, 
								Technology technology, List<Technology> technologies,
								CodeGroup codeGroup, List<CodeGroup> codeGroups,
								CodeSnippet codeSnippet, List<CodeSnippet> codeSnippets) {
		request.setAttribute("codeSnippet", codeSnippet);
		request.setAttribute("codeGroup", codeGroup);
		request.setAttribute("technology", technology);
		request.setAttribute("codeSnippets", codeSnippets);
		request.setAttribute("codeGroups", codeGroups);
		request.setAttribute("technologies", technologies);	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String path = request.getRequestURI();
        if (path.contains("/group/add"))
            processRequestAddGroup(request, response);
        else if (path.contains("/group/delete")) 
            processRequestDeleteGroup(request, response);
        else if (path.contains("/group/update"))
            processRequestUpdateGroup(request, response);
        if (path.contains("/code/add"))
            processRequestAddCodeSnippet(request, response);
        else if (path.contains("/code/delete")) 
            processRequestDeleteCodeSnippet(request, response);
        else if (path.contains("/code/update-name"))
            processRequestUpdateCodeSnippetName(request, response);
        else if (path.contains("/code/update-content"))
            processRequestUpdateCodeSnippetContent(request, response);
	}
	
	private void processRequestAddGroup(HttpServletRequest request, HttpServletResponse response) {
	    int tId = getParameterId(request, "tid");
	    int gId = getParameterId(request, "gid");
	    int cId = getParameterId(request, "cid");
        String groupName = request.getParameter("name");
        if (groupName == null || groupName.isBlank())
            processInvalidParamAdd();
        else {
        	if (tId != 0)
        	{
	            codeGroupService.add(groupName, tId);
	            try {
					response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId + "&cid=" + cId);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
            	try {
					response.sendRedirect("/CodeSnippet/view/code");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        }         
    }
    private void processInvalidParamAdd() {
        System.out.println("Invalid param");
    }
    private void processRequestDeleteGroup(HttpServletRequest request, HttpServletResponse response) {
		int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");	

		if (gId != 0)
			codeGroupService.delete(gId);
		try {
			response.sendRedirect("/CodeSnippet/view/code?tid=" + tId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void processRequestUpdateGroup(HttpServletRequest request, HttpServletResponse response) {
		int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");
		int cId = getParameterId(request, "cid");
		String groupNewName = request.getParameter("new-name");
		if (gId == 0)
			try {
				response.sendRedirect("/CodeSnippet/view/code?tid=" + tId);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		else {
			codeGroupService.updateName(gId, groupNewName);
			try {
				response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId + "&cid=" + cId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void processRequestAddCodeSnippet(HttpServletRequest request, HttpServletResponse response) {
		int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");
		int cId = getParameterId(request, "cid");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		if (gId == 0 || name == null || name.isBlank())
			processInvalidParamAdd();
		else {
			codeSnippetService.add(name, content, gId);			
		}
		try {
			response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId + "&cid=" + cId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
    private void processRequestDeleteCodeSnippet(HttpServletRequest request, HttpServletResponse response) {
    	int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");
		int cId = getParameterId(request, "cid");
        if (cId != 0) {
            codeSnippetService.delete(cId);       
        }  
        try {
			response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	private void processRequestUpdateCodeSnippetName(HttpServletRequest request, HttpServletResponse response) {
		int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");
		int cId = getParameterId(request, "cid");
		String newName = request.getParameter("new-name");
		if (cId == 0 || newName.isBlank())
		{}
		else 
			codeSnippetService.updateName(cId, newName);
		try {
			response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId + "&cid=" + cId);
		} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		
	}
    private void processRequestUpdateCodeSnippetContent(HttpServletRequest request, HttpServletResponse response) {
    	int tId = getParameterId(request, "tid");
		int gId = getParameterId(request, "gid");
		int cId = getParameterId(request, "cid");
		String content = request.getParameter("content");
		String syntax = request.getParameter("syntax");
		String relevantInfo = request.getParameter("relevant-info");
		String comment = request.getParameter("comment");
		if (cId != 0) {
			codeSnippetService.updateContent(cId, content, syntax, relevantInfo, comment);
		}
		try {
			response.sendRedirect("/CodeSnippet/view/code?tid=" + tId + "&gid=" + gId + "&cid=" + cId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
