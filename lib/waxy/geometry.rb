require_relative 'geometry/point'
require_relative 'geometry/layout'
require_relative 'geometry/hex'
require_relative 'geometry/fractional_hex'
require_relative 'geometry/orientation'

module Waxy 

  # This is an implmentation of https://www.redblobgames.com/grids/hexagons/implementation.html.
  # Thank you for that wonderful tutorial.
  module Geometry

    # TODO(matt) not right to be here
    h = Waxy::Geometry::Hex

    SIZE = 10.0 

    # https://www.redblobgames.com/grids/hexagons/#neighbors-axial
    # POINTY
    # q, r, s
    HEX_DIRECTIONS_FLAT = [
      h.new( 1, 0,  -1),
      h.new( 0, 1, -1),
      h.new( -1, 1, 0),
      h.new(-1, 0,  1),
      h.new(0, -1,  1),
      h.new( 1, -1, 0)
    ]

    HEX_DIRECTIONS_POINTY = [
      h.new(0, 1, -1),
      h.new(-1, 1, 0),
      h.new(-1, 0, 1),
      h.new(0, -1, 1),
      h.new(1, -1, 0),
      h.new(1, 0, -1)
    ]

    def self.point(center, size, i)
      angle_deg = 60.0 * i
      angle_rad = Math::PI / 180 * angle_deg
      return ((center.x + size) * Math.cos(angle_rad)), ((center.y + size ) * Math.sin(angle_rad))
    end

    def self.hexagon(center, size)
      Hex.new(   
              outer_coords: (1..6).collect{|i| point(center, size, i)} 
             ) 
    end

    def self.triangle(center, size, i)
      points = [[0,0]]
      points.push point(center, size, i)
      points.push point(center, size, (i + 1 == 7 ? 1 : i + 1)) 
      points
    end
  end
end


