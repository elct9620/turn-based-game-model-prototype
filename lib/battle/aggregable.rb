# frozen_string_literal: true

module Battle
  module Aggregable
    extend ActiveSupport::Concern

    included do
      def events
        @events ||= []
      end
    end

    class_methods do
      def aggregators
        @aggregators ||= {}
      end

      def on(event, aggregator = nil, &block)
        aggregators[event] = aggregator&.to_proc || block
      end
    end

    def apply(event, target: self)
      aggregator = self.class.aggregators[event.class]
      raise NotImplementedError, "#{self.class} not handle #{event.class}" if aggregator.nil?

      events << event
      target.instance_exec(event, &aggregator)
    end
  end
end
