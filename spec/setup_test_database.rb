require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'chitterdb_test')
  connection.exec("TRUNCATE peeps;")
end
