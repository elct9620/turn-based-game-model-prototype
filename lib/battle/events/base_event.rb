# frozen_string_literal: true

module Battle
  module Events
    # :nodoc:
    class BaseEvent
      def to_s
        raise NotImplementedError
      end

      def to_h
        raise NotImplementedError
      end
    end
  end
end
