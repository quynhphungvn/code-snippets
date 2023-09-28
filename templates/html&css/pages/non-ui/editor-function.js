function initTextEdit() {
    editAreaLoader.init({
      id: codeTextareaId	// id of the textarea to transform	
      ,start_highlight: true,
      font_size: 8
      ,allow_toggle: false
      ,language: "en"
      ,syntax: "java"	
      ,toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
      ,syntax_selection_allow: "java,css,html,js,php,python,vb,xml,c,cpp,sql,basic,pas"
      ,is_multi_files: false,
      is_editable: false,
      fullscreen: false
      ,EA_load_callback: "initCodeEditor"
      ,show_line_colors: true,
      save_callback: "saveHtmlSnippet",
    });
  }

function initCodeEditor(textareaId) {
    let fileInfo = {
        id: "1",
        title: "java",
        text: javaCode,
        syntax: "java"
    }
    editAreaLoader.openFile(textareaId, fileInfo);
}
function toggleEditable(textareaId) {
    editAreaLoader.execCommand(textareaId, 'set_editable', !editAreaLoader.execCommand(textareaId, 'is_editable'));
}

function getEditorContent(textareaId) {
    return editAreaLoader.getValue(textareaId);
}

function getSyntaxType(textareaId) {
    let fileInfo = editAreaLoader.getCurrentFile(textareaId);
    return fileInfo.syntax;
}
