from google import genai

client = genai.Client(api_key="IGNORARAb8RN6IlFQyjpGgt6gKbWLfo5NQxlTns_4yLf56RQXYju0ikaA")

response = client.models.generate_content(
    model="gemini-3.8-flash",
    contents="In a quick, simple response, tell me how many tokens are in this message, and how many tokens are in a 10 word response."
)
print(response.text)