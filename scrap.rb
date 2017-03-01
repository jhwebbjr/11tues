require "bundler/setup"
require "pry"

require "sqlite3"

# Open a database
db = SQLite3::Database.new "time_entries.sqlite3"

#Find the number of projects for each client.
sql = "SELECT project_id FROM project_assignments JOIN client_id ON projects"
p db.execute(sql)
