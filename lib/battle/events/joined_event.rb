# frozen_string_literal: true

module Battle
  module Events
    # Actor Jointed
    #
    # @since 0.1.0
    class JoinedEvent
      attr_reader :name

      def initialize(name:)
        @name = name
      end

      def to_s
        "#{@name}加入戰鬥"
      end
    end
  end
end
