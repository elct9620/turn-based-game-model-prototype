# frozen_string_literal: true

Given('there have a battle') do
  @battle = Battle::View.new
  Battle::Event.attach(@battle)
end

Then('I can see {string}') do |message|
  expect(Battle::Output.new(@battle)).to include(message)
end

Then('the battle is finished') do
  expect(@battle).to be_finished
end
