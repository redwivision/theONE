# 🎯 THE ONE - MISSION CONTROL

## ✅ Completed Levels
- **Level 1:** Python script fetching movies from OMDB API
- **Level 2:** FastAPI `/recommend` endpoint with query parameters
- **Level 4:** SQLite database with discard feature

## Current Mission: Level 4.5 - "Surprise Me" Feature

### Objective
Add random movie recommendations by vibe, filtered against the discard list.

When done, this endpoint should work:
```
GET /recommend/?vibe=scifi
GET /recommend/?vibe=thriller
GET /recommend/          ← completely random
```

---

## 📋 TODO List

### Part 1: Curated Movie Lists
- [ ] Create a `movies_data.py` file
- [ ] Define a dictionary mapping vibes to lists of IMDB IDs:
```python
VIBE_LISTS = {
    "scifi":    ["tt0133093", "tt0816692", "tt1375666", "tt0470752"],
    "thriller": ["tt0110912", "tt0468569", "tt1375666", "tt0071562"],
    "comedy":   ["tt0118715", "tt0109830", "tt0816692", "tt0245429"],
    "random":   [...]  # mix of everything
}
```
- [ ] Include at least 5-10 movies per vibe

### Part 2: Random Selection Logic
- [ ] Create function `get_random_movie(vibe, discarded_ids)`
  - Get the list for the requested vibe
  - Filter out any movies in `discarded_ids`
  - Pick a random one from what's left
  - Return the IMDB ID
- [ ] Handle edge case: what if all movies in a vibe are discarded?

### Part 3: Fetch Movie Details
- [ ] Note: OMDB search by IMDB ID uses `?i=tt0133093` not `?t=title`
- [ ] Update `fetch_movie_by_title()` or create new `fetch_movie_by_id(imdb_id)`
  - Example: `http://www.omdbapi.com/?apikey=KEY&i=tt0133093`

### Part 4: Update API Endpoint
- [ ] Update `/recommend/` to accept optional `vibe` parameter
- [ ] If `vibe` provided → use curated list
- [ ] If no vibe → pick from full random list
- [ ] Always filter discarded movies before picking
- [ ] Return full movie details from OMDB

### Part 5: Test It
- [ ] `GET /recommend/?vibe=scifi` → returns random sci-fi not discarded
- [ ] Discard all sci-fi movies → endpoint should handle gracefully
- [ ] `GET /recommend/` → returns any random movie

---

## 🔑 Key Concepts

### OMDB Search by IMDB ID
```
http://www.omdbapi.com/?apikey=YOUR_KEY&i=tt0133093
```
Use `&i=` instead of `&t=` to get exact movie by ID.

### Python `random` module
```python
import random
random.choice(["a", "b", "c"])  # picks a random element
```

### List comprehension for filtering
```python
available = [m for m in movie_list if m not in discarded_ids]
```

---

## 🖥️ School Computer Setup

1. `git clone https://github.com/redwivision/theONE.git`
2. `cd theONE`
3. `python3 -m venv venv`
4. `source venv/bin/activate`
5. `pip install -r requirements.txt`
6. `uvicorn api:app --reload`
7. Test: `http://127.0.0.1:8000/discarded/`

> ⚠️ You need a `.env` file with your OMDB key. Create it manually:
> `echo "OMDB_API_KEY=65c5a7d7" > .env`

---

## 📚 Resources
- OMDB API docs: http://www.omdbapi.com/
- Python random module: https://docs.python.org/3/library/random.html
- FastAPI optional params: https://fastapi.tiangolo.com/tutorial/query-params/

---

**Current Status:** Level 4.5 In Progress  
**Backend Endpoints:** `/recommend/` | `/discard/` | `/discarded/`  
**Next After 4.5:** Level 5 (Flutter UI)
