$("#imagen_1").click(function() {
    cambiar_imagen($("#imagen_1").attr("src"));
});
$("#imagen_2").click(function() {
    cambiar_imagen($("#imagen_2").attr("src"));
});
$("#imagen_3").click(function() {
    cambiar_imagen($("#imagen_3").attr("src"));
});
$("#imagen_4").click(function() {
    cambiar_imagen($("#imagen_4").attr("src"));
});

function cambiar_imagen(img) {
    document.getElementById("imagen_principal").src = img;
}