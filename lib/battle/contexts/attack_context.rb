# frozen_string_literal: true

module Battle
  module Contexts
    class AttackContext
      def initialize(battle)
        @battle = battle
      end

      def attack(by:, target:, amount:)
        Battle::Event.append(
          battle_id: @battle.id,
          event: Battle::Events::DamagedEvent.new(
            from_id: by,
            to_id: target,
            amount: amount
          )
        )
      end

      def settlement
        defeated_actor = @battle.actors.find { |actor| actor.hp.zero? }
        return unless defeated_actor

        Battle::Event.append(
          battle_id: @battle.id,
          event: Battle::Events::DefeatedEvent.new(
            actor_id: defeated_actor.id
          )
        )
      end
    end
  end
end
