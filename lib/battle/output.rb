# frozen_string_literal: true

module Battle
  class Output
    include Enumerable

    def initialize(battle)
      @battle = battle
      @battle.io.rewind
    end

    def each(&block)
      @battle.io.map(&:strip).each(&block)
    end
  end
end
