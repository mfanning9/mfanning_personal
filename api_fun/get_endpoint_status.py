import requests

base_url = "https://github.com/"

response = requests.get(base_url)

print(vars(response).keys()) # Return all atributes of response

print(response, 'Response staus code',response.status_code, 'Request Text',response.text[:20])