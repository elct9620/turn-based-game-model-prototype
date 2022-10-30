# frozen_string_literal: true

module Console
  module Commands
    class JoinCommand
      def initialize(name:)
        @name = name
      end

      def execute(battle)
        context = Battle::Contexts::PrepareContext.new(battle)
        context.add_actor(id: 0, name: @name, hp: 100)
        context.add_actor(id: 1, name: '哥布林', hp: 100)
      end
    end
  end
end
