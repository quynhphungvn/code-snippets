let codeTextareaId = "code-editor";
$(document).ready(() => {
    initTextEdit();
	$('.dropdown').dropdown({
	    label: {
	        duration: 0,
	    },
	    debug: true,
	    performance: true,
	});
});

function selectTechnology() {
	let techId = document.querySelector("select[name='select-tech']").value;
	console.log(techId);
	if (techId)
		window.location.href = "/CodeSnippet/view/code?tid=" + techId;
}
function showModalAddGroup() {
    $('.ui.modal.add-group')
        .modal('show')
        ;
}
function showModalEditGroup() {
    $('.ui.modal.edit-group')
        .modal('show')
        ;
}
function showModalEditCodeSnippet() {
    $('.ui.modal.edit-snippet')
        .modal('show')
        ;
}
function showModalAddCodeSnippet() {
    $('.ui.modal.add-snippet')
        .modal('show')
        ;
}
function deleteGroup(btnEl) {
    if (confirm("Delete Group: " + btnEl.dataset.name + "?") == true) {
       let options = {
    	 method: "POST",
         headers: {
             "Content-Type": "application/x-www-form-urlencoded"
         },
         body: "gid=" + btnEl.dataset.gid
	   	}
	    fetch("/CodeSnippet/view/group/delete", options)
		.then(() => {
			window.location.replace("/CodeSnippet/view/code?tid=" + btnEl.dataset.tid);
		}); 
    }
}
function deleteCodeSnippet(btnEl) {
    if (confirm("Delete CodeSnippet: " + btnEl.dataset.name + "?") == true) {
       let options = {
    	 method: "POST",
         headers: {
             "Content-Type": "application/x-www-form-urlencoded"
         },
         body: "cid=" + btnEl.dataset.cid
	   	}
	    fetch("/CodeSnippet/view/code/delete", options)
		.then(() => {
			window.location.replace("/CodeSnippet/view/code?gid=" + btnEl.dataset.gid)
		}); 
    }
}

// Editor
function copyCodeToClipboard() {
    let content = getEditorContent(codeTextareaId);
    navigator.clipboard.writeText(content);
}
function toggleEditableMode() {
    toggleEditable(codeTextareaId);
    let commentTextarea = $('textarea[name="comment"]');
    commentTextarea.attr("readonly", !commentTextarea.attr("readonly"));
    let infoTextarea = $('textarea[name="relevant-info"]');
    infoTextarea.attr("readonly", !infoTextarea.attr("readonly"));
    let btnEditEl = $('.js-btn-edit');
    if (btnEditEl.hasClass("d-none"))
        btnEditEl.removeClass("d-none");
    else btnEditEl.addClass("d-none");
    let btnSaveEl = $('.js-btn-save');
    if (btnSaveEl.hasClass("d-none"))
        btnSaveEl.removeClass("d-none");
    else btnSaveEl.addClass("d-none");
    let contentWrapperEl = $('.content-wrapper');
    if (contentWrapperEl.hasClass("bg-success"))
        contentWrapperEl.removeClass("bg-success");
    else contentWrapperEl.addClass("bg-success");
}

function updateCodeSnippet(codeSnippetId) {
    let codeContent = getEditorContent(codeTextareaId)
    let relevantInfo = document.querySelector("textarea[name='relevant-info']").value;
    let commentContent = document.querySelector("textarea[name='comment']").value;
    let syntax = getSyntaxType(codeTextareaId);
    let data = {
        cId: encodeURIComponent(codeSnippetId),
        content: encodeURIComponent(codeContent),
        relevantInfo: encodeURIComponent(relevantInfo),
        comment: encodeURIComponent(commentContent),
        syntax: encodeURIComponent(syntax)
    }
    let options = {
    	 method: "POST",
         headers: {
             "Content-Type": "application/x-www-form-urlencoded"
         },
         body: "cid=" + data.cId
             + "&content=" + data.content
             + "&relevant-info=" + data.relevantInfo
             + "&comment=" + data.comment
			 + "&syntax=" + data.syntax
   }
    fetch("/CodeSnippet/view/code/update-content", options)
	.then(() => {
		window.location.replace("/CodeSnippet/view/code?cid=" + codeSnippetId)
	});
    toggleEditableMode();
}
