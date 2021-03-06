class Genre
  attr_accessor :name, :songs
  @@all = []
  
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end