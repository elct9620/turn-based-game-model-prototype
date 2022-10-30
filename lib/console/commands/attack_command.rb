# frozen_string_literal: true

module Console
  module Commands
    class AttackCommand
      def execute(battle)
        context = Battle::Contexts::AttackContext.new(battle)
        context.attack(by: 0, target: 1, amount: rand(0..50))
        context.attack(by: 1, target: 0, amount: rand(0..25))
        context.settlement
      end
    end
  end
end
