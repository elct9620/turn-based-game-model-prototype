# frozen_string_literal: true

module Battle
  module Events
    class AttackEvent < BaseEvent
      def initialize(from:, to:)
        @from = from
        @to = to
      end

      def to_s
        "#{@to.name}受到 10 點傷害"
      end
    end
  end
end
