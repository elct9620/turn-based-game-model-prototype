# frozen_string_literal: true

When('an actor {string} joined') do |name, table|
  attributes = table.hashes.first
  actor = prepare_context.add_actor(id: @battle.actors.size, name: name, hp: attributes['hp'])
  actor_ids[name] = actor.id
end

Given('there are some actors') do |table|
  table.hashes.each do |actor|
    actor = prepare_context.add_actor(
      id: @battle.actors.size,
      name: actor['name'],
      hp: actor['hp']
    )
    actor_ids[actor.name] = actor.id
  end
end
