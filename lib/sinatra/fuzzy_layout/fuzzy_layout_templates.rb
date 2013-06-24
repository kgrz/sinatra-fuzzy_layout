module Sinatra

  module FuzzyLayoutTemplates
    include Templates

    def render(engine, data, options={}, locals={}, &block)
      options = get_new_options_and_template(options, data)
      super(engine, data, options, locals, &block)
    end

    private

    def get_new_options_and_template(options, template)
      if enable_layout_set? && template =~ settings.enable_layout
        options[:layout] = true 
      elsif disable_layout_set? && template =~ settings.disable_layout
        options[:layout] = false
      end
      return options
    end

    def enable_layout_set?
      settings.respond_to?(:enable_layout)
    end

    def disable_layout_set?
      settings.respond_to?(:disable_layout)
    end
  end

  class Base
    include FuzzyLayoutTemplates
  end
end
