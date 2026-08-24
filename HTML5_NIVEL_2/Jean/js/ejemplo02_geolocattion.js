  // Declaración de funciones
        function geoFindMe() {
            status = document.querySelector("#status");
            maplink = document.querySelector("#map-link");

            maplink.href = "";
            maplink.textContent = "";

            function success(position){
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                document.getElementById("resultado").innerHTML = `Latitud : ${latitude} °, Longitud : ${longitude} °`;

                status.textContent = "";

                maplink.href = `https://openstreetmap.org/#map=18/${latitude}/${longitude}`;

                maplink.textContent = `Latitud : ${latitude} °, Longitud : ${longitude} °`;

            }

            function error() {
                status.textContent = "No es posible obtener la ubicación.";
            }

            // Verificar si el navegador soporta la geolocalización
            if (!navigator.geolocation){
                status.textContent = "Geolocalización no es soportada por su navegador.";
            }else{
                status.textContent = "Determinando ubicación...";
                navigator.geolocation.getCurrentPosition(success, error);
            }
        }

        // Declaración de variables
        var status;
        var maplink;

        // Cuerpo principal del programa
        /**
         * Ubicar dentro del html, el selector (etiqueta), cuyo nombre
         * es "find-me", le añade el evento click, que al ser detectado
         * llama a la función "geoFindMe"
        */
        document.querySelector("#find-me").addEventListener("click",geoFindMe);