# frozen_string_literal: true

module Battle
  # Health Point
  #
  # @since 0.1.0
  class HealthPoint < Numeric
    VALID_RANGE = (0..9999).freeze

    def initialize(value)
      super()
      @value = value.to_i
    end

    def to_i
      @value
    end

    def <=>(other)
      to_i <=> other.to_i
    end

    def +(other)
      HealthPoint.new([to_i + other.to_i, VALID_RANGE.max].min)
    end

    def -(other)
      HealthPoint.new([to_i - other.to_i, VALID_RANGE.min].max)
    end

    def *(other)
      HealthPoint.new(to_i * other.to_i)
    end

    def /(other)
      HealthPoint.new(to_i / other.to_i)
    end
  end
end
