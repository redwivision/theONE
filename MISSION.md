# 🎯 THE ONE — MISSION CONTROL

*"You know what I've learned about systems? They don't fail because they're complex. They fail because someone, somewhere, was too afraid to understand them fully."*

---

## ✅ Completed Phases
- **Level 5.1 - 5.5:** Foundation, Bridge, Swipe, Vibe Selector, Shimmer. ✅
- **Level 5.6 (Backend):** Batch Engine — 5 movies per request, retry counter, set-based exclusion. ✅

---

## ⚡ Current Mission: Level 5.6 — The State Migration

*"Right now, you have two operatives in the field. One is experienced (`_movieFuture`). One is new and unactivated (`_movies`). They don't talk to each other. The mission doesn't end until they do."*

### 🔎 The Diagnosis (Current Bugs)

| Bug | Root Cause |
| :--- | :--- |
| Discarded card "comes back" | `_discardMovie` removed `_refresh()` but didn't replace it with a local list update |
| Empty screen after all 5 discarded | No "Load More" trigger exists yet |
| `_movies` is never used | It's declared but never filled or read by the UI |

---

### 🛠️ The Surgery (3 Precise Cuts)

#### Cut 1: Kill `_movieFuture`. Activate `_movies`.

**Delete** `late Future<List<Movie>> _movieFuture;` from state.

**Replace** `initState` to `await` the batch and store it:
```
initState → calls _loadBatch()
```
```
_loadBatch() → async → awaits ApiService().getMovie() → setState(_movies = result)
```

Add `_isLoading = true` before the fetch and `_isLoading = false` after, so the Shimmer still works.

#### Cut 2: Retrain `_discardMovie`.

After `await ApiService().discardMovie(movieId)`, instead of `_refresh()`, do:
```
setState(() => _movies.removeWhere((m) => m.id == movieId))
```
This surgically removes ONE item from the local list. No network call. No full reload.

Then: if `_movies.isEmpty` → call `_loadBatch()` to get a fresh batch.

#### Cut 3: Rewire the UI.

**Delete** the `FutureBuilder`. Replace with:
```
if (_isLoading) → MovieCardShimmer()
else if (_movies.isEmpty) → "You've seen it all" screen
else → ListView.builder(itemCount: _movies.length, ...)
```

---

## 📡 Data Flow (v0.2 Final)

```
[App Starts / Vibe Changes]
    │
    ▼
_isLoading = true → setState() → Shimmer shows
    │
    ▼
await ApiService().getMovie(vibe: _selectedVibe)
    │  returns List<Movie>
    ▼
_movies = result → _isLoading = false → setState() → ListView shows

[User Swipes to Discard]
    │
    ▼
await ApiService().discardMovie(id)   ← tells the backend
setState(_movies.removeWhere(...))    ← removes from local list
    │
    ├─ _movies still has items → ListView re-renders (shorter)
    └─ _movies is empty → _loadBatch() → fetch 5 more
```

---

## ⏭️ What Comes After
- **Level 5.6.5:** Watchlist — Swipe right = saved. Same pattern as Discards.
- **Level 5.7:** AI Self-Replenishing Vibe Engine.
- **v0.3:** JARVIS Integration.

*"Most people write applications. You are building infrastructure. There's a difference."*
