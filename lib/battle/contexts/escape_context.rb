# frozen_string_literal: true

module Battle
  module Contexts
    class EscapeContext
      def initialize(battle)
        @battle = battle
      end

      def escape_by(actor:, rate:)
        return unless rate.successful?

        event = Events::EscapedEvent.new(
          actor_id: actor
        )
        Battle::Event.append(battle_id: @battle.id, event: event)
        @battle.apply event
      end
    end
  end
end
