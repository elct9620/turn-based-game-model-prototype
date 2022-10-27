# frozen_string_literal: true

module Battle
  module Events
    class DamagedEvent
      attr_reader :from_id, :to_id

      def initialize(from_id:, to_id:, amount:)
        @from_id = from_id
        @to_id = to_id
        @amount = amount
      end

      def amount
        @amount.to_i
      end
    end
  end
end
