# frozen_string_literal: true

When('{string} attack {string} with {int} point') do |attacker, defender, amount|
  @battle.apply Battle::Events::AttackEvent.new(
    from_id: @actor_ids[attacker],
    to_id: @actor_ids[defender],
    amount: amount
  )

  defeated_actor = @battle.actors.find { |actor| actor.hp == 0 }
  if defeated_actor
    @battle.apply Battle::Events::DefeatedEvent.new(
      actor_id: defeated_actor.id
    )
  end
end
