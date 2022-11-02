# frozen_string_literal: true

module Battle
  module Contexts
    class AttackContext
      def initialize(battle)
        @battle = battle
      end

      def attack(by:, target:, amount:)
        event = Battle::Events::DamagedEvent.new(
          from_id: by,
          to_id: target,
          amount: amount
        )
        Battle::Event.append(battle_id: @battle.id, event: event)
        @battle.apply event
      end

      def settlement
        defeated_actor = @battle.actors.find { |actor| actor.hp.zero? }
        return unless defeated_actor

        event = Battle::Events::DefeatedEvent.new(
          actor_id: defeated_actor.id
        )
        Battle::Event.append(battle_id: @battle.id, event: event)
        @battle.apply event
      end
    end
  end
end
