Given("the following movies exist:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then("{int} movies should exist") do |int|
  Movie.count.should be int.to_i
end

Then(/^the director of "(.+)" should be "(.+)"$/) do |string, string2|
  expect(page.body).to match(/Details about #{string}.*Director:\s+#{string2}/m)
end
