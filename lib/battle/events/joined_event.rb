# frozen_string_literal: true

module Battle
  module Events
    # Actor Joined
    #
    # @since 0.1.0
    class JoinedEvent < BaseEvent
      attr_reader :actor_id, :name

      def initialize(actor_id:, name:)
        @actor_id = actor_id
        @name = name
      end

      def to_s
        "#{@name}加入戰鬥"
      end
    end
  end
end
