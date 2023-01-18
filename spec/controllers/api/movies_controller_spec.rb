require 'rails_helper'

RSpec.describe Api::MoviesController, type: :request do

  before do
    ENV['MOVIES_FILE'] = 'spec/fixtures/movies.csv'
  end

  describe "GET #index" do
    it "returns http success" do
      get '/api/movies'
      expect(response).to have_http_status(:success)
    end

    it "returns a list of movies" do
      get '/api/movies'
      expect(response.body).to eq(Movie.all.to_json)
      data = JSON.parse(response.body)
      expect(data.length).to eq(3)
    end

    describe "with a different movies file" do
      before do
        ENV['MOVIES_FILE'] = 'spec/fixtures/5movies.csv'
      end

      it "returns a list of movies" do
        get '/api/movies'
        expect(response.body).to eq(Movie.all.to_json)
        data = JSON.parse(response.body)
        expect(data.length).to eq(5)
      end
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get '/api/movies/1'
      expect(response).to have_http_status(:success)
    end

    it "returns a single movie" do
      get '/api/movies/3'
      expect(response.body).to eq(Movie.find(3).to_json)
    end
  end

end