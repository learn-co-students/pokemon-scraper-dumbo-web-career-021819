require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :hp, :db

def initialize(id:, name:, type:, hp: 60, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp
end

def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

def self.find(spec_id, db)
  pokemon_data = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", spec_id)
  Pokemon.new(id: pokemon_data[0][0], name: pokemon_data[0][1], type: pokemon_data[0][2], hp: pokemon_data[0][3],db:db)
end

def alter_hp(new_hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
end

end
