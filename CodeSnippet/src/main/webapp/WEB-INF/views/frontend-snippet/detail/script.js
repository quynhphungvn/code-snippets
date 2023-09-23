$(document).ready(function () {
    initTextEdit();
    $('.ui.modal.edit-info').modal();
    initIframeTest();
});
function initIframeTest() {
    let htmlContent = document.querySelector("textarea[name='html-content'").value;
    let cssContent = document.querySelector("textarea[name='css-content'").value;
    let jsContent = document.querySelector("textarea[name='js-content'").value;
    setUiTest(htmlContent, cssContent, jsContent);
}
function showModalEditInfo() {
    $('.ui.modal.edit-info').modal('show');
}

function clearIframeBodyTest(iframeEl) {
    iframeEl.contentWindow.document.querySelector("body").innerHTML = "";
}

function toggleEditableMode() {
    toggleEditable(htmlTextareaId, cssTextareaId, jsTextareaId);
    let commentTextarea = $('textarea[name="comment"]');
    commentTextarea.attr("readonly", !commentTextarea.attr("readonly"));
    let btnTestEl = $('.js-btn-test');
    if (btnTestEl.hasClass("invisible"))
        btnTestEl.removeClass("invisible");
    else btnTestEl.addClass("invisible");
    let btnSaveEl = $('.js-btn-save');
    if (btnSaveEl.hasClass("invisible"))
        btnSaveEl.removeClass("invisible");
    else btnSaveEl.addClass("invisible");
}

function copyToClipboard(snippetType) {
    let content = "";
    switch (snippetType)
    {
        case "html": {
            content = getEditorContent(htmlTextareaId);
            break;
        }
        case "css": {
            content = getEditorContent(cssTextareaId);
            break;
        }
        case "js": {
            content = getEditorContent(jsTextareaId);
            break;
        }
    }
    navigator.clipboard.writeText(content);
}
function testInIframe() {
    let htmlSnippet = getEditorContent(htmlTextareaId)
    let cssSnippet = getEditorContent(cssTextareaId);
    let jsSnippet = getEditorContent(jsTextareaId);
    setUiTest(htmlSnippet, cssSnippet, jsSnippet);
}
function setUiTest(htmlSnippet, cssSnippet, jsSnippet) {
    let iframeEl = document.getElementById("iframe-test");
    clearIframeBodyTest(iframeEl);
    let styleEl = document.createElement("style");
    styleEl.innerHTML = cssSnippet;
    let htmlEl = document.createElement("div");
    htmlEl.innerHTML = htmlSnippet;
    let jsEl = document.createElement("script");
    jsEl.innerHTML = jsSnippet;

    let ifBody = iframeEl.contentWindow.document.querySelector("body");
    ifBody.appendChild(styleEl);
    ifBody.appendChild(htmlEl);
    ifBody.appendChild(jsEl);
}
function updateSnippet(snippetId) {
    let htmlContent = getEditorContent(htmlTextareaId);
    let cssContent = getEditorContent(cssTextareaId);
    let jsContent = getEditorContent(jsTextareaId);
    let commentContent = document.querySelector("textarea[name='comment']").value;
    let options = {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "id=" + encodeURIComponent(snippetId)
            + "&html=" + encodeURIComponent(htmlContent)
            + "&css=" + encodeURIComponent(cssContent)
            + "&js=" + encodeURIComponent(jsContent)
            + "&comment=" + encodeURIComponent(commentContent)
    }

    fetch("/CodeSnippet/frontend/item/update-content", options)
    .then(() => {
        window.location.replace("/CodeSnippet/frontend/item?id=" + snippetId);
    });
}