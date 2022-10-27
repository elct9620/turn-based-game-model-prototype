# frozen_string_literal: true

module Battle
  class Output
    include Enumerable

    def initialize(battle)
      @battle = battle
    end

    def each(&block)
      @battle.events.lazy.map(&:to_s).each(&block)
    end
  end
end
