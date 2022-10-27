# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class Stage
    include Aggregable

    on Events::JoinedEvent do |event|
      actor = Actor.new(id: event.actor_id, name: event.name)
      @actors << actor
      actor
    end

    on Events::AttackEvent do |event|
    end

    def initialize(io)
      @actors = []
    end

    def join(name)
      apply Events::JoinedEvent.new(actor_id: @actors.size, name: name)
    end

    def attack(from_id:, to_id:, amount:)
      apply Events::AttackEvent.new(
        from_id: from_id,
        to_id: to_id,
        amount: amount
      )
    end
  end
end
