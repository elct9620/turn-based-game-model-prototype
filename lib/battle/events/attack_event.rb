# frozen_string_literal: true

module Battle
  module Events
    class AttackEvent
      attr_reader :from_id, :to_id

      def initialize(from_id:, to_id:)
        @from_id = from_id
        @to_id = to_id
      end
    end
  end
end
