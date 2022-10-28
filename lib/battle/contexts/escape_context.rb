# frozen_string_literal: true

module Battle
  module Contexts
    class EscapeContext
      def initialize(battle)
        @battle = battle
      end

      def escape_by(actor:, rate:)
        return unless rate.successful?

        @battle.apply Events::EscapedEvent.new(
          actor_id: actor
        )
      end
    end
  end
end
