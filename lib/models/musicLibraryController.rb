class MusicLibraryController
  require 'pry'
  
  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end
  
  def call
    user_input = nil
    until user_input == "exit" || user_input == "Exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip
    end
  end
    
  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}"}    
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index {|genre, i| puts "#{i+1}. #{genre.name}"}    
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    selected_artist = Artist.find_by_name(gets.strip)
    unless selected_artist == nil
      selected_artist.songs.sort_by {|song| song.name}.each_with_index {|song,i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end
  end
    
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    selected_genre = Genre.find_by_name(gets.strip)
    unless selected_genre == nil
      selected_genre.songs.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    index = nil
    list = Song.all.sort_by {|song| song.name}
    until index >=1 && <=list.length
      puts "Which song number would you like to play?"
      index = gets.strip.to_i - 1
    end
    puts "Playing #{list[index].name} by #{list[index].artist.name}" unless list[index] == nil
  end
  
end