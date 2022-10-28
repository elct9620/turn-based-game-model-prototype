# frozen_string_literal: true

module Battle
  # Health Point
  #
  # @since 0.1.0
  class HealthPoint < Numeric
    def initialize(value)
      @value = value.to_i
    end

    def to_i
      @value
    end

    def <=>(other)
      to_i <=> other.to_i
    end

    def +(other)
      HealthPoint.new(to_i + other.to_i)
    end

    def -(other)
      HealthPoint.new(to_i - other.to_i)
    end

    def *(other)
      HealthPoint.new(to_i * other.to_i)
    end

    def /(other)
      HealthPoint.new(to_i / other.to_i)
    end
  end
end
