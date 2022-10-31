# frozen_string_literal: true

When('{string} attack {string} with {int} point') do |attacker, defender, amount|
  attack_context.attack(
    by: @actor_ids[attacker],
    target: @actor_ids[defender],
    amount: amount
  )
  attack_context.settlement
end

When('{string} escaped') do |actor|
  escape_context.escape_by(actor: @actor_ids[actor], rate: Battle::SuccessRate.new(50, result: true))
end
