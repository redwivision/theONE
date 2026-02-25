# 🎯 THE ONE - MISSION CONTROL (LEVEL 5: THE FACE)

## ✅ Completed Phases
- **Levels 1-2:** API & Mastery
- **Level 4:** Persistence Mastery
- **Level 5.1:** The Data Bridge (Connection & Models) ✅

---

## ⚡ Current Mission: Level 5.2 - The Card UI
**Objective:** Stop printing text to the console and start showing real visuals on a phone screen.

### 📋 Level 5.2 Challenge Tasks

#### 1. The Container: `lib/widgets/movie_card.dart`
- Create a reusable widget that takes a `Movie` object.
- **The Design**: It should display:
    - The **Poster** (use `Image.network`).
    - The **Title** (use a large, bold font).
    - The **Year** (subtle text).
- **The Goal**: A clean, premium-looking card.

#### 2. The Bridge to the UI
- In `main.dart`, use your `ApiService` to fetch a movie when the app starts.
- Store the results in a `Movie?` variable.

#### 3. State & Loading
- If the movie is null, show a **Loading Spinner** (`CircularProgressIndicator`).
- If the movie is loaded, show your `MovieCard`.

---

**Current Status:** Level 5.1 Complete | Level 5.2 Preparing  
**Goal:** See a movie poster on your screen.

---

## ☁️ School Work & Cloud Development
If you're at school without the Flutter SDK, use these "Senior Workarounds" to keep coding:

### 1. GitHub Codespaces (Full Power)
- Go to your Repo > Click **"<> Code"** > **"Codespaces"** > **"Create codespace on main"**.
- It opens VS Code in your browser with everything ready.
- **Backend**: Run `pip install -r requirements.txt` and `uvicorn api:app --reload`.
- **Frontend**: You can edit and test Dart logic here.

### 2. Zapp.run (Visual UI Testing)
- Go to [Zapp.run](https://zapp.run/).
- Quickest way to see your `MovieCard` widget without any setup.
- Copy/Paste your `models/` and `api_service.dart` to test logic in the browser.

---

**Next Stop:** Level 5.3 - The Swipe Gestures.
