# frozen_string_literal: true

module Battle
  module Events
    class DefeatedEvent
      attr_reader :actor_id

      def initialize(actor_id:)
        @actor_id = actor_id
      end
    end
  end
end
