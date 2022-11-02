# frozen_string_literal: true

require 'singleton'
require 'forwardable'

module Battle
  # Battle::Event
  #
  # To simulate ActiveRecord without STI therefore no instance method
  class Event
    class << self
      extend Forwardable

      delegate %i[by_battle append reset attach] => :instance
    end

    include Singleton
    include Publisher

    def initialize
      reset
    end

    def by_battle(id:)
      @events[id] || []
    end

    def append(battle_id:, event:)
      @events[battle_id] ||= []
      @events[battle_id] << event
      notify(battle_id: battle_id, event: event)
    end

    def reset
      @events = {}
    end
  end
end
