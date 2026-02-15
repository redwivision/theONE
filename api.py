from fastapi import FastAPI
from main import fetch_movie_by_title

app = FastAPI()


@app.get("/")
def home():
    return {"message": "Hello World?"}

@app.get("/recommend/")
def get_movie(title: str):
    return fetch_movie_by_title(title=title)