# frozen_string_literal: true

When('an actor {string} joined') do |name|
  join_actor(name)
end

Given('there are some actors') do |table|
  table.hashes.each do |actor|
    join_actor(actor['name'])
  end
end
