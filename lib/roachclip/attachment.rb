module Roachclip
  class Attachment
    attr_accessor :name, :options, :styles

    def initialize(name, options = {})
      self.name    = name.to_sym
      self.options = options.symbolize_keys

      self.styles  = self.options[:styles].map do |key, opts|
        Style.new("#{name}_#{key}", opts) unless key == default_style_name 
      end.compact
    end

    def ==(rhs)
      name == rhs.name
    end

    def default_style_name
      options[:default_style] || :original
    end
  end
end
