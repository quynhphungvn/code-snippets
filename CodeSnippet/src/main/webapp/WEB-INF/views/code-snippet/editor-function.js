function initTextEdit() {
	editAreaLoader.init({
		id: codeTextareaId	// id of the textarea to transform	
		, start_highlight: true,
		font_size: 8
		, allow_toggle: false
		, language: "en"
		, syntax: "java"
		, toolbar: "search, go_to_line, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
		, syntax_selection_allow: "java,css,html,js,php,python,vb,xml,c,cpp,sql,basic,pas"
		, is_multi_files: true,
		is_editable: false
		, EA_load_callback: "initCodeEditor"
		, show_line_colors: true
	});
}
function initCodeEditor(editorId) {
	if (editorId == codeTextareaId) {
		let textareaEl = document.querySelector("#" + codeTextareaId);
		let fileInfo = {
			id: 1,
			title: textareaEl.dataset.name,
			text: textareaEl.dataset.content,
			syntax: textareaEl.dataset.syntax
		}
		editAreaLoader.openFile(codeTextareaId, fileInfo);
	}
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
