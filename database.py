import sqlite3

con = sqlite3.connect("movies.db")
cur = con.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS movies (
      id INTEGER PRIMARY KEY,
      title TEXT, 
      year INTEGER, 
      plot TEXT)
""")

cur.execute("INSERT INTO movies (title, year, plot) VALUES ('The Matrix', 1999, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.')")

cur.execute("SELECT * FROM movies")

rows = cur.fetchall()

print(rows)

con.commit()
con.close()
