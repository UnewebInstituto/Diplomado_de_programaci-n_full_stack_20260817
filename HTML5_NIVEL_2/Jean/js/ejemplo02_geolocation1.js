function ubicacion (p) {

    const latitud = p.coords.latitude;

    const longitud = p.coords.longitude;

    document.getElementById("resultado").innerHTML="latitud" + latitud + ",Longitud:" + longitud;

}

function error(e){
document.getElementById("resultado").innerHTML= "Error, al obtener la ubicacion";


}


       function mostrar() {
          if(!navigator.geolocation){
                document.getElementById('resultado').innerHTML = "Error, navegador no soporta geolocalización";
            }else{
                navigator.geolocation.getCurrentPosition(ubicacion,error);
                document.getElementById('resultado').innerHTML = "Procesando geolocalizacion"
            }

}
       