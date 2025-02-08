document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenir envío de formulario por defecto

    const form = new FormData(this);
    const responseMessage = document.getElementById('response-message');

    fetch('/send-message', {
        method: 'POST',
        body: form
    })
    .then(response => response.json())
    .then(data => {
        responseMessage.innerHTML = `<p>${data.message}</p>`;
        responseMessage.style.color = 'green';
    })
    .catch(error => {
        responseMessage.innerHTML = `<p>Hubo un error al enviar el mensaje. Intenta de nuevo.</p>`;
        responseMessage.style.color = 'red';
    });
});
