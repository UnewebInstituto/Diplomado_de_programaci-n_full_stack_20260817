    // Fetch Header
    fetch('javascript_clase_5_11_0header.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('js0Header').innerHTML = data;
    })
    .catch(error => console.error('Error loading the header:', error));

    // Fetch Footer
    fetch('javascript_clase_5_11_0footer.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('js0Footer').innerHTML = data;
    })
    .catch(error => console.error('Error loading the footer:', error));