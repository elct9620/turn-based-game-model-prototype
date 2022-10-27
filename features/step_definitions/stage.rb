# frozen_string_literal: true

Given('there have a battle') do
  @io = StringIO.new
  @battle = Battle::Stage.new(@io)
end

When('an actor {string} joined') do |name|
  @battle.join(name)
end

Then('I can see {string}') do |message|
  expect(@io.string).to include(message)
end
