# frozen_string_literal: true

module Battle
  # The aggregate root of battle
  #
  # @since 0.1.0
  class Stage
    def initialize(io)
      @io = io
    end

    def join(name)
      @io.puts "#{name}加入戰鬥"
    end
  end
end
