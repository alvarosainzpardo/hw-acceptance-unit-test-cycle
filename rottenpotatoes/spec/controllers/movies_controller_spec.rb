require 'rails_helper'

describe MoviesController do

  it 'should have a "same director" method with :id param' do
    post :same_director, {id: 1}
  end

  it 'should call the "search_same_director" model method with :id param' do
    expect(Movie).to receive(:find_same_director).with('1')
    post :same_director, {id: 1}
  end
end
