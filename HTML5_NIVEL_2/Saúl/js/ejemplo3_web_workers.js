    //Definición de variable//

    let w;    
    //Declaración de funciones//

    function startWorker(){
        const x = document.getElementById("result");
        if(typeof(Worker) !=="undefined"){
            //si el worker no existe, lo crea a partir del código JavaScript
            if(typeof(w) == "undefined"){
                w = new Worker ("./js/demo_worker.js");
            };
            //Inmediatamente muestra en pantalla los resultados de la ejecución del worker
            w.onmessage = function(event){
                x.innerHTML = event.data;
            }
        }else{
            x.innerHTML = "¡Lo siento su navegador no soporta Web worker!"
        }
    }
    function stopWorker(){
        w.terminate();
        w = undefined;
    }