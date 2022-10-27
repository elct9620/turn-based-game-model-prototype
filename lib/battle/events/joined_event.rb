# frozen_string_literal: true

module Battle
  module Events
    # Actor Joined
    #
    # @since 0.1.0
    class JoinedEvent
      attr_reader :actor_id, :name

      def initialize(actor_id:, name:)
        @actor_id = actor_id
        @name = name
      end
    end
  end
end
