import pandas as pd
import http.client
import datetime

conn = http.client.HTTPSConnection("weatherapi-com.p.rapidapi.com")

headers = {
    'X-RapidAPI-Key': "ba328159ecmsh31f65206c5ab959p1a3f80jsnb80160476df3",
    'X-RapidAPI-Host': "weatherapi-com.p.rapidapi.com"
    }

def api_get(x):
    """Calls the API with the x being the column, in our case the ZIP, as the query.

    Args:
        x (int): ZIP code

    Returns:
        dict: A dictionary with the results
    """
    conn.request("GET", f"/current.json?q={x}", headers=headers)
    return conn.getresponse().read().decode('utf-8')

top100 = pd.read_csv('Top100-US.csv', sep=';')
top100['created_at'] = datetime.datetime.now()
top100['weather'] = top100.Zip.apply(lambda x: api_get(x))

print(top100.head(5))