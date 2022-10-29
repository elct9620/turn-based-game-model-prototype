# frozen_string_literal: true

module Battle
  module Events
    # Actor Joined
    #
    # @since 0.1.0
    class JoinedEvent
      attr_reader :actor_id, :name, :hp

      def initialize(actor_id:, name:, hp:)
        @actor_id = actor_id
        @name = name
        @hp = hp
      end
    end
  end
end
