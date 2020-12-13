function deleteDiscipline() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину!");
        return;
    }

    var idsSelected = "";
    for (var i = 0; i < items.length; ++i) {
        idsSelected = idsSelected + $(items[i]).attr("value") + ",";
    }

    $("#idsDisc").val(idsSelected);
    // val это значит вставить
    $('#delete-discipline-form').submit();
    // submit это значит отправить
}


function modifyDiscipline() {
    var items = $("input[type=checkbox]:checked")
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину!!!");
        return;
    }

    if (items.length > 1) {
        alert("Пожалуйста, выберите только одну дисциплину!");
        return;
    }

    var idSelected = $(items[0]).attr("value");

    $('#modifyId').val(idSelected);
    $('#discipline-modify-form').submit();
}

function modifyStudent() {
    var items = $("input[type=checkbox]:checked")
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента!!!");
        return;
    }

    if (items.length > 1) {
        alert("Пожалуйста, выберите только одного студента!");
        return;
    }

    var idSelected = $(items[0]).attr("value");

    $('#modifyId').val(idSelected);
    $('#student-modify-form').submit();
}

function deleteStudents() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента!");
        return;
    }

    var idStudentSelected = "";
    for (var i = 0; i < items.length; ++i) {
        idStudentSelected = idStudentSelected + $(items[i]).attr("value") + ",";
    }

    $("#idStudentDisc").val(idStudentSelected);
    $('#delete-students-form').submit();
}

function progressStudent() {
    var items = $("input[type=checkbox]:checked")
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента!!!");
        return;
    }

    if (items.length > 1) {
        alert("Пожалуйста, выберите только одного студента!");
        return;
    }

    var idSelected = $(items[0]).attr("value");

    $('#progressId').val(idSelected);
    $('#student-progress-form').submit();
}



