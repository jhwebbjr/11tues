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

#Find the number of projects for each client.
sql = "SELECT clients.name, Count(projects.name)
FROM projects
JOIN clients
ON projects.client_id=clients.id
GROUP BY clients.name"
p db.execute(sql)

#Find all time entries, and show each one's client name next to it.
sql = "SELECT time_entries.*, clients.name
FROM time_entries
JOIN projects
ON time_entries.project_id=projects.id
JOIN clients
ON projects.client_id=clients.id"
p db.execute(sql)
