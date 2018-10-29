require 'pg'

class Chitter

  attr_reader :text, :date, :time, :username

  def initialize(text, username, date, time)
    @text = text
    @username = username
    @date = date
    @time = time
  end


    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connected = PG.connect(dbname: 'chitterdb_test')
      else
        connected = PG.connect(dbname: 'chitterdb')
      end
      connected.exec("SELECT * FROM peeps;").map do |peep|
        Chitter.new(peep['text'], peep['username'], peep['date'], peep['time'])
      end
    end

  def self.add(peep, *username)
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'chitterdb_test')
    else
      connected = PG.connect(dbname: 'chitterdb')
    end
    connected.exec("INSERT INTO peeps (text, username, time, date)
                      VALUES('#{peep}', '#{username}', '#{time}', '#{date}');")
  end

  def self.database
    ENV['ENV'] == 'test' ? database = 'chitterdb_test' : database = 'chitterdb'
    @connection = PG.connect(dbname: chitterdb)
  end
#I figured the two syntax below out from ruby docs as i wasn't sure how to approach it
  def self.date
    Time.now.strftime("%m/%d/%Y")
  end

  def self.time
    Time.now.strftime("%H:%M%p")
  end

end
