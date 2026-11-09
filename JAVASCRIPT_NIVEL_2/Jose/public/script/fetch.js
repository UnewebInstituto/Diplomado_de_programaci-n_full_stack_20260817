    // Fetch Header
    fetch('header.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('js0Header').innerHTML = data;
    })
    .catch(error => console.error('Error loading the header:', error));

    // Fetch Footer
    fetch('footer.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('js0Footer').innerHTML = data;
    })
    .catch(error => console.error('Error loading the footer:', error));