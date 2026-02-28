# 🎯 THE ONE - MISSION CONTROL (LEVEL 5: THE FACE)

## ✅ Completed Phases
- **Level 5.1:** The Data Bridge (Connection & Models) ✅
- **Level 5.2:** The Card UI (Premium Design) ✅
- **Level 5.2.5:** The Code Audit (Deep Understanding) ✅

---

## ⚡ Current Mission: Level 5.3 - The Discard (Swipe)
**The Goal**: Make the app interactive. Swipe to tell the backend "I don't like this," and have it remember your choice forever.

### 📋 Level 5.3 Challenge Tasks (Manual)

#### 1. The API Handshake (`api_service.dart`)
- **Task**: Add a new function `Future<void> discardMovie(String movieId)`.
- **The Logic**: 
    - Use `http.post` to hit your backend endpoint: `http://<YOUR_IP>:8000/discard/<movieId>`.
    - Handle the response (check for `statusCode == 200`).
- **Mentor Tip**: This is your first **POST** request in Flutter. It's how you "write" data to the server instead of just reading it.

#### 2. The Swipe Gesture (`main.dart`)
- **Task**: Wrap your `MovieCard` inside a `Dismissible` widget.
- **The Setup**:
    - `key`: Needs a `Key(movie.id)`.
    - `onDismissed`: This is the function that runs after the swipe is finished.
- **The Action**:
    - Call `apiService.discardMovie(movie.id)` inside `onDismissed`.
    - Call `_refresh()` immediately after to show the next movie.

#### 3. Verification (The "Proof of Muscle")
- Run the app on your Samsung.
- Swipe a movie away.
- **Check the Backend Logs**: You should see a `POST /discard/tt...` request.
- **Check the Database**: Open `movies.db` and verify the ID is now in the `discarded_movies` table.

---

## ⏭️ Next Stop: Level 5.4 - Vibe Selection Menu
**After you master the swipe:**
- We'll build a custom drawer or menu to switch between "Sci-Fi", "Anime", "Comedy", etc.
