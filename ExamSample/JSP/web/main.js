function fetchData(){
    var id = $('#id').text();
    $.get("/servlet/assets",
        {"id": id},
        function(response){
            results= "<table> <tr> <th> Asset Id </th> <th> User Id </th> <th> Name </th> <th> Description </th> <th> Value </th> </tr>";
            $.each(response, function(index, document){
                results+="<tr>";
                $.each(document, function(key, value){
                    results+="<td>" + value + "</td>";
                });
                results+="</tr>";
            });
            $("#mydata").html(results);
            makeRed();
        })
}

function makeRed(){
    var rows = document.getElementsByTagName('table')[0].rows;
    for (var i=0;i<rows.length;i++){
        if (parseInt(rows[i].lastChild.textContent) >= 10 ){
            rows[i].style.backgroundColor='red';
        }
    }
}

assets=[]

function addOne(){
    let id = parseInt($('#id').text());
    alert(id);
    var name = $('#name').val();
    var description = $('#description').val();
    var value = $('#value').val();
    assets.push({id: 0, userId: id, name: name, description: description, value: value});
    $('#deliver').show();
}

function deliver() {
    let data = JSON.stringify(assets); //make a string
    $.post("/servlet/assets",
        {"data": data},
        function(response){
            fetchData();
            assets = [];
        });
}

$(document).ready(function() {
    fetchData();
    $('#deliver').hide();
    $(document).on('click', '#addOne', addOne);
    $(document).on('click', '#deliver', deliver);
});