let codeTextareaId = "code-editor";
$(document).ready(() => {
    initTextEdit();
});
$('.dropdown').dropdown({
    label: {
        duration: 0,
    },
    debug: true,
    performance: true,
});

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
    if (confirm("Delete UiType " + btnEl.dataset.groupName + "?") == true) {
        alert("Deleted");
    }
}
function deleteCodeSnippet(btnEl) {
    if (confirm("Delete UiType " + btnEl.dataset.groupName + "?") == true) {
        alert("Deleted");
    }
}
function showModalUpdateSnippetInfo(btnEl) {
    $('.ui.modal.edit-ui input[type="hidden"]').val(btnEl.dataset.id)
    $('.ui.modal.edit-ui input[name="name"]').val(btnEl.dataset.snippetName);
    $('.ui.modal.edit-ui textarea').val(btnEl.dataset.snippetDescription);
    $('.ui.modal.edit-ui').modal('show');
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
    let infoTextarea = $('textarea[name="info"]');
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
    let relateInfoContent = document.querySelector("textarea[name='info']").value;
    let commentContent = document.querySelector("textarea[name='comment']").value;
    let syntax = getSyntaxType(codeTextareaId);
    let data = {
        id: encodeURIComponent(codeSnippetId),
        code: encodeURIComponent(codeContent),
        relateInfo: encodeURIComponent(relateInfoContent),
        comment: encodeURIComponent(commentContent),
        syntax: encodeURIComponent(syntax)
    }
    console.log(syntax);
    // let options = {
    //     method: "POST",
    //     headers: {
    //         "Content-Type": "application/x-www-form-urlencoded"
    //     },
    //     body: "id=" + data.id
    //         + "&code=" + data.code
    //         + "&relate-info=" + data.relateInfo
    //         + "&comment=" + data.comment
    // }

    // fetch("snippet/html-css/update", options);
    toggleEditableMode();
}