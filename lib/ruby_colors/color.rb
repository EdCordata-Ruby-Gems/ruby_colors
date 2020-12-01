module RubyColors
  class Color

    attr_accessor :hex, :short_hex, :names, :web_safe, :rgb

    def initialize(hex)
      @hex = hex.upcase
      find_color_info
    end

    private

    def find_color_info
      @hex       = ensure_full_hex(@hex)
      @rgb       = ::RubyColors.hex_to_rgb(@hex)
      @names     = ::RubyColors.color_names[@hex] || []
      @web_safe  = ::RubyColors.web_safe_colors.include?(@hex)
      @short_hex = ensure_short_hex(@hex)
    end

    def ensure_full_hex(hex)
      hex = hex.gsub('#', '')
      hex = hex.slice(0, 6)
      hex = "#{hex}000000".slice(0, 6)
      hex
    end

    def ensure_short_hex(hex)
      hex  = hex.gsub('#', '')
      hex  = hex.gsub(/(0*)$/, '')
      hex  = "#{hex}000".slice(0, 3) if hex.length < 3
      hex
    end

  end
end
