class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  extend Concerns::Findable
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=artist
    end
    if genre != nil
      self.genre=genre
    end
    self.save
  end
  
#Instance Methods
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def save
    @@all << self
  end
 
#Class Methods
  
  def self.all
    @@all
  end
  
  def self.find_by_name(name)
    Song.all.detect {|song| song.name.eql?(name)}
  end
  
  def self.create(name)
    song = Song.new(name)
    song
  end
  
  def self.find_or_create_by_name(name)
    unless Song.find_by_name(name) == nil
      Song.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def self.destroy_all
    @@all.clear
  end
  
end