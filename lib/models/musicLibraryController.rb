class MusicLibraryController
  
  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
  end
    
end