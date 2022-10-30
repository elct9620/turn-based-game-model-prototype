# frozen_string_literal: true

module Console
  module Commands
    class EscapeCommand
      def execute(battle)
        context = Battle::Contexts::EscapeContext.new(battle)
        context.escape_by(actor: 0, rate: Battle::SuccessRate.new(50))
      end
    end
  end
end
