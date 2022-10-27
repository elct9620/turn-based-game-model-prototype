# frozen_string_literal: true

module Battle
  module Aggregable
    extend ActiveSupport::Concern

    def apply(event, target: self)
      aggregator = self.class.aggregators[event.class]
      raise NotImplementedError, "#{self.class} not handle #{event.class}" if aggregator.nil?

      target.instance_exec(event, &aggregator)
    end

    class_methods do
      def aggregators
        @aggregators ||= {}
      end

      def on(event, &block)
        @aggregators ||= {}
        @aggregators[event] = block
      end
    end
  end
end
