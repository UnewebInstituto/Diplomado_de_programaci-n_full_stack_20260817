from google import genai

client = genai.Client()

interaction = client.interactions.create(
    model="gemini-3.5-flash-lite",
    input="Describe proceso para generar o para construir una aplicacion de IA basada en RAG"
)
print(interaction.output_text)