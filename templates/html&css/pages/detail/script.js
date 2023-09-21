$(document).ready(function () {
    initTextEdit();
    $('.ui.modal.edit-info').modal();
    let iframeEl = document.getElementById("iframe-test");
    clearIframeBodyTest(iframeEl);
});

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
    let iframeEl = document.getElementById("iframe-test");
    clearIframeBodyTest(iframeEl);
    let htmlSnippet = getEditorContent(htmlTextareaId)
    let cssSnippet = getEditorContent(cssTextareaId);
    let jsSnippet = getEditorContent(jsTextareaId);

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
    let htmlContent = getEditorContent(htmlTextareaId)
    let cssContent = getEditorContent(cssTextareaId);
    let jsContent = getEditorContent(jsTextareaId);
    let commentContent = document.querySelector("textarea[name='comment']").value;

    let data = {
        id: snippetId,
        html: htmlContent,
        css: cssContent,
        js: jsContent,
        comment: commentContent
    }

    let options = {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data
    }

    fetch("snippet/html-css/update", options);
}