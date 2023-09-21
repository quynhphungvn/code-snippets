$(document).ready(() => {

});
$('.dropdown').dropdown({
    label: {
        duration: 0,
    },
    debug: true,
    performance: true,
});
$('.ui.accordion').accordion();

function showModalAddGroup() {
    $('.ui.modal.add')
        .modal('show')
        ;
}
function showModalEditGroup() {
    $('.ui.modal.edit')
        .modal('show')
        ;
}
function showModalAddSnippet() {
    $('.ui.modal.add-snippet')
        .modal('show')
        ;
}
function deleteGroup(btnEl) {
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
function deleteSnippet(btnEl) {
    if (confirm("Delete '" + btnEl.dataset.snippetName + "'") == true) {
        console.log("OK")
    }
}