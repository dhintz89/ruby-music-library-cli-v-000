class MusicLibraryController
  
  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the arists, enter 'list artists'."
    puts "To list all of the genres, enter 'list genres'."
    puts "To list all of the songs   a particular , "
    puts "To list all of the songs   a particular , "
    puts ""
    puts ""
    puts ""
    user_input = gets.strip
    
    
  end
    
end