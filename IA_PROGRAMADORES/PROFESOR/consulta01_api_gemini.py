from google import genai

client = genai.Client()

interaction = client.interactions.create(
    model="gemini-3.5-flash-lite",
    input="Describe proceso para construir una aplicación de IA basada en RAG"
)
print(interaction.output_text)