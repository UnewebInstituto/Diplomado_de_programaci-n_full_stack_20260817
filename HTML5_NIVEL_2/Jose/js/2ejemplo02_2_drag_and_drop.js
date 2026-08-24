function dragStartHandler(ev){
    ev.dataTransfer.setData("text", ev.target.id);
}

function dropHandler(ev){
    ev.preventDefault();
    const data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}

function dragOverHandler(ev){
    ev.preventDefault();
}