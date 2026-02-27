# Curated movie and TV show lists by vibe
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
        # TV Shows
        "tt5705972",  # Dark
        "tt3581920",  # The Last of Us
        "tt2085059",  # Black Mirror
        "tt0475784",  # Westworld
        "tt3230854",  # The Expanse
        "tt11280740", # Severance
        "tt4574334",  # Stranger Things
        "tt2261227",  # Altered Carbon
        "tt2852451",  # Rick and Morty
        "tt8111088",  # The Mandalorian
        # Anime
        "tt0112159",  # Neon Genesis Evangelion
        "tt2560140",  # Sword Art Online
        "tt2098220",  # Psycho-Pass
        "tt5677890",  # Re:Zero
        "tt4508902",  # One Punch Man
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
        # TV Shows
        "tt5290382",  # Mindhunter
        "tt10919420", # Squid Game
        "tt0773262",  # Dexter
        "tt4158110",  # Mr. Robot
        "tt5071412",  # Ozark
        "tt0285331",  # 24
        "tt1474684",  # Luther
        "tt5875444",  # Slow Horses
        "tt6748928",  # You
        "tt1475582",  # Sherlock
        # Anime
        "tt0877079",  # Death Note
        "tt0421063",  # Monster
        "tt2098220",  # Psycho-Pass
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
        # TV Shows
        "tt0108778",  # Friends
        "tt0386676",  # The Office
        "tt2852451",  # Rick and Morty
        "tt10986410", # Ted Lasso
        "tt5687612",  # Fleabag
        "tt5221942",  # The Good Place
        "tt1266020",  # Parks and Recreation
        "tt2467372",  # Brooklyn Nine-Nine
        "tt0098904",  # Seinfeld
        "tt0472954",  # It's Always Sunny in Philadelphia
        # Anime
        "tt0466872",  # Gintama
        "tt0388629",  # One Piece (has plenty of comedy arcs)
        "tt10145574", # Konosuba
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
        # TV Shows
        "tt8162467",  # Chernobyl
        "tt0306414",  # The Wire
        "tt0141842",  # The Sopranos
        "tt0944947",  # Game of Thrones
        "tt0903747",  # Breaking Bad
        "tt7660850",  # Succession
        "tt0804538",  # Mad Men
        "tt4786824",  # The Crown
        "tt3032476",  # Better Call Saul
        "tt2442760",  # Peaky Blinders
        # Anime
        "tt7144274",  # Vinland Saga
        "tt0421063",  # Monster
        "tt0226732",  # Cowboy Bebop
        "tt0274620",  # Hajime no Ippo
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
        # TV Shows
        "tt1190634",  # The Boys
        "tt9288030",  # Reacher
        "tt1839578",  # Person of Interest
        "tt2019451",  # Banshee
        "tt2741602",  # The Blacklist
        "tt5638432",  # Jack Ryan
        "tt3322740",  # Daredevil
        "tt5675620",  # The Punisher
        "tt2193021",  # Arrow
        "tt7221388",  # Cobra Kai
        # Anime
        "tt2560140",  # Sword Art Online (SAO)
        "tt7144078",  # Mob Psycho 100
        "tt5646124",  # My Hero Academia
        "tt10565236", # Demon Slayer: Kimetsu no Yaiba
        "tt3741634",  # Attack on Titan
        "tt0494494",  # Gurren Lagann
        "tt0388629",  # One Piece
        "tt0409591",  # Naruto
        "tt4508902",  # One Punch Man
        "tt0315776",  # Fullmetal Alchemist: Brotherhood
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
        # TV Shows
        "tt1520261",  # The Walking Dead
        "tt6763664",  # The Haunting of Hill House
        "tt1844624",  # American Horror Story
        "tt2243973",  # Hannibal
        "tt2628232",  # Penny Dreadful
        "tt10574558", # Midnight Mass
        "tt11005132", # Yellowjackets
        "tt12921966", # Archive 81
        "tt5473358",  # Channel Zero
        "tt9813792",  # From
        # Anime
        "tt0479005",  # Elfen Lied
        "tt1315888",  # Tokyo Ghoul
        "tt0112159",  # Neon Genesis Evangelion (psychological horror)
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
        # TV Shows
        "tt9059744",  # Normal People
        "tt8740790",  # Bridgerton
        "tt3006802",  # Outlander
        "tt10638068", # Heartstopper
        "tt16253100", # One Day
        "tt7767422",  # Sex Education
        "tt0413573",  # Grey's Anatomy
        "tt9108056",  # Virgin River
        "tt8962124",  # Emily in Paris
        "tt1606375",  # Downton Abbey
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
        # TV Shows
        "tt5705972",  # Dark
        "tt2085059",  # Black Mirror
        "tt11280740", # Severance
        "tt0411008",  # Lost
        "tt2699128",  # The Leftovers
        "tt0098936",  # Twin Peaks
        "tt8134186",  # Devs
        "tt13016376", # 3 Body Problem
        "tt0475784",  # Westworld
        "tt4158110",  # Mr. Robot
        # Anime
        "tt2406750",  # Steins;Gate
        "tt0112159",  # Neon Genesis Evangelion
        "tt0421063",  # Monster
        "tt1966421",  # Fullmetal Alchemist (2003 — thematically heavy)
    ],

    "random": [
        # 20 Movies — Different genres, eras & cultures
        "tt0082096",  # Das Boot (1981) — German WWII submarine
        "tt0095327",  # Grave of the Fireflies (1988) — Animated war tragedy
        "tt1853728",  # Django Unchained (2012) — Tarantino western
        "tt0477348",  # No Country for Old Men (2007) — Coen Bros masterpiece
        "tt0317248",  # City of God (2002) — Brazilian crime epic
        "tt0088763",  # Back to the Future (1985) — Iconic sci-fi comedy
        "tt7286456",  # Joker (2019) — Dark character study
        "tt0105695",  # Unforgiven (1992) — Clint Eastwood western
        "tt0268978",  # A Beautiful Mind (2001) — Biopic drama
        "tt0118715",  # The Big Lebowski (1998) — Cult comedy
        "tt3783958",  # La La Land (2016) — Musical romance
        "tt0993846",  # The Wolf of Wall Street (2013) — Scorsese crime-comedy
        "tt0056592",  # To Kill a Mockingbird (1962) — American classic
        "tt0047478",  # Seven Samurai (1954) — Japanese cinema legend
        "tt0253474",  # The Pianist (2002) — WWII survival drama
        "tt2267998",  # Gone Girl (2014) — Psychological thriller
        "tt0325980",  # Pirates of the Caribbean (2003) — Adventurous fun
        "tt1219289",  # Limitless (2011) — Sci-fi thriller
        "tt4154796",  # Avengers: Endgame (2019) — Epic superhero conclusion
        "tt0096283",  # My Neighbor Totoro (1988) — Ghibli classic
        # 20 TV Shows — Diverse styles & tones
        "tt2356777",  # True Detective (Season 1) — Crime anthology
        "tt2707408",  # Narcos — Colombian drug war
        "tt3398228",  # BoJack Horseman — Animated existential comedy
        "tt10048342", # The Queen's Gambit — Chess prodigy miniseries
        "tt5387792",  # Lucifer — Supernatural crime comedy
        "tt3581920",  # The Last of Us — Post-apocalyptic masterpiece
        "tt0455275",  # Prison Break — Escape thriller
        "tt1856010",  # House of Cards — Political chess game
        "tt4270492",  # Billions — Finance power struggle
        "tt2149175",  # The Americans — Cold War spy drama
        "tt0460681",  # Supernatural — Long-running cult horror
        "tt5290382",  # Mindhunter — FBI serial killer profiling
        "tt3322740",  # Daredevil — Dark Marvel street-level action
        "tt3566834",  # Master of None — Aziz Ansari's indie gem
        "tt6468322",  # Money Heist (La Casa de Papel) — Spanish heist drama
        "tt5705972",  # Dark — German time-loop sci-fi
        "tt0096697",  # The Simpsons — Cultural institution
        "tt2085059",  # Black Mirror — Tech horror anthology
        "tt7660850",  # Succession — Family power drama
        "tt14452776", # The Bear — High-intensity kitchen drama
    ],

    "mindgame": [
        "tt0482571",  # The Prestige (2006)
        "tt2267998",  # Gone Girl (2014)
        "tt0454848",  # Inside Man (2006)
        "tt0240772",  # Ocean's Eleven (2001)
        "tt0137523",  # Fight Club (1999)
        "tt3460252",  # The Hateful Eight (2015)
        "tt0114814",  # The Usual Suspects (1995)
        "tt0264044",  # Catch Me If You Can (2002)
        "tt6751668",  # Parasite (2019)
        "tt8946378",  # Knives Out (2019)
        "tt0119174",  # The Game (1997)
        "tt0117381",  # Primal Fear (1996)
        "tt0488120",  # Fracture (2007)
        "tt0123755",  # Cube (1997)
        "tt1127015",  # Exam (2009)
        "tt1130884",  # Shutter Island (2010)
        "tt0209144",  # Memento (2000)
        "tt0361862",  # The Machinist (2004)
        "tt0443543",  # The Illusionist (2006)
        "tt0120768",  # The Negotiator (1998)
        # TV Shows
        "tt0877079",  # Death Note
        "tt10795658", # Alice in Borderland
        "tt10919420", # Squid Game
        "tt6468322",  # Money Heist
        "tt1475582",  # Sherlock
        "tt10048342", # The Queen's Gambit
        "tt0455275",  # Prison Break
        "tt7016922",  # Killing Eve
        "tt4158110",  # Mr. Robot
        "tt3032476",  # Better Call Saul
        "tt2243973",  # Hannibal
        "tt4270492",  # Billions
        "tt2149175",  # The Americans
        "tt1796960",  # Homeland
        "tt1856010",  # House of Cards
        "tt1196946",  # The Mentalist
        "tt7660856",  # Succession
        "tt1399664",  # The Night Manager
        "tt1632701",  # Suits
        "tt15671580", # Slow Horses
        # Anime
        "tt0877079",  # Death Note (already above, anchor)
        "tt0475565",  # Code Geass
        "tt2406750",  # Steins;Gate
        "tt2098220",  # Psycho-Pass
        "tt5677890",  # Re:Zero
    ],

    "masterpiece": [
        "tt0111161",  # The Shawshank Redemption (1994)
        "tt0068646",  # The Godfather (1972)
        "tt0468569",  # The Dark Knight (2008)
        "tt0108052",  # Schindler's List (1993)
        "tt0050083",  # 12 Angry Men (1957)
        "tt0071562",  # The Godfather Part II (1974)
        "tt0167260",  # LOTR: The Return of the King (2003)
        "tt0110912",  # Pulp Fiction (1994)
        "tt0060196",  # The Good, the Bad and the Ugly (1966)
        "tt0109830",  # Forrest Gump (1994)
        "tt0137523",  # Fight Club (1999)
        "tt1375666",  # Inception (2010)
        "tt0080684",  # Star Wars: Episode V - The Empire Strikes Back (1980)
        "tt0133093",  # The Matrix (1999)
        "tt0099685",  # Goodfellas (1990)
        "tt0073486",  # One Flew Over the Cuckoo's Nest (1975)
        "tt0114369",  # Se7en (1995)
        "tt0047478",  # Seven Samurai (1954)
        "tt0038650",  # It's a Wonderful Life (1946)
        "tt0102926",  # The Silence of the Lambs (1991)
        # TV Shows
        "tt0903747",  # Breaking Bad
        "tt0306414",  # The Wire
        "tt0141842",  # The Sopranos
        "tt0944947",  # Game of Thrones
        "tt8162467",  # Chernobyl
        "tt0417299",  # Avatar: The Last Airbender
        "tt1475582",  # Sherlock
        "tt7660850",  # Succession
        "tt0386676",  # The Office
        "tt3032476",  # Better Call Saul
        "tt0804538",  # Mad Men
        "tt3398228",  # BoJack Horseman
        "tt5687612",  # Fleabag
        "tt2699128",  # The Leftovers
        "tt0098936",  # Twin Peaks
        "tt0185906",  # Band of Brothers
        "tt0303461",  # Firefly
        "tt10986410", # Ted Lasso
        "tt14452776", # The Bear
        "tt5705972",  # Dark
        # Anime
        "tt0315776",  # Fullmetal Alchemist: Brotherhood
        "tt0226732",  # Cowboy Bebop
        "tt7144274",  # Vinland Saga
        "tt2406750",  # Steins;Gate
        "tt0421063",  # Monster
        "tt3741634",  # Attack on Titan
    ],

    "anime": [
        # The 40 Greatest Anime of All Time
        "tt0315776",  # Fullmetal Alchemist: Brotherhood
        "tt0877079",  # Death Note
        "tt3741634",  # Attack on Titan (Shingeki no Kyojin)
        "tt0226732",  # Cowboy Bebop
        "tt0112159",  # Neon Genesis Evangelion
        "tt2406750",  # Steins;Gate
        "tt7144274",  # Vinland Saga
        "tt0421063",  # Monster
        "tt2098220",  # Psycho-Pass
        "tt4508902",  # One Punch Man
        "tt0475565",  # Code Geass
        "tt7144078",  # Mob Psycho 100
        "tt5677890",  # Re:Zero - Starting Life in Another World
        "tt0274620",  # Hajime no Ippo
        "tt0494494",  # Gurren Lagann (Tengen Toppa)
        "tt0388629",  # One Piece
        "tt5646124",  # My Hero Academia
        "tt10565236", # Demon Slayer: Kimetsu no Yaiba
        "tt0409591",  # Naruto
        "tt1315888",  # Tokyo Ghoul
        "tt0266806",  # Samurai Champloo
        "tt0210234",  # Hunter x Hunter
        "tt0318842",  # Bleach
        "tt0479005",  # Elfen Lied
        "tt1966421",  # Fullmetal Alchemist (2003)
        "tt1555149",  # Black Clover
        "tt5923370",  # Dororo
        "tt0245429",  # Spirited Away (film)
        "tt0347149",  # Howl's Moving Castle (film)
        "tt0087781",  # Nausicaa of the Valley of Wind (film)
        "tt3741634",  # AoT Season 1 (same ID, different seasons on platform)
        "tt2085059",  # (placeholder — skip if already seen)
        "tt0466872",  # Gintama
        "tt10145574", # Konosuba
        "tt5923054",  # Made in Abyss
        "tt6586546",  # JoJo's Bizarre Adventure
        "tt5646124",  # MHA Season 1
        "tt2098220",  # Psycho-Pass Season 2
        "tt0364204",  # Basilisk
        "tt0278237",  # InuYasha
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