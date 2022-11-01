# frozen_string_literal: true

module Console
  module Commands
    class JoinCommand
      def initialize(battle, name:)
        @battle = battle
        @name = name
      end

      def context
        @context ||= Battle::Contexts::PrepareContext.new(@battle)
      end

      def execute
        context.add_actor(id: 0, name: @name, hp: 100)
        context.add_actor(id: 1, name: '哥布林', hp: 100)
      end
    end
  end
end
