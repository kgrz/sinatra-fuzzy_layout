require "sinatra/base"
require_relative "fuzzy_layout/fuzzy_layout_templates.rb"
require_relative "fuzzy_layout/extension_methods.rb"
require_relative "fuzzy_layout/test_helpers.rb"

module Sinatra
  module FuzzyLayout
    def self.registered(base)
#      base.extend(FuzzyLayoutTemplates)
      base.extend(ExtensionMethods)
    end

  end

  register FuzzyLayout
  Delegator.delegate :enable_layout_for, :disable_layout_for
end
