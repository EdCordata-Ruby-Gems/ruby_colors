require 'active_support/all'
require 'mechanize'
require 'open-uri'


class ColorHexaCom
  COLOR_NAMES_URL     = 'https://www.colorhexa.com/color-names'
  WEB_SAFE_COLORS_URL = 'https://www.colorhexa.com/web-safe-colors'

  def initialize
  end

  def get_color_names
    colors = {}

    get_doc(COLOR_NAMES_URL).css('table.color-list tbody tr').each do |tr|

      # get hex
      hex = tr.css('td')[1].text.gsub('#', '').upcase

      # get name
      name = tr.css('td')[0].text

      colors[hex] = {
        hex:   hex,
        names: [name.titleize]
      }
    end

    colors
  end

  def get_web_safe_colors
    colors = []

    get_doc(WEB_SAFE_COLORS_URL).css('table.color-list tbody tr').each do |tr|
      hex = tr.css('td')[1].text.gsub('#', '')
      colors << hex.upcase if hex
    end

    colors
  end

  private

  def get_doc(url)
    ::Nokogiri.parse(open(url).read)
  end

end


class Wikipedia
  COLOR_NAMES_URL       = 'https://en.wikipedia.org/wiki/List_of_colors_(compact)'

  def initialize
  end

  def get_color_names
    colors = {}

    get_doc(COLOR_NAMES_URL).css('p[title]').each do |p|
      hex = p.attr('title').match(/#([0-9,A-Z]+)/).to_a.last

      if hex
        hex = hex.upcase

        names = p
                  .parent
                  .css('a')
                  .map { |a| a.text.strip.titleize }
                  .reject { |x| x == '' }
                  .flatten

        colors[hex] ||= { names: [] }
        colors[hex][:names] = (colors[hex][:names] + names).uniq
      end
    end

    colors
  end

  private

  def get_doc(url)
    ::Nokogiri.parse(open(url).read)
  end

end


# get all color info
# --------------------------------------------------
hexa_color_names = ColorHexaCom.new.get_color_names
wikipedia_colors = Wikipedia.new.get_color_names
web_safe_colors  = ColorHexaCom.new.get_web_safe_colors
# --------------------------------------------------


# save color names
# --------------------------------------------------
colors_names = {}

hexa_color_names.each do |hex, values|
  hex = hex.upcase
  colors_names[hex] ||= []
  colors_names[hex] = (colors_names[hex] + values[:names]).uniq
end

wikipedia_colors.each do |hex, values|
  hex = hex.upcase
  colors_names[hex] ||= []
  colors_names[hex] = (colors_names[hex] + values[:names]).uniq
end

File.write('lib/ruby_colors/color_names.json', JSON.pretty_generate(colors_names), encoding: 'UTF-8')
# --------------------------------------------------

# save web safe colors
# --------------------------------------------------
File.write('lib/ruby_colors/web_safe_colors.json', web_safe_colors.to_json, encoding: 'UTF-8')
# --------------------------------------------------
