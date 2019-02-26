require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: , name: , type: , hp: 60 , db: )
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end

  # Pokemon.find finds a pokemon from the database by their id number
  # and returns a new Pokemon object
  def self.find(id, db)
    pk_db = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    Pokemon.new(id: pk_db[0][0], name: pk_db[0][1], type: pk_db[0][2], db: db)
  end



end
