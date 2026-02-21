# 🎯 THE ONE - MISSION CONTROL

## ✅ Completed Levels
- **Level 1:** Python script fetching movies from OMDB API
- **Level 2:** FastAPI `/recommend` endpoint with query parameters
- **Level 4:** SQLite database with discard feature
- **Level 4.5:** "Surprise Me" random recommendations with vibe filtering
- **Level 4.6:** "The Redemption Arc" (Un-discard feature)

## Current Mission: Level 5 - The Flutter UI 📱🔥

### Objective
We have a fully functional backend. Now it's time to build the face of "The One". We will build a Flutter app that connects to our FastAPI backend and allows users to swipe through recommendations.

---

## 📋 Challenge Tasks

### 1. Database Layer
Implement a way to remove a specific movie ID from your table. 
- You'll need to write a new function in `database.py`.
- You'll need to figure out the correct SQL command for removing data.
- Make sure the change actually "sticks" to the database file.

### 2. API Layer
Expose this functionality to the world.
- Create a new endpoint in `api.py`.
- You'll need to figure out which HTTP method is most appropriate for "deleting" (Hint: it's not GET or POST).
- You'll need to handle the movie ID in the URL itself (Path Parameters).

### 3. Verification
Prove it works.
1. Discard a movie.
2. Verify it's in the `/discarded/` list.
3. Use your new endpoint to remove it.
4. Verify it's gone from the list and can be recommended again.

---

**Next After 4.6:** Level 5 - The Flutter UI 📱🔥
