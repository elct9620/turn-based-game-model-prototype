# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class View
    include Aggregable

    attr_reader :actors

    on Events::JoinedEvent do |event|
      hp = HealthPoint.new(event.hp)
      add_actor(id: event.actor_id, name: event.name, hp: hp)
    end

    on Events::DamagedEvent do |event|
      damage(target_id: event.to_id, amount: event.amount)
    end

    on Events::EscapedEvent do |_event|
      self.exit
    end

    on Events::DefeatedEvent do |_event|
      self.exit
    end

    def initialize
      @actors = []
      @finished = false
    end

    def add_actor(**attrs)
      actor = Actor.new(**attrs)
      @actors << actor
      actor
    end

    def damage(target_id:, amount:)
      actor = @actors[target_id]
      actor.damaged(amount)
    end

    def exit
      @finished = true
      freeze
    end

    def finished?
      @finished == true
    end
  end
end
