from google import genai

client = genai.Client(api_key="IGNORARAb8RN6IlFQyjpGgt6gKbWLfo5NQxlTns_4yLf56RQXYju0ikaA")

while True:
    input_text = input("Query")
    response = client.models.generate_content(
        model="gemini-3.8-flash",
        contents=input_text
    )
    print(response.text)
    continuar = input("New Query? (S/N)")
    if continuar.upper() == "S":
        continue
    else:
        print("Closing...")
        break
