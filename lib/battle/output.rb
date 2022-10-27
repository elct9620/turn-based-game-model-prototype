# frozen_string_literal: true

module Battle
  class Output
    include Aggregable
    include Enumerable

    on Events::JoinedEvent do |event|
      "#{event.name}加入戰鬥"
    end

    on Events::AttackEvent do |event|
      target = @actors[event.to_id]
      "#{target.name}受到 #{event.amount} 點傷害"
    end

    def initialize(battle)
      @battle = battle
    end

    def each(&block)
      @battle.events.lazy.map do |event|
        apply event, target: @battle
      end.each(&block)
    end
  end
end
