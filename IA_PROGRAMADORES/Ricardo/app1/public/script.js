const form = document.getElementById("prompt-form");
const promptInput = document.getElementById("prompt");
const responseBox = document.getElementById("response");

form.addEventListener("submit", async (event) => {
  event.preventDefault();

  const prompt = promptInput.value.trim();
  if (!prompt) {
    responseBox.textContent = "Escribe una pregunta antes de enviar.";
    return;
  }

  responseBox.textContent = "Generando respuesta...";

  try {
    const response = await fetch("/api/generate", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ prompt }),
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error || "Error desconocido");
    }

    responseBox.textContent = data.answer;
  } catch (error) {
    responseBox.textContent = `Error: ${error.message}`;
  }
});
