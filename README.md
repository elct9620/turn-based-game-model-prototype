Battle Model
===

A plain object battle model for NewEra

## Concept

### Battle

The `Aggregate Root` of a battle

### Battle Events

The events happened in a battle with the `version` to sort it

```ruby
battle = Battle.new # #<Battle id="UUID">
events = Battle::Event.by_id(battle_id: battle.id)

events.each do |event|
  battle.apply(event)
end

# Latest Battle State
```

### Battle Command

To update the `Battle` state, we only accept the command

### Actor

The "prototype" of player of monster which have HP/MP or other equip / items.
