require "bundler/setup"
require "pry"

require "sqlite3"

# Open a database
db = SQLite3::Database.new "time_entries.sqlite3"


# find all time entries.
sql = "SELECT worked_on, duration, created_at, updated_at FROM time_entries";
p db.execute(sql)

# Find the developer who joined most recently.
sql = "SELECT name FROM developers ORDER BY joined_on ASC LIMIT 1"
p db.execute(sql)
