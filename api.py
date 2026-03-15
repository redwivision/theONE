from fastapi import FastAPI, HTTPException
import sqlite3
from database import is_movie_discarded, get_discarded_movies as db_get_discarded, discard_movie as db_discard_movie, create_table, remove_from_discarded as db_remove_from_discarded, get_watchList, add_to_watchList, remove_from_watchList as db_remove_from_watchlist, is_movie_in_watchlist
from pydantic import BaseModel
from movies_data import VIBE_LISTS, get_random_movie
from main import fetch_movie_by_ID

class Movie(BaseModel):
    movie_id: str
    title: str

conn = sqlite3.connect('movies.db', check_same_thread=False)
# Initialize the table when the server starts
create_table(conn, "CREATE TABLE IF NOT EXISTS discards (id TEXT PRIMARY KEY, title TEXT)")
create_table(conn, "CREATE TABLE IF NOT EXISTS watchList (id TEXT PRIMARY KEY, title TEXT)")

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Hello World?"}

@app.get("/recommend/vibes")
def get_movie(vibes: str = "random"):
    discarded_rows = db_get_discarded(conn)
    # Use a set to track discarded IDs and movies picked in this session
    excluded_ids = {row[0] for row in discarded_rows}
    
    movies = []
    retryCount = 0
    while len(movies) < 5:
        movie_id = get_random_movie(vibes, excluded_ids)

        if not movie_id:
            # No more movies available in this vibe
            break
        
        excluded_ids.add(movie_id)
        movie_details = fetch_movie_by_ID(movie_id)
        if movie_details.get("Response") == "True":
            movies.append(
                {
                    "movie_id": movie_id,
                    "details": movie_details
                }
            )
        else:
            retryCount += 1
            if retryCount > 10:
                break
    if not movies:
        raise HTTPException(status_code=404, detail="No more movies in this vibe")
            
    return movies
    

@app.post("/discard/{movie_id}")
def discard_movie_endpoint(movie_id: str):
    if is_movie_discarded(conn, movie_id):
        return {"message": "Movie already discarded"}
    else:
        # Mentor Fix: Fetch the real title from OMDb so the list looks premium!
        details = fetch_movie_by_ID(movie_id)
        title = details.get("Title", f"Unknown ({movie_id})")
        
        db_discard_movie(conn, movie_id, title)
        return {"message": "Movie discarded successfully", "title": title}

@app.get("/discarded/")
def discarded_movies_endpoint():
    return db_get_discarded(conn)

@app.delete("/discard/{movie_id}")
def remove_from_discarded_endpoint(movie_id: str):
    if not is_movie_discarded(conn, movie_id):
        return {"message": "Movie not found in discarded list"}
    else:
        if db_remove_from_discarded(conn, movie_id):
            return {"message": "Movie removed from discarded list successfully"}
        else:
            return {"message": "Failed to remove movie from discarded list"}

@app.post("/watchlist/{movie_id}")
def add_to_watchlist_endpoint(movie_id: str):
    if is_movie_in_watchlist(conn, movie_id):
        return {"message": "Movie already in watchlist"}
    else:
        details = fetch_movie_by_ID(movie_id)
        title = details.get("Title", f"Unknown ({movie_id})")
        add_to_watchList(conn, movie_id, title)
        return {"message": "Movie added to watchlist successfully", "title": title}

@app.get("/watchlist/")
def watchlist_endpoint():
    return get_watchList(conn)

@app.delete("/watchlist/{movie_id}")
def remove_from_watchlist_endpoint(movie_id: str):
    if not is_movie_in_watchlist(conn, movie_id):
        return {"message": "Movie not found in watchlist"}
    else:
        if db_remove_from_watchlist(conn, movie_id):
            return {"message": "Movie removed from watchlist successfully"}
        else:
            return {"message": "Failed to remove movie from watchlist"}