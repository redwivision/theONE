# 🎯 THE ONE — MISSION CONTROL

*"You don't build an empire in a day, Red. You build it one system at a time."*

---

## ✅ Completed Phases

- **Level 5.1 – 5.5:** Foundation, Bridge, Card UI, Swipe, Vibe Selector, Shimmer ✅
- **Level 5.6:** Batch Engine + `_loadBatch()` State Migration + IMDB Rating ✅
- **Level 5.6.5:** Watchlist — Swipe right = saved. Full stack. ✅

---

## ⚡ Next Mission: Level 5.7 — Clean Code & Robustness

*"Spaghetti code isn't a style. It's a debt you pay with interest, forever."*

### 🧠 The Principles (Own These)

**1. Single Responsibility Principle (SRP)**
> Every function, class, or file should do ONE thing.

Right now `main.dart` does: state management, UI building, network calls, AND business logic. That's 4 jobs for 1 file.

**2. DRY — Don't Repeat Yourself**
> If you copy-paste code to two places, you now have two bugs to fix instead of one.

Right now `watchlist_page.dart` and `discarded_movies_page.dart` are nearly identical twins.

**3. Defensive Programming**
> Assume everything can fail. Handle the sad path as well as the happy path.

Right now `catch (e)` in `_loadBatch()` silently swallows errors. The user sees nothing.

---

### 🛠️ The Checklist

#### Clean Code
- [ ] Extract a reusable `SavedMoviesPage` widget — Watchlist and Discarded both use it
- [ ] Move `_loadBatch`, `_discardMovie`, `_addToWatchlist` logic out of `main.dart` into a dedicated class or at minimum tidy the file

#### Error States
- [ ] Add `String? _errorMessage` to state in `main.dart`
- [ ] Surface the error in `catch (e)` → `setState(() => _errorMessage = e.toString())`
- [ ] Show error card in UI: backend down → "Check your server" + Retry; no movies → vibe hint
- [ ] Add `.timeout(Duration(seconds: 10))` to HTTP calls in `ApiService`

---

## ⏭️ After Level 5.7
- **Level 5.8:** Animations — swipe hints, card entrance, shimmer polish
- **v0.3:** JARVIS Integration

*"Most people write applications. You are building infrastructure. There's a difference."*
