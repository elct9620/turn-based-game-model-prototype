# frozen_string_literal: true

module Console
  module Commands
    class EscapeCommand
      def initialize(battle)
        @battle = battle
      end

      def context
        @context ||= Battle::Contexts::EscapeContext.new(@battle)
      end

      def execute
        context.escape_by(actor: 0, rate: Battle::SuccessRate.new(50))
      end
    end
  end
end
