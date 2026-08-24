        // geoFindMe Function
        function geoFindMe() {
            status = document.querySelector("#status");
            mapLink = document.querySelector("#map-link");

            mapLink.href = "";
            mapLink.textContent = "";

            function success(position){
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                document.getElementById("resultado").innerHTML = `Latitud: ${latitude} °, Longitud: ${longitude} °`;
                
                status.textContent = "";

                mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
                mapLink.textContent = `Latitud: ${latitude} °, Longitud: ${longitude} °`;
            }
            // - // error Function
            function error(){
                status.textContent = "No es posible obtener la ubicación.";
            }

            // - // Condition IF the browser does not support Geolocation
            if (!navigator.geolocation) {
                status.textContent = "Geolocalicación no es soportada por el navegador.";
            } else {
                status.textContent = "Localizando…";
                navigator.geolocation.getCurrentPosition(success, error);
            }
        }

        //Variables
        var status;
        var mapLink;

        // - // Listener to activate geoFindMe
        document.querySelector("#findme").addEventListener("click", geoFindMe);