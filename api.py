from fastapi import FastAPI
import sqlite3
from database import is_movie_discarded, get_discarded_movies as db_get_discarded, discard_movie as db_discard_movie, create_table, remove_from_dicarded as db_remove_from_dicarded
from pydantic import BaseModel
from movies_data import VIBE_LISTS, get_random_movie
from main import fetch_movie_by_ID

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

@app.get("/recommend/vibes")
def get_movie(vibes: str = "random"):
    if vibes not in VIBE_LISTS:
        return {"message": "Vibe not found"}
    
    # Extract just the IDs from the database result tuples [(id, title), ...]
    discarded_list = db_get_discarded(conn)
    discarded_ids = [row[0] for row in discarded_list] if discarded_list else []
    
    movie_id = get_random_movie(vibes, discarded_ids)
    
    if not movie_id:
        return {"message": "No more movies in this vibe! Try another one."}
        
    movie_details = fetch_movie_by_ID(movie_id)
    return {"movie_id": movie_id, "movie_details": movie_details}
    
    

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

@app.delete("/discard/{movie_id}")
def remove_from_dicarded_endpoint(movie_id: str):
    if not is_movie_discarded(conn, movie_id):
        return {"message": "Movie not found in discarded list"}
    else:
        db_remove_from_dicarded(conn, movie_id)
        return {"message": "Movie removed from discarded list successfully"}
