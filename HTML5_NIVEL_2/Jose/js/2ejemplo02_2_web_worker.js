let w;
function startworker(){
    const x = document.getElementById("result");
    if (typeof(Worker) !== "undefined"){
        if (typeof(w) == "undefined"){
            w = new Worker("./js/demo_workers.js");
        }
        //
        w.onmessage = function(event){
            x.innerHTML = event.data;
        };
    }else{
        x.innerHTML = "Web Worker not supported.";
    }
}
function stopworker(){
    w.terminate();
    w = undefined;
}