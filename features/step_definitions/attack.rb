# frozen_string_literal: true

When('{string} attack {string} with {int} point') do |attacker, defender, amount|
  @battle.apply Battle::Events::AttackEvent.new(
    from_id: @actor_ids[attacker],
    to_id: @actor_ids[defender],
    amount: amount
  )
end
