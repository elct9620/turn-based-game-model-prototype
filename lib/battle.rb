# frozen_string_literal: true

require 'zeitwerk'
require 'active_support/concern'

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__)
loader.setup

module Battle; end
