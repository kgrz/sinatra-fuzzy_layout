require "sinatra/base"

class Array
  def has_the_template?(arg)
    self.select { |x| x.check arg }.any?
  end
end

class Regexp
  def check(arg)
    false
    true if self =~ arg
  end
end

class String
  def check(arg)
    self === arg.to_s
  end
end


class Symbol
  def check(arg)
    self === arg.to_sym
  end
end

module Sinatra

  module FuzzyLayout

    module TemplatesHelpers
      include Sinatra::Templates

      def render(engine, data, options = {}, locals = {}, &block)
        options = get_new_options_and_template(options, data)
        super
      end

      private

      def get_new_options_and_template(options, template)
        if settings.enable_list.has_the_template?(template)
          options[:layout] = true
        elsif settings.disable_list.has_the_template?(template)
          options[:layout] = false
        end

        options
      end
    end

    def enable_layout_for(*templates)
      Base.set :enable_list, templates || []
    end

    def disable_layout_for(*templates)
      Base.set :disable_list, templates || []
    end

    def self.registered(app)
      app.helpers FuzzyLayout::TemplatesHelpers
    end
  end

  register FuzzyLayout
end

