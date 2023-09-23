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
    $('.ui.modal.add-group')
        .modal('show')
        ;
}
function showModalEditGroup() {
    $('.ui.modal.edit-group')
        .modal('show')
        ;
}
function showModalAddSnippet() {
    $('.ui.modal.add-snippet')
        .modal('show')
        ;
}
function deleteGroup(btnEl) {
    if (confirm("Delete Group: '" + btnEl.dataset.groupName + "' ?") == true) {      
        let url = "/CodeSnippet/frontend/list/group/delete"
        let options = {
            method: "POST",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: "selected-group-id=" + btnEl.dataset.groupId
        }
        fetch(url, options)
        .then(()=> {
            window.location.replace("/CodeSnippet/frontend/list");
        });
    }
}
function showModalUpdateSnippetInfo(btnEl) {
    let feCodeId = btnEl.dataset.id;
    let uiInfoEl = document.querySelector(".uiinfo[data-id='" + feCodeId +"']");
    let nameEl = uiInfoEl.querySelector("h3.name");
    let descriptionEl = uiInfoEl.querySelector("p.description");
    $('.ui.modal.edit-ui input[type="hidden"][name="id"]').val(feCodeId);
    $('.ui.modal.edit-ui input[name="name"]').val(nameEl.textContent);
    $('.ui.modal.edit-ui textarea').val(descriptionEl.textContent);
    $('.ui.modal.edit-ui').modal('show');
}
function deleteFrontendCodeSnippet(btnEl) {
    if (confirm("Delete Group: '" + btnEl.dataset.name + "' ?") == true) {      
        let url = "/CodeSnippet/frontend/list/code/delete"
        let options = {
            method: "POST",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: "selected-group-id=" + btnEl.dataset.groupId
                    + "&id=" + btnEl.dataset.id
        }
        fetch(url, options)
        .then(()=> {
            window.location.replace("/CodeSnippet/frontend/list?selected-group-id=" + btnEl.dataset.groupId);
        });
    }
}