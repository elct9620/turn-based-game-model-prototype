# frozen_string_literal: true

module ContextTestHelper
  def prepare_context
    @prepare_context ||= Battle::Contexts::PrepareContext.new(@battle)
  end

  def attack_context
    @attack_context ||= Battle::Contexts::AttackContext.new(@battle)
  end

  def escape_context
    @escape_context ||= Battle::Contexts::EscapeContext.new(@battle)
  end
end

World(ContextTestHelper)
