class Pokemon

  attr_reader :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    @id = db.execute("SELECT name FROM pokemon WHERE id = (?)", id)[0][0]
    @@all.find {|x| x.id == id}
  end

end
