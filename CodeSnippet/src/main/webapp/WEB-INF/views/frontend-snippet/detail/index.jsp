<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="quynh.java.webapp.codesnippet.model.FrontendCode" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Frontend Code</title>
  <link rel="stylesheet" href="/CodeSnippet/libs/semantic-ui/semantic.min.css">
  <link rel="stylesheet" href="/CodeSnippet/libs/bootstrap/css/bootstrap-utilities.min.css">
  <style><%@include file="./styles.css" %></style>
</head>

<body>
    <%
    FrontendCode frontendCode = (FrontendCode) request.getAttribute("frontend-code");
    %>
  <div id="main-wrapper">
    <header class="d-flex align-items-center border-bottom">
      <div class="ui breadcrumb ms-3">
        <a href="/CodeSnippet" class="section">Code Snippet</a>
        <div class="divider"> / </div>
        <a href="/CodeSnippet/frontend/list" class="section">Frontend</a>
        <div class="divider"> / </div>
        <a href="/CodeSnippet/frontend/list?selected-group-id=<%= frontendCode == null? "" : frontendCode.getCodeGroup().getId() %>" class="section">
                <%= frontendCode == null? "" : frontendCode.getCodeGroup().getName() %></a>
        <div class="divider"> / </div>
        <div class="section active"><%=frontendCode == null ? "?" : frontendCode.getName()%></div>
      </div>
    </header>
    <main>
      <div class="ui form">
        <input type="hidden" name="snippet-id" value="<%= frontendCode == null? "" : frontendCode.getId() %>">
        <div class="content-wrapper">
          <div class="html-content p-1">
            <div class="field">
              <div class="pb-1">
                <label>Html</label> 
                <button class="ui compact icon button" 
                        type="button" onclick="copyToClipboard('html')">
                  <i class="copy icon"></i>
                </button>
              </div>
              <textarea id="html-editor" rows="23" readonly name="html-content"><%= frontendCode == null ? "" : frontendCode.getHtmlContent() %>                
              </textarea>
            </div>
          </div>
          <div class="css-content p-1">
            <div class="field">
              <div class="pb-1">
                <label>Css</label> 
                <button class="ui compact icon button"
                        type="button" onclick="copyToClipboard('css')">
                  <i class="copy icon"></i>
                </button>
              </div>  
              <textarea id="css-editor" rows="43" readonly name="css-content"><%= frontendCode == null ? "" : frontendCode.getCssContent() %>
              </textarea>
            </div>
          </div>
          <div class="js-content p-1">
            <div class="field">
              <div class="pb-1">
                <label>Js</label> 
                <button class="ui compact icon button"
                        type="button" onclick="copyToClipboard('js')">
                  <i class="copy icon"></i>
                </button>
              </div>
              <textarea id="js-editor" rows="15" readonly name="js-content"><%= frontendCode == null? "" : frontendCode.getJsContent() %>
              </textarea>
            </div>
          </div>
          <div class="test-area p-1 position-relative">
            <div class="pb-1">
              <label>Test</label> 
              <button class="ui compact icon button js-btn-test invisible" 
                      type="button" onclick="testInIframe()">
                <i class="sync icon"></i>
              </button>
            </div>
            <div class="test-code bg-white">
              <iframe src="#1" id="iframe-test" width="100%" height="100%">                                          
              </iframe>           
            </div>  
            
          </div>
          <div class="comment-content p-1">
            <div class="field">
              <label style="padding: 6px;;">Comment</label>
              <textarea rows="12" readonly name="comment"><%= frontendCode == null?"" : frontendCode.getComment() %>
              </textarea>
            </div>
            <div class="d-flex justify-content-between">  
              <button class="ui icon button" type="button" onclick="toggleEditableMode()">
                <i class="edit icon"></i>
              </button>        
              <button class="ui icon button js-btn-save invisible" type="button" onclick="updateSnippet(<%= frontendCode == null? "" : frontendCode.getId() %>)">
                <i class="save icon"></i>
              </button>
            </div>  
          </div>
        </div>
      </div>
    </main>
  </div>
  <script src="/CodeSnippet/libs/jquery-3.7.1.min.js"></script>
  <script src="/CodeSnippet/libs/semantic-ui/semantic.min.js"></script>
  <script src="/CodeSnippet/libs/edit_area/edit_area_full.js"></script>
  
  <script>
    let htmlTextareaId = "html-editor";
    let cssTextareaId = "css-editor";
    let jsTextareaId = "js-editor";
  </script>
  <script><%@ include file="./editor-function.js" %></script>
  <script><%@ include file="./script.js" %></script>
</body>
</html>