# frozen_string_literal: true

module ActorTestHelper
  def join_actor(name, hp)
    @actor_ids ||= {}
    event = @battle.apply Battle::Events::JoinedEvent.new(
      actor_id: @battle.actors.size,
      name: name,
      hp: hp
    )
    @actor_ids[name] = event.id
  end
end

World(ActorTestHelper)
