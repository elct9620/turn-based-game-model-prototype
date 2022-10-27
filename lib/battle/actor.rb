# frozen_string_literal: true

module Battle
  class Actor
    attr_reader :name

    def initialize(name:)
      @name = name
    end
  end
end
