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

# TODO 1: Load environment variables from .env file
# Hint: There's a function in dotenv that does this
load_dotenv()

# TODO 2: Get your API key from the environment
# Hint: Use os.getenv() to read the OMDB_API_KEY variable
api_key = os.getenv("OMDB_API_KEY")

# TODO 3: Define the OMDB API base URL
# The base URL is: http://www.omdbapi.com/
base_url = "http://www.omdbapi.com/"

# TODO 4: Create a function to fetch a movie by title
def fetch_movie_by_title(title: str):
    """
    Fetch movie data from OMDB API by title
    
    Parameters you need to send to OMDB:
    - apikey: your API key
    - t: the movie title (e.g., "Inception")
    
    Returns the JSON response from OMDB
    """
    # TODO 4a: Create a dictionary with your query parameters
    # params = {"apikey": api_key, "t": title} 
    # TODO 4b: Make a GET request using httpx
    # Example: response = httpx.get(base_url, params=params)
    
    # TODO 4c: Return the JSON data
    # Hint: response.json()
    
    params = {"apikey": api_key, "t": title}
    response = httpx.get(base_url, params=params)
    return response.json()


# TODO 5: Test your function
# Call fetch_movie_by_title with a movie you know exists (e.g., "The Matrix")
# Print the result to see what data OMDB returns
if __name__ == "__main__":
    print("🎬 The One - Level 1: Fetching a movie...\n")
    
    # TODO: Call your function here and print the results
    # Example:
    # movie_data = fetch_movie_by_title("The Matrix")
    # print(movie_data)
    movie_data = fetch_movie_by_title("The Godfather")
    print(movie_data)
    print("\n✅ If you see movie data above, Level 1 is complete!")
