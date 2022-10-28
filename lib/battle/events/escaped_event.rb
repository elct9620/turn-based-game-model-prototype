# frozen_string_literal: true

module Battle
  module Events
    # Actor Joined
    #
    # @since 0.1.0
    class EscapedEvent
      attr_reader :actor_id

      def initialize(actor_id:)
        @actor_id = actor_id
      end
    end
  end
end
