
require 'pry'
class Pokemon

	@@all = []
	attr_reader :id, :name, :type, :db

	def initialize(id:, name:, type:, db: '@db')
		@id = id
		@name = name
		@type = type
		@db = db
		@@all << self
	end

	def self.all
    @@all
    end

	def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
   end

   def self.find(id,db)
   	newPokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id =?", id)
   	id = newPokemon[0][0]
   	name = newPokemon[0][1]
   	type = newPokemon[0][2]
   	self.new(id: id, name: name, type: type)

   
   	
   end

end
