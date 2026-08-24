function startWorker(){const x = document.getElementById("result");
    if (typeof(Worker) !== "undefined"){if (typeof(w) == "undefined"){
            w = new Worker("./js/demo_workers.js");};
        w.onmessage = function(event){x.innerHTML = event.data;};}

    else{x.innerHTML = "! Lo siento ¡ Su navegador web no soporta Web Worker";}}

function stopWorker(){w.terminate();
    w = undefined;}
let w;
