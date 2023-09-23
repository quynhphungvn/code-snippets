function initTextEdit() {
    editAreaLoader.init({
      id: htmlTextareaId	// id of the textarea to transform	
      ,start_highlight: true
      ,allow_toggle: false
      ,language: "en"
      ,syntax: "html"	
      ,toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
      ,syntax_selection_allow: "html"
      ,is_multi_files: true,
      is_editable: false,
      fullscreen: false
      ,EA_load_callback: "initHtmlEditor"
      ,show_line_colors: true,
      save_callback: "saveHtmlSnippet",
    });
    editAreaLoader.init({
      id: cssTextareaId	// id of the textarea to transform	
      ,start_highlight: true
      ,allow_toggle: false
      ,language: "en"
      ,syntax: "css"	
      ,toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
      ,syntax_selection_allow: "css"
      ,is_multi_files: true,
      is_editable: false,
      fullscreen: false
      ,EA_load_callback: "initCssEditor"
      ,show_line_colors: true,
      save_callback: "saveCssSnippet",
    });
    editAreaLoader.init({
      id: jsTextareaId	// id of the textarea to transform	
      ,start_highlight: true
      ,allow_toggle: false
      ,language: "en"
      ,syntax: "js"	
      ,toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
      ,syntax_selection_allow: "js"
      ,is_multi_files: true,
      is_editable: false,
      fullscreen: false
      ,EA_load_callback: "initJsEditor"
      ,show_line_colors: true,
      save_callback: "saveJsSnippet",
    });
  }

function saveHtmlSnippet(textareaId, content){
    alert("Content of '"+ textareaId +"':\n"+content);
}
function saveCssSnippet(textareaId, content){
    alert("Content of '"+ textareaId +"':\n"+content);
}
function saveJsSnippet(textareaId, content){
    alert("Content of '"+ textareaId +"':\n"+content);
}
function initHtmlEditor(textareaId) {
    let htmlFileInfo = {
        id: "html snippet",
        title: "Html",
        text: document.querySelector("textarea[name='html-content'").value,
        syntax: "html"
    }
    editAreaLoader.openFile(textareaId, htmlFileInfo);
}
function initCssEditor(textareaId) {
    let cssFileInfo = {
        id: "css snippet",
        title: "Css",
        text: document.querySelector("textarea[name='css-content'").value,
        syntax: "css"
    }
    editAreaLoader.openFile(textareaId, cssFileInfo);
}
function initJsEditor(textareaId) {
    let jsFileInfo = {
        id: "js snippet",
        title: "Js",
        text: document.querySelector("textarea[name='js-content'").value,
        syntax: "js"
    }
    editAreaLoader.openFile(textareaId, jsFileInfo);
}
function toggleEditable(...textareaIds)
{
    textareaIds.forEach(textareaId => {
        editAreaLoader.execCommand(textareaId, 'set_editable', !editAreaLoader.execCommand(textareaId, 'is_editable'));
    }); 
}

function getEditorContent(textareaId) {
    return editAreaLoader.getValue(textareaId);
}
