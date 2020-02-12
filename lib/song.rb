class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.name = name
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    song.save
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song_name = []
    self.all.each {|song| song_name << song.name}
    if song_name.include?(name)
        self.find_by_name(name)
    else 
        self.create_by_name(name)
    end
    
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file)
    file_array = file.split(/[-.]/)
    song = self.new
    song.name = (file_array[1]).strip
    song.artist_name =file_array[0]
    song
  end
  
  def self.create_from_filename(file)
    (self.new_from_filename(file)).save
  end
  
  def self.destroy_all
    self.all.clear
    self.all
  end

end
