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

When('{string} escaped') do |actor|
  @battle.apply Battle::Events::EscapedEvent.new(
    actor_id: @actor_ids[actor]
  )
end
