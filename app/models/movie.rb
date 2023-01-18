require 'csv'

class Movie

  def self.all
    movie_data.map do |movie|
      Movie.new(movie)
    end
  end

  def self.find(id)
    movie = movie_data.find do |movie|
      movie["id"] == id.to_s
    end
    Movie.new(movie)
  end

  def initialize(data)
    @data = data
  end

  def market_price
    @data['market price']
  end

  def method_missing(method_name, *args, &block)
    @data[method_name.to_s] || super
  end

  def as_json(options = {})
    data = @data.to_h
    data['market_price'] = data.delete('market price')
    data
  end

  private

  def self.movie_data
    CSV.read(ENV['MOVIES_FILE'], headers: true)
  end
end