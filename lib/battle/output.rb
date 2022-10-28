# frozen_string_literal: true

module Battle
  class Output
    include Aggregable
    include Enumerable

    on Events::JoinedEvent do |event|
      "#{event.name}加入戰鬥"
    end

    on Events::DamagedEvent do |event|
      source = @battle.actors[event.from_id]
      target = @battle.actors[event.to_id]
      "#{source.name} 對 #{target.name} 造成 #{event.amount} 點傷害"
    end

    on Events::DefeatedEvent do |event|
      target = @battle.actors[event.actor_id]
      "#{target.name} 被擊敗"
    end

    def initialize(battle)
      @battle = battle
      @cursor = -1
    end

    def each(&block)
      @battle.events.lazy.map do |event|
        apply event
      end.each(&block)
    end

    def rewind
      @cursor = -1
    end

    def next
      @cursor += 1
      apply @battle.events[@cursor]
    end

    def next?
      @battle.events[@cursor.next] != nil
    end
  end
end
