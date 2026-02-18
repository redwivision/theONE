from fastapi import FastAPI
from main import fetch_movie_by_title
import sqlite3
from database import is_movie_discarded, get_discarded_movies as db_get_discarded, discard_movie as db_discard_movie, create_table
from pydantic import BaseModel

class Movie(BaseModel):
    movie_id: str
    title: str

conn = sqlite3.connect('movies.db', check_same_thread=False)
# Initialize the table when the server starts
create_table(conn, "CREATE TABLE IF NOT EXISTS discarded_movies (id TEXT PRIMARY KEY, title TEXT)")
app = FastAPI()


@app.get("/")
def home():
    return {"message": "Hello World?"}

@app.get("/recommend/")
def get_movie(title: str):
    return fetch_movie_by_title(title=title)

@app.post("/discard/")
def discard_movie_endpoint(movie: Movie):
    if is_movie_discarded(conn, movie_id=movie.movie_id):
        return {"message": "Movie already discarded"}
    else:
        db_discard_movie(conn, movie.movie_id, movie.title)
        return {"message": "Movie discarded successfully"}

@app.get("/discarded/")
def discarded_movies_endpoint():
    return db_get_discarded(conn)