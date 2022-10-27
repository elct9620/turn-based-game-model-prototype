# frozen_string_literal: true

module Battle
  module Aggregable
    extend ActiveSupport::Concern

    included do
      attr_reader :events
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

    def apply(event, target: self)
      aggregator = self.class.aggregators[event.class]
      raise NotImplementedError, "#{self.class} not handle #{event.class}" if aggregator.nil?

      @events ||= []
      @events << event
      target.instance_exec(event, &aggregator)
    end
  end
end
