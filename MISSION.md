# 🎯 THE ONE - MISSION CONTROL

## Current Mission: Level 4 - Database & Discard Feature

### Objective
Build a SQLite database that permanently stores discarded movies and prevents them from being recommended again.

--- 
## Instructions for at school
1. Go to school
2. Clone/pull the repo
3. Run python database.py to recreate the database locally (since .db files are ignored by git, which is correct)
4. Continue working on Part 2 of the Mission (turning that script into functions) 

## 📋 TODO List

### Part 1: Database Setup
- [ ] Create `database.py` file
- [ ] Import `sqlite3` library
- [ ] Create database connection function
- [ ] Design table schema for discarded movies
  - Column 1: `imdb_id` (unique identifier)
  - Column 2: `title` (movie name)
  - Column 3: `discarded_at` (timestamp - optional)
- [ ] Write function to create table if not exists
- [ ] Test database creation with a simple script

### Part 2: Database Functions
- [ ] Write function to add a movie to discarded list
  - Input: imdb_id and title
  - Output: Success/failure
- [ ] Write function to check if a movie is discarded
  - Input: imdb_id
  - Output: True/False
- [ ] Write function to get all discarded movies
  - Output: List of discarded movies
- [ ] Test all functions independently

### Part 3: API Integration
- [ ] Create `/discard` endpoint (POST request)
  - Accept movie data (imdb_id, title)
  - Save to database
  - Return success message
- [ ] Update `/recommend` endpoint
  - Check if movie is in discarded list
  - If discarded, try another movie (or return error)
  - If not discarded, return movie
- [ ] Test both endpoints

### Part 4: Testing & Verification
- [ ] Test: Discard a movie via `/discard` endpoint
- [ ] Test: Verify discarded movie doesn't appear in `/recommend`
- [ ] Test: Restart server, verify data persists
- [ ] Test: Discard multiple movies
- [ ] Commit and push to GitHub

---

## 🔑 Key Concepts to Research

### SQLite Basics
- **Connection**: `sqlite3.connect('database_name.db')`
- **Cursor**: `conn.cursor()` - executes SQL commands
- **Create Table**: `CREATE TABLE IF NOT EXISTS table_name (...)`
- **Insert Data**: `INSERT INTO table_name VALUES (?)`
- **Query Data**: `SELECT * FROM table_name WHERE condition`
- **Commit**: `conn.commit()` - saves changes
- **Close**: `conn.close()` - closes connection

### SQL Data Types
- `TEXT` - for strings
- `INTEGER` - for numbers
- `REAL` - for decimals
- `BLOB` - for binary data

### FastAPI POST Requests
- Need to define request body structure
- Use Pydantic models: `from pydantic import BaseModel`
- Example:
```python
class Movie(BaseModel):
    imdb_id: str
    title: str

@app.post("/discard")
def discard_movie(movie: Movie):
    # movie.imdb_id and movie.title are now available
    pass
```

---

## 📚 Resources

- Python SQLite3 docs: https://docs.python.org/3/library/sqlite3.html
- FastAPI Request Body: https://fastapi.tiangolo.com/tutorial/body/
- SQL Tutorial: https://www.w3schools.com/sql/

---

## ✅ Success Criteria

- Database file `movies.db` exists
- Table `discarded_movies` created
- `/discard` endpoint saves movies
- `/recommend` never returns discarded movies
- Data survives server restart
- All changes pushed to GitHub

---

## 🎓 Learning Goals

By completing Level 4, you will understand:
- Database connections and CRUD operations
- SQL table design and queries
- POST request handling in APIs
- Data persistence across sessions
- Integration of database with existing API

---

## 💡 Notes

- Work on `database.py` first, test it independently
- Then integrate into `api.py`
- Commit after each major milestone
- Don't worry about perfect code - make it work first, refactor later
- The database file (`movies.db`) should be in `.gitignore` (already is!)

---

**Current Status**: Level 4 In Progress  
**Previous Levels**: ✅ Level 1 (Python Script) | ✅ Level 2 (FastAPI Endpoint)  
**Next Levels**: Level 4.5 (Random Recommendations) | Level 5 (Flutter UI)
