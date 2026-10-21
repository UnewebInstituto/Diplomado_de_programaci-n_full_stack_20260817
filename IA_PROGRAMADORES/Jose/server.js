// 1. Load the secret key from the .env file into process.env
require("dotenv").config();

const express = require("express");
const path = require("path");
const { GoogleGenAI } = require("@google/genai");

const app = express();
const PORT = 3012;

// Change this if your class asks for a different Gemini model
const MODEL = "gemini-3.5-flash-lite";

// 2. Create the Gemini client using the key stored in .env
//    (the .env line should look like: GEMINI_API_KEY=your_key_here)
const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

// 3. Let the server read JSON sent by the browser
app.use(express.json());

// 4. Serve the web page files (index.html, style.css, script.js)
//    They live in the "public" folder so that .env is never exposed.
app.use(express.static(path.join(__dirname, "public")));

// 5. The /chat endpoint: receives a message, asks Gemini, returns the answer
app.post("/chat", async (req, res) => {
  const message = req.body.message;

  // Reject empty or missing messages
  if (!message || !message.trim()) {
    return res.status(400).json({ error: "Message is empty." });
  }

  try {
    const response = await ai.models.generateContent({
      model: MODEL,
      contents: message,
    });

    res.json({ reply: response.text });
  } catch (error) {
    console.error("Gemini error:", error.message);
    res.status(500).json({ error: "Could not get a response from Gemini." });
  }
});

// 6. Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
