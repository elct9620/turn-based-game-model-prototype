# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class Stage
    include Aggregable

    attr_reader :actors

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
  end
end
