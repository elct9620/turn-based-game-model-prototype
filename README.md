NewEra Battle Model Prototype
===

[![Test](https://github.com/elct9620/turn-based-game-model-prototype/actions/workflows/test.yml/badge.svg)](https://github.com/elct9620/turn-based-game-model-prototype/actions/workflows/test.yml)

A plain object battle model for NewEra

## Concept

### Battle Stage

The `Aggregate Root` of a battle

```ruby
module Battle
  class Stage
    # ...
    on Events::AttackEvent do |event|
      # ...
    end
  end
end
```

### Battle Event

The events happened in a battle with the `version` to sort it

```ruby
battle = Battle.new # #<Battle id="UUID">
events = Battle::Event.by_id(battle_id: battle.id)

events.each do |event|
  battle.apply(event)
end

# Latest Battle State
```

### Actor

The "prototype" of player of monster which have HP/MP or other equip / items.
