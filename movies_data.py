# Curated movie lists by vibe
# Each entry is an IMDB ID — searchable via OMDB with ?i=tt...
import random

VIBE_LISTS = {

    "scifi": [
        "tt0133093",  # The Matrix (1999)
        "tt0816692",  # Interstellar (2014)
        "tt1375666",  # Inception (2010)
        "tt0470752",  # Ex Machina (2014)
        "tt0083658",  # Blade Runner (1982)
        "tt1856101",  # Blade Runner 2049 (2017)
        "tt0076759",  # Star Wars: A New Hope (1977)
        "tt0107290",  # Jurassic Park (1993)
        "tt0367882",  # I Am Legend (2007)
        "tt1454468",  # Gravity (2013)
    ],

    "thriller": [
        "tt0110912",  # Pulp Fiction (1994)
        "tt0114369",  # Se7en (1995)
        "tt0102926",  # The Silence of the Lambs (1991)
        "tt0317248",  # City of God (2002)
        "tt0364569",  # Oldboy (2003)
        "tt0209144",  # Memento (2000)
        "tt1130884",  # Shutter Island (2010)
        "tt0407887",  # The Departed (2006)
        "tt0110413",  # Léon: The Professional (1994)
        "tt2084970",  # The Imitation Game (2014)
    ],

    "comedy": [
        "tt0118715",  # The Big Lebowski (1998)
        "tt0109830",  # Forrest Gump (1994)
        "tt0266543",  # Finding Nemo (2003)
        "tt0435761",  # Toy Story 3 (2010)
        "tt2096673",  # Inside Out (2015)
        "tt0382932",  # Ratatouille (2007)
        "tt0910970",  # WALL-E (2008)
        "tt0114709",  # Toy Story (1995)
        "tt0245429",  # Spirited Away (2001)
        "tt0088763",  # Back to the Future (1985)
    ],

    "drama": [
        "tt0111161",  # The Shawshank Redemption (1994)
        "tt0068646",  # The Godfather (1972)
        "tt0071562",  # The Godfather Part II (1974)
        "tt0108052",  # Schindler's List (1993)
        "tt0050083",  # 12 Angry Men (1957)
        "tt0169547",  # American Beauty (1999)
        "tt0253474",  # The Pianist (2002)
        "tt1832382",  # A Separation (2011)
        "tt0120689",  # The Green Mile (1999)
        "tt0112573",  # Braveheart (1995)
    ],

    "action": [
        "tt0468569",  # The Dark Knight (2008)
        "tt0076759",  # Star Wars: A New Hope (1977)
        "tt0120815",  # Saving Private Ryan (1998)
        "tt0110413",  # Léon: The Professional (1994)
        "tt0103074",  # Terminator 2: Judgment Day (1991)
        "tt0372784",  # Batman Begins (2005)
        "tt0167260",  # LOTR: Return of the King (2003)
        "tt0120737",  # LOTR: Fellowship of the Ring (2001)
        "tt0167261",  # LOTR: The Two Towers (2002)
        "tt0133093",  # The Matrix (1999)
    ],

    "horror": [
        "tt0081505",  # The Shining (1980)
        "tt0073195",  # Jaws (1975)
        "tt0054215",  # Psycho (1960)
        "tt0087182",  # A Nightmare on Elm Street (1984)
        "tt0093773",  # Predator (1987)
        "tt7286456",  # Joker (2019)
        "tt0780504",  # Drive (2011)
        "tt0102926",  # The Silence of the Lambs (1991)
        "tt0364569",  # Oldboy (2003)
        "tt1130884",  # Shutter Island (2010)
    ],

    "romance": [
        "tt0120338",  # Titanic (1997)
        "tt0109830",  # Forrest Gump (1994)
        "tt0097216",  # When Harry Met Sally (1989)
        "tt0245429",  # Spirited Away (2001)
        "tt0910970",  # WALL-E (2008)
        "tt2096673",  # Inside Out (2015)
        "tt0382932",  # Ratatouille (2007)
        "tt0266543",  # Finding Nemo (2003)
        "tt0435761",  # Toy Story 3 (2010)
        "tt1832382",  # A Separation (2011)
    ],

    "mindblown": [
        "tt1375666",  # Inception (2010)
        "tt0133093",  # The Matrix (1999)
        "tt0209144",  # Memento (2000)
        "tt0364569",  # Oldboy (2003)
        "tt0470752",  # Ex Machina (2014)
        "tt0816692",  # Interstellar (2014)
        "tt2084970",  # The Imitation Game (2014)
        "tt1130884",  # Shutter Island (2010)
        "tt0407887",  # The Departed (2006)
        "tt0114369",  # Se7en (1995)
    ],

    "random": [
        "tt0111161",  # The Shawshank Redemption (1994)
        "tt0068646",  # The Godfather (1972)
        "tt0468569",  # The Dark Knight (2008)
        "tt1375666",  # Inception (2010)
        "tt0110912",  # Pulp Fiction (1994)
        "tt0133093",  # The Matrix (1999)
        "tt0816692",  # Interstellar (2014)
        "tt0109830",  # Forrest Gump (1994)
        "tt0050083",  # 12 Angry Men (1957)
        "tt0108052",  # Schindler's List (1993)
        "tt0076759",  # Star Wars: A New Hope (1977)
        "tt0120815",  # Saving Private Ryan (1998)
        "tt0245429",  # Spirited Away (2001)
        "tt0470752",  # Ex Machina (2014)
        "tt0114369",  # Se7en (1995)
    ],
}

def get_random_movie(vibe, discarded_ids):
    """
    Get a random movie ID for the given vibe, excluding discarded movies.
    
    Args:
        vibe: The vibe category (e.g., "scifi", "thriller")
        discarded_ids: Set of discarded movie IDs
        
    Returns:
        Random movie ID string or None if no movies available
    """
    # Get the list of movie IDs for this vibe
    movie_ids = VIBE_LISTS.get(vibe, [])
    
    # Filter out discarded movies
    available_movies = [mid for mid in movie_ids if mid not in discarded_ids]
    
    # If no movies available, return None
    if not available_movies:
        return None
    
    # Return a random movie from the available ones
    return random.choice(available_movies)