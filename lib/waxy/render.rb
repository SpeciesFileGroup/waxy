require 'erb'
require 'tilt'

require_relative 'render/svg'
require_relative 'render/canvas'

module Waxy

  module Render
    COLORS = {
      1 => 'yellow',
      2 => 'orange',
      3 => 'red',
      4 => 'purple',
      5 => 'blue',
      6 => 'green'
    }

  end
end
