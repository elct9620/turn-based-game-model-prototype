# frozen_string_literal: true

module ReferenceTestHelper
  def actor_ids
    @actor_ids ||= {}
  end
end

World(ReferenceTestHelper)
