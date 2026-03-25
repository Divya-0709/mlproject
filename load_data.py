import pandas as pd
from sqlalchemy import create_engine


import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# ✅ Create connection URL (SAFE way)
connection_url = URL.create(
    "mysql+pymysql",
    username="root",
    password="Saibaba@2025",
    host="localhost",
    port=3306,
    database="taxi_db"
)

# ✅ Create engine
engine = create_engine(connection_url)

# ✅ Load CSV
print("Reading CSV...")
df = pd.read_csv("seeds/yellow_tripdata_2019-01.csv", nrows=500000)

print(f"Loaded {len(df)} rows. Uploading to MySQL...")

# ✅ Upload to MySQL
df.to_sql(
    name="raw_yellow_taxi",
    con=engine,
    if_exists="replace",
    index=False,
    chunksize=5000
)

import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# ✅ Create connection URL (SAFE way)
connection_url = URL.create(
    "mysql+pymysql",
    username="root",
    password="Saibaba@2025",
    host="localhost",
    port=3306,
    database="taxi_db"
)

# ✅ Create engine
engine = create_engine(connection_url)

# ✅ Load CSV
print("Reading CSV...")
df = pd.read_csv("seeds/yellow_tripdata_2019-01.csv", nrows=500000)

print(f"Loaded {len(df)} rows. Uploading to MySQL...")

# ✅ Upload to MySQL
df.to_sql(
    name="raw_yellow_taxi",
    con=engine,
    if_exists="replace",
    index=False,
    chunksize=5000
)

print("Done!")