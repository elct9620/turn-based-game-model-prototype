# frozen_string_literal: true

module Battle
  module Contexts
    class EscapeContext
      def initialize(battle)
        @battle = battle
      end

      def escape_by(actor:)
        @battle.apply Events::EscapedEvent.new(
          actor_id: actor
        )
      end

      def successful?
        rand(1..100) > 50
      end
    end
  end
end
