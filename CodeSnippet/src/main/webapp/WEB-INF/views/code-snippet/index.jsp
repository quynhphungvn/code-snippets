<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import= "	java.util.List,
					java.util.ArrayList,
					quynh.java.webapp.codesnippet.model.CodeSnippet,
					quynh.java.webapp.codesnippet.model.CodeGroup,
					quynh.java.webapp.codesnippet.model.Technology" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${technology == null?'Code Snippet': technology.name}</title>
  <link rel="stylesheet" href="/CodeSnippet/libs/semantic-ui/semantic.min.css">
  <link rel="stylesheet" href="/CodeSnippet/libs/bootstrap/css/bootstrap-utilities.min.css">
  <style><%@include file="./reset.css" %></style>
  <style><%@include file="./styles.css" %></style>
  <script src="/CodeSnippet/libs/edit_area/edit_area_full.js"></script>
</head>

<body>
	<div id="main-wrapper">
    <aside class="left-bar border-end">
      <header class="d-flex align-items-center border-bottom ms-1">
        <form class="ui form">
          <div class="field">	
            <select class="ui search dropdown"
            		name="select-tech" 
            		onchange="selectTechnology()">	          
              <option value="">Choose tech</option>
              <c:if test="${technologies != null}">
              	<c:forEach var="tech" items="${technologies}">
              		<option value="${tech.id}" ${((technology != null)&& (technology.id == tech.id))?'selected':''}>
              			<c:out value="${tech.name}"></c:out>            			
              		</option>
              	</c:forEach>
              </c:if>             
            </select>
          </div>
        </form>
      </header>
      <main>    
        <section class="groups">
          <header class="d-flex align-items-center">
            <h4 class="ui header ms-1">Groups</h4>
          </header>
          <main class="pb-2 px-1">
          <div class="ui vertical menu w-100">
          	<c:if test="${codeGroups != null}">
          		<c:forEach var="group" items="${codeGroups}">
          			 <a href="/CodeSnippet/view/code?tid=${technology == null? '': technology.id}&gid=${group.id}" 
          			 	class="item${(codeGroup != null) && (group.id == codeGroup.id)?' active':''}">
		              	<div class="ui small label"><c:out value="${group.itemCount}"></c:out></div>
		                ${group.name}
		              </a> 
          		</c:forEach>
          	</c:if>         
          	</div>
            <!-- <div class="ui vertical menu w-100">
              <a href="/CodeSnippet/home?tid=1&gid=1&cid=1" class="item active">
              	<div class="ui small label">51</div>
                Visit Google
              </a>             
            </div> -->
          </main>
          <footer class="d-flex align-items-center border-bottom">
            <div class="ui icon bottom left pointing dropdown button p-1 ms-1">
              <i class="settings icon"></i>
              <div class="menu">
                <button class="item w-100 ${technology == null?'disabled':''}" 
                		onclick="showModalAddGroup(this)">
                  <i class="plus icon"></i>
                  Add
                </button>
                <button class="item w-100 ${codeGroup == null?'disabled':''}"               		
                		onclick="showModalEditGroup(this)">
                  <i class="edit icon"></i>
                  Edit
                </button>
                <button class="item w-100 ${codeGroup == null?'disabled':''}" 
                		data-tid="${technology == null?'':technology.id}"
                		data-gid="${codeGroup == null?'': codeGroup.id}" 
                		data-name="${codeGroup == null?'': codeGroup.name}" 
                		onclick="deleteGroup(this)">
                  <i class="trash icon"></i>
                  Delete
                </button>
              </div>
            </div>
          </footer>
          
        <div class="ui mini modal add-group">
          <div class="header">
            Add Group
          </div>
          <div class="content">
            <form method="post" action="/CodeSnippet/view/group/add" class="ui form" name="add">
              <input type="hidden" name="tid" value="${technology == null?'':technology.id}">
              <input type="hidden" name="gid" value="${codeGroup == null?'':codeGroup.id}">
              <input type="hidden" name="cid" value="${codeSnippet == null?'':codeSnippet.id}">
              <div class="field">
                <label>Name</label>
                <input type="text" name="name" placeholder="Group Name">
              </div>
              <button class="ui button" type="submit">Add</button>
            </form>
          </div>
        </div>
        <div class="ui modal edit-group">
          <div class="header">
            Edit Group
          </div>
          <div class="content">
            <form method="post" action="/CodeSnippet/view/group/update" class="ui form" name="edit">
              <input type="hidden" name="tid" value="${technology == null?'':technology.id}">
              <input type="hidden" name="gid" value="${codeGroup == null?'':codeGroup.id}">
              <input type="hidden" name="cid" value="${codeSnippet == null?'':codeSnippet.id}">
              <div class="field">
                <label>Name</label>
                <input type="text" name="group-name" value="${codeGroup != null?'':codeGroup.name}" disabled>
              </div>
              <div class="field mb-5">
                <label>New Name</label>
                <input type="text" name="new-name" placeholder="New Name">
              </div>
              <button class="ui button" type="submit">Update</button>
            </form>
          </div>
        </div>
        </section>
        <section class="codes">
          <main class="pb-2 px-1">
            <div class="ui vertical menu w-100">
            	<c:if test="${codeSnippets != null}">         		
            		<c:forEach var="snippet" items="${codeSnippets}">
            			<a href="/CodeSnippet/view/code?tid=${technology == null? '': technology.id}&gid=${codeGroup == null? '': codeGroup.id}&cid=${snippet.id}" 
          			 								class="item${(codeSnippet != null) && (codeSnippet.id == snippet.id)?' active':''}">
			                <c:out value="${snippet.name}"></c:out>
			             </a> 	
            		</c:forEach>
            	</c:if>           
            </div>
          </main>
          <footer class="d-flex align-items-center border-bottom">
            <div class="ui icon bottom left pointing dropdown button p-1 ms-1">
              <i class="settings icon"></i>
              <div class="menu">
                <button class="item w-100 ${codeGroup == null?'disabled':''}" onclick="showModalAddCodeSnippet()">
                  <i class="plus icon"></i>
                  Add
                </button>
                <button class="item w-100 ${codeSnippet == null?'disabled':''}" onclick="showModalEditCodeSnippet()">
                  <i class="edit icon"></i>
                  Edit
                </button>
                <button class="item w-100 ${codeSnippet == null?'disabled':''}"
                							data-gid="${codeGroup==null?'':codeGroup.id}"  
                							data-cid="${codeSnippet == null?'':codeSnippet.id}"
                							data-name="${codeSnippet == null?'': codeSnippet.name}" 
                							onclick="deleteCodeSnippet(this)">
                  <i class="trash icon"></i>
                  Delete
                </button>
              </div>
            </div>
            <!-- Modal add code -->
            <div class="ui mini modal add-snippet">
              <div class="header">
                Add Snippet
              </div>
              <div class="content">
                <form method="post" action="/CodeSnippet/view/code/add" class="ui form" name="add">
                  <input type="hidden" name="tid" value="${technology == null?'':technology.id}">
	              <input type="hidden" name="gid" value="${codeGroup == null?'':codeGroup.id}">
	              <input type="hidden" name="cid" value="${codeSnippet == null?'':codeSnippet.id}">
                  <div class="field">
                    <label>Name</label>
                    <input type="text" name="name" placeholder="Code Snippet Name">
                  </div>
                  <button class="ui button" type="submit">Add</button>
                </form>
              </div>
            </div>
            <!-- Modal edit code -->
            <div class="ui modal edit-snippet">
              <div class="header">
                Edit Snippet Name
              </div>
              <div class="content">
                <form method="post" action="/CodeSnippet/view/code/update-name" class="ui form" name="edit">
                  <input type="hidden" name="tid" value="${technology == null?'':technology.id}">
	              <input type="hidden" name="gid" value="${codeGroup == null?'':codeGroup.id}">
	              <input type="hidden" name="cid" value="${codeSnippet == null?'':codeSnippet.id}">
                  <div class="field">
                    <label>Name</label>
                    <input type="text" name="name" value="${codeSnippet == null?'':codeSnippet.name}" disabled>
                  </div>
                  <div class="field mb-5">
                    <label>New Name</label>
                    <input type="text" name="new-name" placeholder="New Name">
                  </div>
                  <button class="ui button" type="submit">Update</button>
                </form>
              </div>
            </div>
          </footer>
        </section>
      </main>
    </aside>
    <nav class="d-flex align-items-center shadow">
      <div class="ui breadcrumb ms-2">
        <a href="/CodeSnippet/home" class="section">Home</a>
        <div class="divider"> / </div>
        <a href="/CodeSnippet/view/code?tid=${technology == null? '': technology.id}"
        			class="section"><c:out value="${technology == null?'?':technology.name}"></c:out></a>
        <div class="divider"> / </div>
        <a href="/CodeSnippet/view/code?tid=${technology == null? '': technology.id}&gid=${codeGroup == null? '': codeGroup.id}"
        			class="section"><c:out value="${codeGroup == null?'?':codeGroup.name}"></c:out></a>
        <div class="divider"> / </div>
        <div class="active section"><c:out value="${codeSnippet == null?'?':codeSnippet.name}"></c:out></div>
      </div> 
    </nav>
    <main class="d-flex perfect-center">
      <div class="content-wrapper shadow border rounded">
        <div class="code p-2">
          <div class="ui form">
            <div class="field">
              <div class="p-1 d-flex align-items-center">
                <label class="fw-bold me-2">Code</label>
                <button class="ui button icon p-1" type="button" onclick="copyCodeToClipboard()">
                  <i class="copy icon"></i>
                </button>
              </div>             
              <textarea id="code-editor" rows="44"
              			data-id="${codeSnippet == null? '' : codeSnippet.id}"
              			data-name="${codeSnippet == null? '' : codeSnippet.name}"
              			data-content="<c:if test='${codeSnippet != null}'><c:out value='${codeSnippet.content}'/></c:if>"
              			data-syntax="${codeSnippet == null? '' : codeSnippet.syntax}"
              			readonly>             	
              </textarea>
            </div>
          </div>
        </div>
        <div class="info p-2">
          <div class="ui form">
            <div class="field">
              <div class="p-1">
                <label>Info</label>
              </div>             
              <textarea rows="12" name="relevant-info" readonly><c:out value="${codeSnippet == null? '' : codeSnippet.relevantInfo}"/>
              </textarea>
            </div>
          </div>
        </div>
        <div class="comment p-2">
          <div class="ui form">
            <div class="field">
              <div class="p-1">
                <label>Comment</label>
              </div>             
              <textarea rows="25" name="comment" readonly><c:out value="${codeSnippet == null? '' : codeSnippet.comment}"/>
              </textarea>
            </div>
          </div>
        </div>
        <div class="control p-2 d-flex align-items-center justify-content-end">
          <button class="ui icon button d-none js-btn-save" type="button" 
            onclick="updateCodeSnippet(${codeSnippet == null? '' : codeSnippet.id})">
            <i class="save icon"></i>
          </button>
          <button class="ui icon button js-btn-edit ${codeSnippet == null ? 'disabled' : ''}" type="button" 
                    onclick="toggleEditableMode()">
            <i class="edit icon"></i>
          </button>
        </div>
      </div>
    </main>
  </div>
  <script src="/CodeSnippet/libs/jquery-3.7.1.min.js"></script>
  <script src="/CodeSnippet/libs/semantic-ui/semantic.min.js"></script>
  <script><%@ include file="./editor-function.js" %></script>
  <script><%@ include file="./script.js" %></script>
</body>
</html>