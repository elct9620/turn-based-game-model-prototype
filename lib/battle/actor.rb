# frozen_string_literal: true

module Battle
  class Actor
    attr_reader :id, :name, :hp

    def initialize(id:,name:,hp:)
      @id = id
      @name = name
      @hp = hp
    end

    def damaged(amount)
      @hp -= amount
    end
  end
end
