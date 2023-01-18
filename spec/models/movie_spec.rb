require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    ENV['MOVIES_FILE'] = 'spec/fixtures/movies.csv'
  end

  describe ".all" do
    it "returns a list of movies" do
      expect(Movie.all.length).to eq(3)
    end

    it "returns a list of movie objects" do
      expect(Movie.all.first).to be_a(Movie)
      expect(Movie.all.last).to be_a(Movie)
      expect(Movie.all.first.name).to eq("The Matrix")
    end
  end

  describe ".find" do
    it "returns a single movie" do
      movie = Movie.find(3)
      expect(movie).to be_a(Movie)
      expect(movie.name).to eq("Other Woman, The")
      expect(movie.market_price).to eq("$43.24")
      expect(movie.id).to eq("3")
      expect(movie.genre).to eq("Comedy|Romance")
      expect(movie.thumbnail).to eq("http://dummyimage.com/100x100.png/dddddd/000000")
      expect(movie.image).to eq("http://dummyimage.com/400x.png/cc0000/ffffff")
      expect(movie.owner).to eq("Ronaldo")
    end
  end
end