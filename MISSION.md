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

**Next Stop:** Level 5.3 - The Swipe Gestures.
