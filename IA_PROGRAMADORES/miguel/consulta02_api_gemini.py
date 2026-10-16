from google import genai

client = genai.Client()

while True:
    input_text = input("¿Pregunta a Gemini IA?")
    interaction = client.interactions.create(
        model="gemini-3.5-flash-lite",
        input=input_text
    )
    print(interaction.output_text)
    continuar = input("¿Desea efectuar una nueva consulta a Gemini (S/N)?")
    if continuar.upper() == "S":
        continue
    else:
        print("Fin del programa...")
        break