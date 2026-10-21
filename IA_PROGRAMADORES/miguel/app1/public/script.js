const form = document.getElementById('chat-form');
const promptInput = document.getElementById('prompt');
const responseBox = document.getElementById('response');
const sendBtn = document.getElementById('send-btn');

form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const prompt = promptInput.value.trim();
  if (!prompt) {
    responseBox.textContent = 'Escribe una pregunta antes de enviar.';
    return;
  }

  sendBtn.disabled = true;
  sendBtn.textContent = 'Enviando...';
  responseBox.textContent = 'Consultando a Gemini...';

  try {
    const response = await fetch('/api/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ prompt }),
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error || 'Hubo un error al consultar Gemini.');
    }

    responseBox.textContent = data.text;
  } catch (error) {
    responseBox.textContent = error.message || 'Ocurrió un error inesperado.';
  } finally {
    sendBtn.disabled = false;
    sendBtn.textContent = 'Enviar';
  }
});
