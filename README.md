[![Continuous Integration Status][1]][2]

# Waxy

Waxy is an experimental visualization tool to generate SVG hexagons and their layouts, it is in Ruby.

The library is solely possible thanks to the wonderful Amit Patel sharing his knowledge at [the Red Blob Games blog](https://www.redblobgames.com/), in particular [the hexagon tutorial](https://www.redblobgames.com/grids/hexagons/).  Most of the serious code herein is simply an implementation of the metacode therein. All of the misinterpretations and problems are ours, not Amit's!

![random](/examples/img/random.png)
![rectangle](/examples/img/rectangle.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'waxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install waxy

## Usage

_The API will most certainly change if/when the code is deemed more than a playground. Nothing is really optimized._

```Ruby
require 'waxy'

srand

layout = Waxy::Geometry::Layout.new(
  Waxy::Geometry::Orientation::LAYOUT_POINTY,
  Waxy::Geometry::Point.new(20,20), # size
  Waxy::Geometry::Point.new(20, 20), # start
  5.0 # padding
) 

meta = []

(0..400).each do |i|
  a = Waxy::Meta.new
  a.size = (0..5).collect{ rand(0.0..1.0) } 
  a.stroke = 'purple'
  a.link = 'http://127.0.0.1:3000/'
  a.link_title = "RECORD #{i}"
  
  meta.push a 
end

meta.sort!{ |a,b| a.sum_size <=> b.sum_size }

c = Waxy::Render::Svg::Canvas.new(1000, 1000)
c.body << Waxy::Render::Svg.rectangle(layout, meta, 5)
puts c.to_svg
```

then

```Bash
ruby go.rb > svg.html
open svg.html
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SpeciesFileGroup/waxy.

## License

The gem is available as open source under the terms of the [NCSA](https://opensource.org/licenses/NCSA).

[1]: https://secure.travis-ci.org/SpeciesFileGroup/waxy.png?branch=master
[2]: http://travis-ci.org/SpeciesFileGroup/waxy?branch=master

