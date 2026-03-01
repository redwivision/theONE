# 🎯 The One - Movie Recommendation App

"The One" is a premium movie recommendation platform designed to help you find your next watch based on your specific "vibe." It leverages a robust Python backend and a sleek Flutter frontend to deliver a seamless, swipeable discovery experience.

---

## 🚀 The Architecture

### 🧠 Backend (The Brain)
Built with **FastAPI** and **SQLite**, the backend handles movie discovery, user preferences, and data resiliency.
- **Vibe-Based Engine**: Custom logic to curate recommendations from 200+ hand-picked titles.
- **Persistence**: SQLite database to track "discards" so you never see the same boring recommendation twice.
- **Resilient Retrieval**: "Self-healing" API logic that automatically recovers if external data sources (OMDB) fail.
- **API Tech**: Uvicorn, Pydantic, HTTPX.

### 📱 Frontend (The Face) - *In Development*
A **Flutter** mobile application designed for intuitive swiping and effortless discovery.
- **Modern UI**: Clean, responsive design for swiping through movie cards.
- **Real-time Sync**: Direct integration with the FastAPI discovery engine.

---

## 🛠️ Getting Started

### 1. Backend Setup
1. **API Key**: Create a `.env` file based on `.env.example` and add your [OMDB API Key](http://www.omdbapi.com/apikey.aspx).
2. **Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```
3. **Run**:
   ```bash
   uvicorn api:app --reload
   ```
   ```bash
   


### 2. Frontend Setup
1. **Directory**: `cd the_one_mobile`
2. **Dependencies**: `flutter pub get`
3. **Run**: `flutter run`

---

## 📈 Roadmap
- [x] Phase 1: Python Script Discovery
- [x] Phase 2: FastAPI Integration
- [x] Phase 3: SQLite Persistence & Discard logic
- [x] Phase 4: Senior-grade Resiliency & Refactoring
- [/] Phase 5: Flutter Mobile Implementation
- [ ] Phase 6: Jarvis AI Integration (Level 6)

---

**Built with passion and Senior-level muscle growth.** 🔥
