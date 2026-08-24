function ubicacion(p){const latitud = p.coords.latitude;
    const longitud = p.coords.longitude;
    document.getElementById("resultado").innerHTML = "Latitud: " + latitud + ", Longitud: " + longitud;}

function error(e){document.getElementById("resultado").innerHTML = "Error, al obtener la ubicación";}

function mostrar(){
    if(!navigator.geolocation){
        document.getElementById('resultado').innerHTML = "Error, navegador no soporta geolocalización";}
    else{document.getElementById('resultado').innerHTML = "Procesando geolocalización";
        navigator.geolocation.getCurrentPosition(ubicacion,error);}}