require 'json'
require_relative 'ruby_colors/version'
require_relative 'ruby_colors/color'


module RubyColors


  def self.by_hex(hex)
    ::RubyColors::Color.new(hex)
  end


  def self.by_rgb(*rgb)
    ::RubyColors::Color.new(::RubyColors.rgb_to_hex(rgb))
  end


  def self.by_name(name)
    hex = ::RubyColors
            .color_names
            .select { |_hex, names| names.map(&:downcase).include?(name.downcase) }
            .map    { |hex, _names| hex }
            .first

    ::RubyColors::Color.new(hex) if hex
  end


  def self.rgb_to_hex(*rgb)
    [rgb]
      .flatten
      .map { |c| "00#{c.to_s(16)}".slice(-2, 2) }
      .join('')
      .upcase
  end


  def self.hex_to_rgb(h)
    r = 0, g = 0, b = 0
    h = h.gsub('#', '')

    if h.length == 3
      r = h.slice(0, 1).to_i(16)
      g = h.slice(1, 1).to_i(16)
      b = h.slice(2, 1).to_i(16)
    elsif h.length == 6
      r = h.slice(0, 2).to_i(16)
      g = h.slice(2, 2).to_i(16)
      b = h.slice(4, 2).to_i(16)
    end

    [r, g, b]
  end


  def self.color_names
    ::JSON.parse(
      ::File.read(
        ::File.join(::File.dirname(__FILE__), 'ruby_colors/color_names.json'),
        encoding: 'UTF-8'
      )
    )
  end


  def self.web_safe_colors
    ::JSON.parse(
      ::File.read(
        ::File.join(::File.dirname(__FILE__), 'ruby_colors/web_safe_colors.json'),
        encoding: 'UTF-8'
      )
    )
  end


end
