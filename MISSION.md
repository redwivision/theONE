# 🎯 THE ONE - MISSION CONTROL (LEVEL 5: THE FACE)

## ✅ Completed Backend Phases
- **Levels 1-2:** API & Mastery
- **Level 4:** Persistence Mastery
- **Level 4.7:** Senior Cleanup

---

## ⚡ Current Mission: Level 5.1 - The Data Bridge
**Objective:** Breach the wall between Dart and Python. Prove your Flutter app can receive and understand your backend data.

### 📋 Level 5.1 Challenge Tasks (Self-Driven)

#### 1. The Model Debug (`models/movie.dart`)
- **The Bug**: Your code thinks `movie_details` is a `List` (`[]`), but the backend sends a `Map` (`{}`).
- **The Task**: Change `Movie.fromJson` to treat `movie_details` as a Map.
- **Goal**: Access the fields directly like `json['movie_details']['Title']`.

#### 2. The Service Refactor (`api_service.dart`)
- **The Bug**: `HttpClient` is too low-level and hard to read.
- **The Task**: Use the `http` package you just added.
- **Steps**:
    - `import 'package:http/http.dart' as http;`
    - Use `var response = await http.get(Uri.parse(_baseUrl));`
    - Return a `Movie` object using `Movie.fromJson(jsonDecode(response.body))`.
- **Goal**: Change the function from `Future<void>` to `Future<Movie>`.

#### 3. The Smoke Test (`main.dart`)
- **The Task**: In the `_MyHomePageState` class, add a `print()` call inside the `_incrementCounter` function (or create a new button).
- **Goal**: See a real movie title in your terminal when you click the button.

---

**Current Status:** Level 5.1 - In Progress  
**Goal:** A successful `print()` statement in the Flutter Debug Console showing real data from your Python server.
