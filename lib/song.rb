require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  # def initialize(name = nil, artist_name = nil)
  #   @name = name
  #   @artist_name = artist_name
  # end  
    
  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(filename)
    # binding.pry
    artist , name = filename.split(/-|.mp3/).collect{|w| w.strip}

    song = self.new
    song.name, song.artist_name = name, artist
    song
  end

  def self.create_from_filename(filename)
    # binding.pry
    artist , name = filename.split(/-|.mp3/).collect{|w| w.strip}

    song = self.create 
    song.name, song.artist_name = name, artist
    # song.artist_name = artist
    song
  end

  def self.destroy_all 
    self.all.clear
  end


end
