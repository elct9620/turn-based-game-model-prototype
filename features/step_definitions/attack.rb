# frozen_string_literal: true

When('{string} attack {string} with {int} point') do |attacker, defender, amount|
  context = Battle::Contexts::AttackContext.new(@battle)
  context.attack(
    by: @actor_ids[attacker],
    target: @actor_ids[defender],
    amount: amount
  )
  context.settlement
end
