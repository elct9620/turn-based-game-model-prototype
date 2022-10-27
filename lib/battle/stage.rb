# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class Stage
    attr_reader :events

    def initialize(io)
      @events = []
      @actors = []
    end

    def join(name)
      actor = Actor.new(id: @actors.size, name: name)
      @actors << actor
      event = Events::JoinedEvent.new(actor_id: actor.id, name: name)
      @events << event
      event
    end

    def attack(from_id:, to_id:)
      event = Events::AttackEvent.new(
        from: @actors[from_id],
        to: @actors[to_id]
      )
      @events << event
      event
    end
  end
end
