# frozen_string_literal: true

module Battle
  module Publisher
    def observers
      @observers ||= {}
    end

    def attach(observer)
      observers[observer.id] ||= []
      observers[observer.id] << observer
    end

    def notify(battle_id:, event:)
      observers[battle_id]&.each { |observer| observer.apply event }
    end
  end
end
