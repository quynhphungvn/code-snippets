let dropdownSample = {
    htmlSnippet: `<div class="dropdown">
    <button type="button" onclick="myFunction()" 
      class="dropbtn">Dropdown</button>
    <div id="myDropdown" class="dropdown-content">
    <a href="#">Link 1</a>
    <a href="#">Link 2</a>
    <a href="#">Link 3</a>
    </div>
    </div>`,
    cssSnippet: 
    `/* Dropdown Button */
    .dropbtn {
    background-color: #3498DB;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    }
    
    /* Dropdown button on hover & focus */
    .dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
    }
    
    /* The container <div> - needed to position the dropdown content */
    .dropdown {
    position: relative;
    display: inline-block;
    }
    
    /* Dropdown Content (Hidden by Default) */
    .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    }
    
    /* Links inside the dropdown */
    .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    }
    
    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {background-color: #ddd;}
    
    /* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
    .show {display:block;}`,
    jsSnippet: 
    `/* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    }
    
    // Close the dropdown menu if the user clicks outside of it
    window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
    var openDropdown = dropdowns[i];
    if (openDropdown.classList.contains('show')) {
    openDropdown.classList.remove('show');
    }
    }
    }
    }`
}

let javaCode = `
package quynh.java.webapp.codesnippet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.model.TechSubject;
import quynh.java.webapp.codesnippet.service.CodeGroupService;
import quynh.java.webapp.codesnippet.service.FrontendCodeService;
import quynh.java.webapp.codesnippet.service.TechSubjectService;
import quynh.java.webapp.codesnippet.service.impl.CodeGroupServiceImpl;
import quynh.java.webapp.codesnippet.service.impl.FrontendCodeServiceImpl;
import quynh.java.webapp.codesnippet.service.impl.TechSubjectServiceImpl;

/**
 * Servlet implementation class FrontendCodeListController
 */
@WebServlet({"/frontend/list", "/frontend/list/*"})
public class FrontendListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CodeGroupService codeGroupService = new CodeGroupServiceImpl();   
    private TechSubjectService techSubjectService = new TechSubjectServiceImpl();
    private FrontendCodeService frontendCodeService = new FrontendCodeServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontendListPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    setupRequestAttribute(request);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/frontend-snippet/home/index.jsp");
		rd.forward(request, response);
	}
	
	private void setupRequestAttribute(HttpServletRequest request) {
	    String sTechSubjectId = request.getParameter("tech-subject-id");
	    int techSubjectId = 2;
	    if (sTechSubjectId != null && sTechSubjectId.isBlank() == false) {
	        techSubjectId = Integer.parseInt(sTechSubjectId);
	    }
	    String sSelectedGroupId = request.getParameter("selected-group-id");
	    if (sSelectedGroupId == null || sSelectedGroupId.isEmpty() == true) {         
            TechSubject techSubject = techSubjectService.getById(techSubjectId);
            List<CodeGroup> codeGroups = codeGroupService.getAll(techSubjectId);
            request.setAttribute("tech-subject", techSubject);
            request.setAttribute("code-groups", codeGroups);
        } else {    
            int selectedGroupId = Integer.parseInt(sSelectedGroupId);            
            TechSubject techSubject = techSubjectService.getById(techSubjectId);
            List<CodeGroup> codeGroups = codeGroupService.getAll(techSubjectId);
            CodeGroup selectedCodeGroup = codeGroupService.getById(selectedGroupId);
            List<FrontendCode> frontendCodes = frontendCodeService.getAll(selectedGroupId);
            
            request.setAttribute("tech-subject", techSubject);
            request.setAttribute("code-groups", codeGroups);
            request.setAttribute("selected-group", selectedCodeGroup);
            request.setAttribute("frontend-codes", frontendCodes);        
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Do Post's Working");
	    String path = request.getRequestURI();
	    System.out.println(path);
        if (path.contains("/frontend/list/group/add"))
            processRequestAdd(request, response);
        else if (path.contains("/frontend/list/group/delete")) 
            processRequestDelete(request, response);
        else if (path.contains("/frontend/list/group/update"))
            processRequestUpdate(request, response);
        if (path.contains("/frontend/list/code/add"))
            processRequestAddCodeSnippet(request, response);
        else if (path.contains("/frontend/list/code/delete")) 
            processRequestDeleteCodeSnippet(request, response);
        else if (path.contains("/frontend/list/code/update-info"))
            processRequestUpdateCodeSnippetInfo(request, response);
	}
	private void processRequestAdd(HttpServletRequest request, HttpServletResponse response) {
	    String sTechSubjectId = request.getParameter("tech-subject-id");
	    String sSelectedGroupId = request.getParameter("selected-group-id");
        String groupName = request.getParameter("group-name");
        if (groupName == null)
            processInvalidParamAdd();
        else {
            if (sTechSubjectId != null) {
                int techSubjectId = Integer.parseInt(sTechSubjectId);
                CodeGroup codeGroup = codeGroupService.add(groupName, techSubjectId);                
                try {
                    if (sSelectedGroupId == null || sSelectedGroupId.isBlank() )
                        response.sendRedirect("/CodeSnippet/frontend/list");                       
                    else 
                        response.sendRedirect("/CodeSnippet/frontend/list?selected-group-id=" + sSelectedGroupId);
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
    private void processRequestDelete(HttpServletRequest request, HttpServletResponse response) {
        String sSelectedGroupId = request.getParameter("selected-group-id");
        if (sSelectedGroupId != null && sSelectedGroupId.isBlank() == false) {
            int groupId = Integer.parseInt(sSelectedGroupId);
            CodeGroup codeGroup = codeGroupService.delete(groupId);
        }
        try {
            response.sendRedirect("/CodeSnippet/frontend/list");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    private void processRequestUpdate(HttpServletRequest request, HttpServletResponse response) {
        String sSelectedGroupId = request.getParameter("selected-group-id");
        String groupNewName = request.getParameter("group-new-name");
        if (sSelectedGroupId == null || sSelectedGroupId.isBlank() == true)
            try {
                response.sendRedirect("/CodeSnippet/frontend/list");
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        else {
            
                int groupId = Integer.parseInt(sSelectedGroupId);
                CodeGroup codeGroup = codeGroupService.updateName(groupId, groupNewName);                
                try {
                    response.sendRedirect("/CodeSnippet/frontend/list?selected-group-id=" + sSelectedGroupId);
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }   
        } 
    }
    private void processRequestAddCodeSnippet(HttpServletRequest request, HttpServletResponse response) {
        String sTechSubjectId = request.getParameter("tech-subject-id");
        String sSelectedGroupId = request.getParameter("selected-group-id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String htmlContent = request.getParameter("html-content");
        String cssContent = request.getParameter("css-content");
        String jsContent = request.getParameter("js-content");
        if (sSelectedGroupId == null || sSelectedGroupId.isBlank())
            processInvalidParamAdd();
        else
            frontendCodeService.add(name, description, htmlContent, cssContent, jsContent, "",
                    Integer.parseInt(sSelectedGroupId));
        try {
            response.sendRedirect("/CodeSnippet/frontend/list?selected-group-id=" + sSelectedGroupId);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }             
    }
    private void processInvalidParamAddCode() {
        System.out.println("Invalid param");
    }
    private void processRequestDeleteCodeSnippet(HttpServletRequest request, HttpServletResponse response) {
        String sSelectedGroupId = request.getParameter("selected-group-id");
        String sFrontendCodeSnippetId = request.getParameter("id");
        if (sFrontendCodeSnippetId != null && sFrontendCodeSnippetId.isBlank() == false) {
            int id = Integer.parseInt(sFrontendCodeSnippetId);
            frontendCodeService.delete(id);
        }       
    }
    private void processRequestUpdateCodeSnippetInfo(HttpServletRequest request, HttpServletResponse response) {
        String sSelectedGroupId = request.getParameter("selected-group-id");
        String sId = request.getParameter("id");
        String description = request.getParameter("description");
        String newName = request.getParameter("new-name");
        if (sSelectedGroupId == null || sSelectedGroupId.isBlank() == true)
            try {
                response.sendRedirect("/CodeSnippet/frontend/list");
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        else {            
                int groupId = Integer.parseInt(sSelectedGroupId);
                if (newName != null && newName.isBlank() == false)
                frontendCodeService.updateSnippetInfo(Integer.parseInt(sId), newName, description);
                try {
                    response.sendRedirect("/CodeSnippet/frontend/list?selected-group-id=" + sSelectedGroupId);
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }   
        } 
    }

}

`;