# frozen_string_literal: true

module Console
  module Commands
    class AttackCommand
      def initialize(battle)
        @battle = battle
      end

      def context
        @context ||= Battle::Contexts::AttackContext.new(@battle)
      end

      def execute
        context.attack(by: 0, target: 1, amount: rand(0..50))
        context.attack(by: 1, target: 0, amount: rand(0..25))
        context.settlement
      end
    end
  end
end
