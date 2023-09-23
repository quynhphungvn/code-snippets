<%@page import="quynh.java.webapp.codesnippet.model.FrontendCode"%>
<%@page import="java.awt.JobAttributes.DefaultSelectionType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,
                quynh.java.webapp.codesnippet.model.CodeGroup,
                quynh.java.webapp.codesnippet.model.TechSubject" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Html Css Snippet</title>
  <link rel="stylesheet" href="/CodeSnippet/libs/semantic-ui/semantic.min.css">
  <link rel="stylesheet" href="/CodeSnippet/libs/bootstrap/css/bootstrap-utilities.min.css">
  <style><%@include file="./styles.css" %></style>
</head>

<body>
    <%
    TechSubject techSubject = (TechSubject) request.getAttribute("tech-subject");
    List<CodeGroup> codeGroups = (List<CodeGroup>) request.getAttribute("code-groups");
    CodeGroup selectedGroup = (CodeGroup) request.getAttribute("selected-group");
    List<FrontendCode> frontendCodes = (List<FrontendCode>) request.getAttribute("frontend-codes");
    %>
  <div id="main-wrapper" class="d-flex">
    <aside class="left-bar border-end">
      <header class="d-flex perfect-center border-bottom">
        <h3 class="fw-bold">Frontend Snippet</h3>    
      </header>
      <main>
        <div class="ui vertical menu w-100 p-2">
        <%
        if (codeGroups != null)
	        for (CodeGroup codeGroup : codeGroups)
	        {
	            out.print("<a href=\"" + "/CodeSnippet/frontend/list?selected-group-id=" + codeGroup.getId() + "\"");
	            
	            if (selectedGroup != null) {
		            if (codeGroup.getId() == selectedGroup.getId())
		                out.print("class=\"item active\">");
		            else
		                out.print("class=\"item\">");
	            } else {
	                out.print("class=\"item\">");
	            }
	            out.print( codeGroup.getName()
	                    + "<div class=\"ui label\">" + codeGroup.getItemCount() + "</div>"
	                    + "</a>"
	                    );
	        }
        %>    
        </div>
      </main>
      <footer class="d-flex align-items-center">
        <div class="ui left pointing dropdown icon button">
          <i class="settings icon"></i>
          <div class="menu">
            <button class="item w-100" onclick="showModalAddGroup()">
              <i class="plus icon"></i>
              Add
            </button>
            <button class="item w-100" onclick="showModalEditGroup()">
              <i class="edit icon"></i>
              Edit
            </button>
            <button class="item w-100" data-group-id="<%=selectedGroup==null?"" : selectedGroup.getId() %>" 
                                       data-group-name="<%= selectedGroup==null?"" : selectedGroup.getName() %>" onclick="deleteGroup(this)">
              <i class="trash icon"></i>
              Delete
            </button>
          </div>
        </div>
        <div class="ui mini modal add-group">
          <div class="header">
            Add Snippet Group
          </div>
          <div class="content">
            <form method="post" action="/CodeSnippet/frontend/list/group/add" class="ui form" name="add">
                <input type="hidden" name="selected-group-id" value="<%= selectedGroup==null ? "" :selectedGroup.getId() %>">
                <input type="hidden" name="tech-subject-id" value="<%= techSubject==null ? "" :techSubject.getId() %>">
              <div class="field">
                <label>Name</label>
                <input type="text" name="group-name" placeholder="Snippet Group Name">
              </div>
              <button class="ui button" type="submit">Add</button>
            </form>
          </div>
        </div>
        <div class="ui modal edit-group">
          <div class="header">
            Edit Snippet Group
          </div>
          <div class="content">
            <form method="post" action="/CodeSnippet/frontend/list/group/update" class="ui form" name="edit">
                <input type="hidden" name="selected-group-id" value="<%= selectedGroup==null ? "" :selectedGroup.getId() %>">
                <input type="hidden" name="tech-subject-id" value="<%= techSubject==null ? "" :techSubject.getId() %>">
              <div class="field">
                <label>Name</label>
                <input type="text" name="group-name" placeholder="Snippet Group Name" value="<%= selectedGroup==null ? "":selectedGroup.getName() %>" disabled required>
              </div>
              <div class="field mb-5">
                <label>New Name</label>
                <input type="text" name="group-new-name" placeholder="New Name" required>
              </div>
              <button class="ui button" type="submit">Update</button>
            </form>
          </div>
        </div>
      </footer>
    </aside>
    <main class="main-content">
      <header class="d-flex align-items-center">
        <div class="ui breadcrumb ms-2">
          <a href="/CodeSnippet/home" class="section">Code Snippet</a>
          <div class="divider"> / </div>
          <a href="/CodeSnippet/frontend/list" class="section">Frontend</a>
          <div class="divider"> / </div>
          <%
          if (selectedGroup == null) 
              out.print("<div class=\"active section\">?</div>");
          else 
              out.print("<div class=\"active section\">" + selectedGroup.getName()+ "</div>");
          %>
        </div>       
      </header>
      <main class="d-flex perfect-center">
        <div class="ui-wrapper"> 
          <main>
            <%
            if (frontendCodes != null) {
                for (FrontendCode feCode : frontendCodes) {
                    out.print("<div class=\"uiinfo\">"
                              + "<div class=\"uiinfo__example\">"
	                                  + "<div class=\"test-code\">"
	                                  + "#unset"
		                      + "</div>"
		                      + "</div>"
		                      + "<div class=\"uiinfo__description d-flex flex-column\">");
                    
                    out.print(" <header>"
                           + "<h3 class=\"fw-bold bg-white p-2 rounded\"> " + feCode.getName() + "</h3>"
                           + "</header>");
                    out.print("<main class=\"flex-grow-1\">"
                            + "<p class=\"p-2\">"+ feCode.getDescription() +"</p>"
                            + "</main>");
                    out.print("<footer class=\"d-flex justify-content-end\">"
                            + "<button class=\"ui icon button me-1\"" 
                            + "data-id=\"" + feCode.getId() + "\"" 
                            + "data-snippet-name=\"" + feCode.getName() +"\""
                            + "data-snippet-description=\"" + feCode.getDescription() + "\""
                            + "onclick=\"showModalUpdateSnippetInfo(this)\">"
                            + "<i class=\"edit icon\"></i>"
                            + "</button>"
                            + "<a target=\"_blank\" href=\"/CodeSnippet/frontend/item?id=" + feCode.getId() + "\""
                            + "class=\"ui icon button me-1\">"
                            + "<i class=\"code icon\"></i>"
                            + "</a>"
                            + "<button class=\"ui icon button\""
                            +        "data-group-id=\"" + selectedGroup.getId() + "\""
                            +        "data-id=\"" + feCode.getId() + "\""
                            +        "data-name=\"" + feCode.getName() + "\" onclick=\"deleteFrontendCodeSnippet(this)\">"
                            + "<i class=\"trash icon\"></i>"
                            + "</button>"
                            + "</footer></div></div>");            
                }
            }
            %>
            
          <!-- modal edit -->
          <div class="ui modal edit-ui">
            <i class="close icon"></i>
            <div class="header">
              Edit Info
            </div>
            <div class="content">
              <form method="post" action="/CodeSnippet/frontend/list/code/update-info" class="ui form">
                <input type="hidden" name="selected-group-id" value="<%= selectedGroup==null ? "" :selectedGroup.getId() %>">
                <input type="hidden" name="id">
                <div class="field">
                  <label>Name</label>
                  <input type="text" name="name" placeholder="Name" readonly class="text-primary">
                </div>
                <div class="field">
                  <label>New Name</label>
                  <input type="text" name="new-name" placeholder="New Name">
                </div>
                <div class="field">
                  <label>Description</label>
                  <textarea name="description" rows="10"></textarea>
                </div>
                <button class="ui button" type="submit">Update</button>
              </form>
            </div>
          </div>
          </main>
          <footer class="d-flex justify-content-end mt-3">
            <button class="ui icon button" onclick="showModalAddSnippet()">
              <i class="add icon"></i>
            </button>
            <div class="ui modal add-snippet">
              <div class="header">Add Snippet</div>
              <div class="content">
                <form method="post" action="/CodeSnippet/frontend/list/code/add" class="ui form">
                <input type="hidden" name="selected-group-id" value="<%= selectedGroup==null ? "" :selectedGroup.getId() %>">
                  <div class="field">
                    <label>Name</label>
                    <input type="text" name="name" placeholder="Name">
                  </div>
                  <div class="field">
                    <label>Description</label>
                    <textarea rows="3" name="description"></textarea>
                  </div>
                  <div class="d-flex justify-content-between">
                    <div class="field">
                      <label>Html</label>
                      <textarea rows="10" cols="30" name="html-content"></textarea>
                    </div>
                    <div class="field">
                      <label>Css</label>
                      <textarea rows="10" cols="30" name="css-content"></textarea>
                    </div>
                    <div class="field">
                      <label>Js</label>
                      <textarea rows="10" cols="30" name="js-content"></textarea>
                    </div>
                  </div>
                  <div>
                    <button class="ui button" type="submit">Submit</button>
                  </div>                 
                </form>
              </div>
            </div>
          </footer>
        </div> 
      </main>
    </main>
  </div>
  <script src="/CodeSnippet/libs/jquery-3.7.1.min.js"></script>
  <script src="/CodeSnippet/libs/semantic-ui/semantic.min.js"></script>
  <script><%@ include file="./script.js" %></script>
</body>
</html>