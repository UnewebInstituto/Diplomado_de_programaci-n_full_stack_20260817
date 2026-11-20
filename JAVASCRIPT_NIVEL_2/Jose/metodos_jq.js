$('#btnOcultar').click(function() {
    //$('#parrafo').hide();
    //$('#parrafo').hide('slow');
    $('#parrafo').hide(3000);
});

$('#btnMostrar').click(function() {
    //$('#parrafo').show();
    //$('#parrafo').show('slow');
    $('#parrafo').show(3000);
});

$('#btnAlternar').click(function() {
    //$('#parrafo').toggle();
    //$('#parrafo').toggle('slow');
    $('#parrafo').toggle(3000);
});

$('#btnObtener').click(function() {
    var nombre = $('#txtNombre').val();
    alert('Hola, ' + nombre + '!');
    $('#resultadoHtml').html('Hola, <b>' + nombre + '</b>!');
    $('#resultadoText').text('Hola, <b>' + nombre + '</b>!');
});
