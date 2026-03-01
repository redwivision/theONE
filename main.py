"""
Level 1: Fetch a Random Movie from OMDB API

Your mission:
1. Load your API key from the .env file
2. Make a request to OMDB to search for a movie
3. Print the movie title, year, and plot

OMDB API Docs: http://www.omdbapi.com/
Example API call: http://www.omdbapi.com/?apikey=YOUR_KEY&t=Inception
"""

import httpx
import os
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv("OMDB_API_KEY")

base_url = "http://www.omdbapi.com/"

def fetch_movie_by_ID(id: str):
    """
    Fetch movie data from OMDB API by id
    
    Parameters you need to send to OMDB:
    - apikey: your API key
    - id: the movie ID (e.g., "tt0068646")
    
    Returns the JSON response from OMDB
    """
    
    params = {"apikey": api_key, "i": id}
    response = httpx.get(base_url, params=params)
    return response.json()



if __name__ == "__main__":
    print("🎬 The One - Level 1: Fetching a movie...\n")
    
    movie_data = fetch_movie_by_ID("tt0068646")
    print(movie_data)
    print("\n✅ If you see movie data above, Level 1 is complete!")
