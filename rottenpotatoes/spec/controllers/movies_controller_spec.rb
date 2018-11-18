require 'rails_helper'

describe MoviesController do

  before do
    movie1 = instance_double(Movie, title: "Alien", director: "Ridley Scott")
    allow(Movie).to receive(:find).and_return(movie1)
  end

  it 'should have a "same director" method with :id param' do
    get :same_director, {id: 1}
  end

  context 'movie has a director' do
    before do
      movie2 = instance_double(Movie, title: "Alien", director: "Ridley Scott")
      allow(Movie).to receive(:find).and_return(movie2)
    end

    it 'should call the "find_same_director" model method with :id param' do
      expect(Movie).to receive(:find_same_director)
      get :same_director, {id: 1}
    end
  end

  context 'movie has nor a director' do
    before do
      movie = instance_double(Movie, title: "Alien", director: "")
      allow(Movie).to receive(:find).and_return(movie)
    end

    it 'should not call the "find_same_director" model method with :id param' do
      expect(Movie).not_to receive(:find_same_director)
      get :same_director, {id: 1}
    end
  end
end
