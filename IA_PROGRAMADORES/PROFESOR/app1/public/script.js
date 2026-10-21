const promptInput = document.getElementById('prompt');
const sendBtn = document.getElementById('sendBtn');
const resultBox = document.getElementById('result');

sendBtn.addEventListener('click', async () => {
  const prompt = promptInput.value.trim();

  if (!prompt) {
    resultBox.textContent = 'Escribe una pregunta antes de consultar Gemini.';
    return;
  }

  resultBox.textContent = 'Consultando a Gemini...';

  try {
    const response = await fetch('/api/generate', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ prompt })
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error || 'Error al consultar Gemini');
    }

    resultBox.textContent = data.result;
  } catch (error) {
    resultBox.textContent = error.message || 'Hubo un error al consultar Gemini.';
  }
});
