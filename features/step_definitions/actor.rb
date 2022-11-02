# frozen_string_literal: true

When('an actor {string} joined') do |name, table|
  attributes = table.hashes.first
  id = @battle.actors.size
  prepare_context.add_actor(id: id, name: name, hp: attributes['hp'])
  actor_ids[name] = id
end

Given('there are some actors') do |table|
  table.hashes.each do |actor|
    id = @battle.actors.size
    prepare_context.add_actor(
      id: id,
      name: actor['name'],
      hp: actor['hp']
    )
    actor_ids[actor['name']] = id
  end
end
