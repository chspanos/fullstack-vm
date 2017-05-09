# "Database code" for the DB Forum.

import psycopg2
import bleach

# POSTS = [("This is the first post.", datetime.datetime.now())]

def get_posts():
  """Return all posts from the 'database', most recent first."""
  db = psycopg2.connect("dbname=forum")
  c = db.cursor()
  c.execute("select content, time from posts order by time desc;")
  posts = c.fetchall()
  db.close()
  return posts

def add_post(content):
  """Add a post to the 'database' with the current timestamp."""
  db = psycopg2.connect("dbname=forum")
  c = db.cursor()
  clean_content = bleach.clean(content)
  c.execute("insert into posts (content) values (%s)", (clean_content,))
  db.commit()
  db.close()
