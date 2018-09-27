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
<<<<<<< HEAD
    @artist = artist
=======
      @artist = artist
>>>>>>> 297de320c5ff0569a5c1f6a57b083c0e7b571ce6
    @artist.add_song(self)
    @artist
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
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
  
  def self.new_from_filename(filename)
    artist, song, genre = filename.sub(".mp3","").split(' - ')
    song = self.find_or_create_by_name(song)
<<<<<<< HEAD
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
=======
    song.artist = artist
>>>>>>> 297de320c5ff0569a5c1f6a57b083c0e7b571ce6
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    self.save
  end
end