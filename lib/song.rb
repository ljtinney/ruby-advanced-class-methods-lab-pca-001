class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new.save
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    all.find.do |song|
    song.name == song_name
  end

  def self.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}
    result
  end

  # def self.find_by_name(song_name)
  #   Song.find_by_name(song_name)
  #     if song.is_a?(song)
  #   Song.create_by_name(song_name)
  #   song
  #     else
  #   Song.create_by_name(song_name)
  #     end
  #   nil
  # end

  # def self.find_or_create_by_name(song_name)
  #   find_by_name(song_name) || find_or_create_by_name(song_name)
  # end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]

    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end