# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class Stage
    def initialize(io)
      @actors = []
      @io = io
    end

    def join(name)
      actor = Actor.new(name: name)
      @actors << actor
      @io.puts "#{actor.name}加入戰鬥"
    end
  end
end
