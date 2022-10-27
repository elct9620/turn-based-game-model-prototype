# frozen_string_literal: true

Given('there have a battle') do
  @io = StringIO.new
  @battle = Battle::Stage.new(@io)
end

Then('I can see {string}') do |message|
  expect(Battle::Output.new(@battle)).to include(message)
end
