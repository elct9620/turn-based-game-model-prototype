# frozen_string_literal: true

When('{string} attack {string}') do |attacker, defender|
  @battle.attack(
    from_id: @actor_ids[attacker],
    to_id: @actor_ids[defender]
  )
end
