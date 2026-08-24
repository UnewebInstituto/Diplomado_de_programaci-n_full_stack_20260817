// Declaración de funciones
function startWorker(){
    const x = document.getElementById("result");
    // Verificación de si el navegador soporta web worker
    if (typeof(Worker) !== "undefined"){
        // Si el Worker no existe lo crea a partir del
        // código javascript "./js/demo_workers.js"
        if (typeof(w) == "undefined"){
            //w = new Worker("./js/demo_workers.js");
            w = new Worker("./js/demo_worker.js");
        };
        // Inmendiatamente después muestra en panatalla
        // los resultados que arroja la ejecución del Worker
        w.onmessage = function(event){
            x.innerHTML = event.data;
        };
    }else{
        x.innerHTML = "! Lo siento ¡ Su navegador web no soporta Web Worker";
    }
}

function stopWorker(){
    w.terminate();
    w = undefined;
}

// Definición de variable
let w;
