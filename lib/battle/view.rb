# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class View
    include Aggregable

    attr_reader :actors

    on Events::JoinedEvent do |event|
      actor = Actor.new(id: event.actor_id, name: event.name, hp: event.hp)
      @actors << actor
      actor
    end

    on Events::DamagedEvent do |event|
      actor = @actors[event.to_id]
      actor.damaged(event.amount)
    end

    on Events::DefeatedEvent do |_event|
      @finished = true
      freeze
    end

    def initialize
      @actors = []
      @finished = false
    end

    def exit
      @finished = true
    end

    def finished?
      @finished == true
    end
  end
end
