// Grab the page elements we need
const form = document.getElementById("chat-form");
const input = document.getElementById("user-input");
const responseText = document.getElementById("response-text");

// Runs when the user presses Enter in the input bar
form.addEventListener("submit", async (event) => {
  event.preventDefault(); // stop the page from reloading

  const message = input.value.trim();
  if (!message) return; // ignore empty messages

  responseText.textContent = "Thinking...";
  input.value = "";
  input.disabled = true; // prevent sending twice while waiting

  try {
    // Send the message to our server's /chat endpoint
    const res = await fetch("/chat", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message }),
    });

    const data = await res.json();

    if (!res.ok) {
      responseText.textContent = data.error || "Something went wrong.";
    } else {
      responseText.textContent = data.reply;
    }
  } catch (error) {
    responseText.textContent = "Could not reach the server.";
  } finally {
    input.disabled = false;
    input.focus();
  }
});
