# frozen_string_literal: true

module ContextTestHelper
  def prepare_context
    @prepare_context ||= Battle::Contexts::PrepareContext.new(@battle)
  end
end

World(ContextTestHelper)
