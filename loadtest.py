import requests

for i in range(1000):
    print("hitting ", i+1)
    requests.get("http://127.0.0.1:49940/")