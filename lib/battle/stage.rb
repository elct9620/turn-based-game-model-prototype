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
      actor = Actor.new(name: name)
      @actors << actor
      @events << Events::JoinedEvent.new(name: name)
    end
  end
end
