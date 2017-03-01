require "bundler/setup"
require "pry"

require "sqlite3"

# Open a database
db = SQLite3::Database.new "time_entries.sqlite3"
