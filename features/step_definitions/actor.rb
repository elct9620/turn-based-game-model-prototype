# frozen_string_literal: true

When('an actor {string} joined') do |name, table|
  attributes = table.hashes.first
  join_actor(name, attributes['hp'])
end

Given('there are some actors') do |table|
  table.hashes.each do |actor|
    join_actor(actor['name'], actor['hp'])
  end
end
