const form = document.getElementById('chat-form');
const promptInput = document.getElementById('prompt');
const messages = document.getElementById('messages');
const sendBtn = document.getElementById('send-btn');

function addMessage(text, type = 'bot') {
  const el = document.createElement('div');
  el.className = `message ${type}`;
  el.textContent = text;
  messages.appendChild(el);
  messages.scrollTop = messages.scrollHeight;
}

form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const prompt = promptInput.value.trim();
  if (!prompt) return;

  addMessage(prompt, 'user');
  promptInput.value = '';

  sendBtn.disabled = true;
  addMessage('Pensando...', 'bot');

  try {
    const response = await fetch('/api/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ prompt }),
    });

    const data = await response.json();

    const lastMessage = messages.lastElementChild;
    if (lastMessage) {
      lastMessage.textContent = data.answer || 'No se obtuvo respuesta.';
    }
  } catch (error) {
    const lastMessage = messages.lastElementChild;
    if (lastMessage) {
      lastMessage.textContent = 'Hubo un error al consultar Gemini.';
    }
    console.error(error);
  } finally {
    sendBtn.disabled = false;
    promptInput.focus();
  }
});
