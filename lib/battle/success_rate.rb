# frozen_string_literal: true

module Battle
  class SuccessRate < Numeric
    VALID_RANGE = (0..100).freeze

    def initialize(rate)
      raise ArgumentError, 'invalid rate' unless VALID_RANGE.include?(rate)

      super()
      @rate = rate
      @successful = rate > rand * 100
    end

    def to_i
      @rate
    end

    def to_f
      @rate.to_f / 100
    end

    def successful?
      @successful == true
    end

    def next
      SuccessRate.new(@rate)
    end

    def <=>(other)
      to_i <=> other.to_i
    end

    def +(other)
      SuccessRate.new([to_i + other.to_i, VALID_RANGE.max].min)
    end

    def -(other)
      SuccessRate.new([to_i - other.to_i, VALID_RANGE.min].max)
    end

    def *(other)
      SuccessRate.new(to_f * other * 100)
    end

    def /(other)
      HealthPoint.new([(to_f / other) * 100, VALID_RANGE.max].min)
    end
  end
end
