class MusicLibraryController
  
  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the arists, enter 'list '."
    puts "To list all of the , enter 'list '."
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    user_input = gets.strip
    
    
  end
    
end