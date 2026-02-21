import sqlite3

def create_connection(db_file):
    conn = None;
    try:
        conn = sqlite3.connect(db_file)
    except sqlite3.Error as e:
        print(e)
    return conn

def create_table(conn, create_table_sql):
    try:
        c = conn.cursor()
        c.execute(create_table_sql)
    except sqlite3.Error as e:
        print(e)

def discard_movie(conn, movie_id, movie_title):
    try:
        c = conn.cursor()
        c.execute("INSERT OR IGNORE INTO discarded_movies (id, title) VALUES (?, ?)", (movie_id, movie_title))
        conn.commit()
    except sqlite3.Error as e:
        print(e)

def get_discarded_movies(conn):
    try:
        c = conn.cursor()
        c.execute("SELECT * FROM discarded_movies")
        return c.fetchall()
    except sqlite3.Error as e:
        print(e)

               
def is_movie_discarded(conn, movie_id):
    try:
        c = conn.cursor()
        c.execute("SELECT * FROM discarded_movies WHERE id = ?", (movie_id,))
        return c.fetchone() is not None
    except sqlite3.Error as e:
        print(e)
        return False

def remove_from_dicarded(conn, movie_id):
    try:
        c = conn.cursor()
        c.execute("DELETE FROM discarded_movies WHERE id = ?", (movie_id,))
        conn.commit()
    except sqlite3.Error as e:
        print(e)


if __name__ == "__main__":
    conn = create_connection('movies.db')

    # Create the table
    create_table(conn, "CREATE TABLE IF NOT EXISTS discarded_movies (id TEXT PRIMARY KEY, title TEXT)")

    # Test: discard two movies
    discard_movie(conn, 'tt0133093', 'The Matrix')
    discard_movie(conn, 'tt0068646', 'The Godfather')

    # Test: get all discarded movies
    print('All discarded:', get_discarded_movies(conn))

    # Test: check if specific movies are discarded
    print('Matrix discarded?', is_movie_discarded(conn, 'tt0133093'))   # True
    print('Inception discarded?', is_movie_discarded(conn, 'tt1375666')) # False

    conn.close()