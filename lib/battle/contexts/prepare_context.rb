# frozen_string_literal: true

module Battle
  module Contexts
    class PrepareContext
      def initialize(battle)
        @battle = battle
      end

      def add_actor(id:, name:, hp:)
        @battle.apply Battle::Events::JoinedEvent.new(
          actor_id: id, name: name, hp: hp
        )
      end
    end
  end
end
