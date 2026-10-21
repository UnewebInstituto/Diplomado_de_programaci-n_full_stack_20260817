const form = document.getElementById('chat-form');
const promptInput = document.getElementById('prompt');
const chatLog = document.getElementById('chat-log');
const clearChatButton = document.getElementById('clear-chat');

let conversation = [];

function addMessage(role, content) {
  const message = document.createElement('div');
  message.className = `message ${role}`;
  message.innerHTML = `<strong>${role === 'user' ? 'Tú' : 'Bot'}:</strong> <span>${content}</span>`;
  chatLog.appendChild(message);
  chatLog.scrollTop = chatLog.scrollHeight;
}

function clearChat() {
  conversation = [];
  chatLog.innerHTML = `
    <div class="message bot">
      <strong>Bot:</strong>
      <span>Hola, ¿en qué puedo ayudarte hoy?</span>
    </div>
  `;
}

clearChatButton.addEventListener('click', clearChat);

form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const prompt = promptInput.value.trim();

  if (!prompt) {
    addMessage('bot', 'Escribe una pregunta antes de continuar.');
    return;
  }

  addMessage('user', prompt);
  promptInput.value = '';

  conversation.push({ role: 'user', content: prompt });
  addMessage('bot', 'Pensando...');

  try {
    const response = await fetch('/api/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ prompt, history: conversation })
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error || 'Error al consultar Gemini');
    }

    const lastBotMessage = chatLog.lastElementChild;
    if (lastBotMessage && lastBotMessage.classList.contains('bot')) {
      lastBotMessage.innerHTML = `<strong>Bot:</strong> <span>${data.reply || 'No se obtuvo respuesta.'}</span>`;
    } else {
      addMessage('bot', data.reply || 'No se obtuvo respuesta.');
    }

    conversation.push({ role: 'assistant', content: data.reply || 'No se obtuvo respuesta.' });
  } catch (error) {
    const lastBotMessage = chatLog.lastElementChild;
    if (lastBotMessage && lastBotMessage.classList.contains('bot')) {
      lastBotMessage.innerHTML = `<strong>Bot:</strong> <span>Error: ${error.message}</span>`;
    } else {
      addMessage('bot', `Error: ${error.message}`);
    }
  }
});
