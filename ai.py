# vector DB
import os
from getpass import getpass
import kdbai_client as kdbai
import time
import numpy as np
import pandas as pd

KDBAI_ENDPOINT = (
    os.environ["KDBAI_ENDPOINT"]
    if "KDBAI_ENDPOINT" in os.environ
    else input("KDB.AI endpoint: ")
)
KDBAI_API_KEY = (
    os.environ["KDBAI_API_KEY"]
    if "KDBAI_API_KEY" in os.environ
    else getpass("KDB.AI API key: ")
)

session = kdbai.Session(api_key=KDBAI_API_KEY, endpoint=KDBAI_ENDPOINT)

# ensure no table called "data" exists
try:
    session.table("data").drop()
    time.sleep(5)
except kdbai.KDBAIException:
    pass
session.list()

?session.create_table

schema = {
    "columns": [
        {"name": "id", "pytype": "str"},
        {"name": "vectors", "vectorIndex": {"dims": 8, "metric": "L2", "type": "flat"}},
    ]
}

table = session.create_table("data", schema)

# Create a NumPy array of 5 eight-dimensional float32 arrays
vectors = np.array(
    [
        [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8],
        [0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9],
        [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
        [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1],
        [0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1, 0.2],
    ],
    dtype=np.float32,
)
# Example ID values
ids = ["h", "e", "l", "l", "o"]
# column names/types matching the schema
embeddings = pd.DataFrame({"id": ids, "vectors": list(vectors)})

table.insert(embeddings)

table.search(vectors=[[0.1, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]], n=3)[0]
