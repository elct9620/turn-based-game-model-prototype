# frozen_string_literal: true

module ActorTestHelper
  def join_actor(name)
    @actor_ids ||= {}
    event = @battle.join(name)
    @actor_ids[name] = event.id
  end
end

World(ActorTestHelper)
