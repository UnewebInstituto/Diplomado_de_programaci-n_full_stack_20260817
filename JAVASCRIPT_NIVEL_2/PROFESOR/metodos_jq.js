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

let ctrlUno = true;
let ctrlDos = true;
let ctrlTres = true;
$('#btnFadeIn').click(function(){
    if (ctrlUno) {
        $('#caja1').fadeOut();
        ctrlUno = false;
    }else{
        $('#caja1').fadeIn();
        ctrlUno = true;
    }
});
$('#btnFadeOut').click(function(){
    if (ctrlDos) {
        $('#caja2').fadeOut(1000);
        ctrlDos = false;
    }else{
        $('#caja2').fadeIn(1000);
        ctrlDos = true;
    }
});
$('#btnFadeToggle').click(function(){
    if (ctrlTres) {
        $('#caja3').fadeOut(5000);
        ctrlTres = false;
    }else{
        $('#caja3').fadeIn(5000);
        ctrlTres = true;
    }
});

