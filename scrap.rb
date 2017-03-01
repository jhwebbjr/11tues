require "bundler/setup"
require "pry"

require "sqlite3"

# Open a database
db = SQLite3::Database.new "time_entries.sqlite3"

#Find all developers in the "Ohio sheep" group.
sql = "SELECT developers.name
FROM developers
WHERE groups.name='Ohio sheep'
JOIN groups
ON group_assignments.group_id=groups.id
OUTER JOIN group_assignments
ON group_assignments.developer_id=developers.id"
p db.execute(sql)
