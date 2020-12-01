# Ruby Colors
![Ruby Version](badges/ruby.svg)
[![License](badges/license.svg)](https://creativecommons.org/licenses/by/4.0/)

A simple Ruby library for conversion between color `names`, `HEX`, and `RGB`.


## Installation
Add this line to your application's Gemfile:
```ruby
gem 'ruby_colors'
```
And then execute:
```bash
bundle
```
Or install it yourself as:
```bash
gem install ruby_colors
```


## Usage
```ruby
require 'ruby_colors'

color = ::RubyColors.by_hex('FF0000') 
color = ::RubyColors.by_hex('#FF0000') 

color = ::RubyColors.by_rgb( [255, 0, 0] )
color = ::RubyColors.by_rgb( 255, 0, 0 )

color = ::RubyColors.by_name('red')
color = ::RubyColors.by_name('Red')
color = ::RubyColors.by_name('RED')

color.hex       # => 'FF0000'
color.short_hex # => 'FF0'
color.rgb       # => [0, 0, 0]
color.names     # => ['Red']
color.web_safe  # => true
```


## Helper methods
* `hex_to_rgb`
  ```ruby
  ::RubyColors.hex_to_rgb('#000000') # => [0, 0, 0]
  ::RubyColors.hex_to_rgb('#000')    # => [0, 0, 0]
  ::RubyColors.hex_to_rgb('000')     # => [0, 0, 0]
  ```
* `rgb_to_hex`
  ```ruby
  ::RubyColors.rgb_to_hex( [0, 0, 0] ) # => 00000
  ::RubyColors.rgb_to_hex(0, 0, 0)     # => 00000
  ```
* `color_names`
  ```ruby
  ::RubyColors.color_names
  # => {
  #      'FF0000' => ['Red'],
  #      'B3446C' => [ 'Raspberry Rose', 'Irresistible'],
  #      ...
  #    }
  ```
* `web_safe_colors`
  ```ruby
  ::RubyColors.web_safe_colors
  # => ['000000', '000033', '000066', ... ]
  ```


## Sources
* [ColorHexa.com](https://www.colorhexa.com)
* [Wikipedia - List of Colors](https://en.wikipedia.org/wiki/List_of_colors_(compact))
