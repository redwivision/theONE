# 🎯 THE ONE - MISSION CONTROL (LEVEL 5: THE FACE)

## ✅ Completed Phases
- **Levels 1-2:** API & Mastery
- **Level 4:** Persistence Mastery
- **Level 5.1:** The Data Bridge (Connection & Models) ✅
- **Level 5.2:** The Card UI (Premium Design) ✅

---

## ⚡ Current Mission: Level 5.2.5 - The Code Audit
**Why this matters before 5.3**: Level 5.3 requires writing back to the backend (Discard endpoint). If you don't know the backend, you can't debug what breaks.

### 📋 The Audit Checklist

#### 1. Backend Audit (`api.py` + `database.py`)
- **Trace the flow**: How does a request go from your phone → `api.py` → `database.py` → OMDB → back to your phone?
- **Key questions to answer yourself** (no Google, just read the code):
    - What does `@app.get("/recommend/vibes")` actually do line by line?
    - What is `db: sqlite3.Connection = Depends(get_db)` doing in the function signature?
    - What happens if OMDB returns `"Response": "False"`?

#### 2. Flutter Audit (`main.dart` + `api_service.dart`)
- **Trace the flow**: Button tap → `_refresh()` → `ApiService().getMovie()` → JSON → `Movie.fromJson()` → Card renders.
- **Key questions:**
    - Why is `_movieFuture` a `Future<Movie>` and not just a `Movie`?
    - What does `setState()` actually do to the screen?

#### 3. The "One Sentence" Test
For each file, write one sentence in your head (or in `explain.txt`) that answers: *"What is this file's single job?"*

---

## ⏭️ Next Stop: Level 5.3 - The Discard (Swipe)
**After 5.2.5 is done:**
- Wire the "Discard" button to the `/discard` POST endpoint.
- Add a swipe gesture to the MovieCard.
- Display a vibe selector.

---

## ☁️ School Work & Cloud Development
### 1. GitHub Codespaces (Full Power)
- Go to your Repo > Click **"<> Code"** > **"Codespaces"** > **"Create codespace on main"**.
- **Backend**: Run `pip install -r requirements.txt` and `uvicorn api:app --reload`.

### 2. Zapp.run (Visual UI Testing)
- Go to [Zapp.run](https://zapp.run/).
- Copy/Paste your `models/` and `api_service.dart` to test logic in the browser.
