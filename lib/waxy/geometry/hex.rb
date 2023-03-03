module Waxy
  module Geometry
    class Hex

      attr_accessor :q, :r, :s

      # Vector of 6 x (0.0 - 1.0)
      # Used to scale the pie slices
      #   !! @size is typically set during render through a Waxy::Meta

      attr_accessor :size

      # All params are Int
      def initialize(_q, _r, _s = nil)
        @q = _q
        @r = _r
        @s = _s
      end

      # @return [Array]
      #   initialized here for foreseable geometry calculations,
      #   but in general this should be handled through a Meta
      def size
        @size ||= [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
        @size
      end

      def == (b)
        q == b.q && r == b.r && s == b.s
      end

      def != (b)
        !(self == b)
      end

      def + (b)
        Hex.new(q + b.q, r + b.r, ( s ? s + b.s : nil))
      end

      def - (b)
        Hex.new(q - b.q, r - b.r,  (s ? s - b.s : nil))
      end

      # @param a [Hex]
      # @param k [Int]
      def * (k)
        Hex.new(q * k, r * k, (s ? s * k : nil))
      end

      def hex_length(hex)
        ((hex.q.abs + hex.r.abs + hex.s.abs) / 2).to_i
      end

      def distance(b)
        hex_length(self - b)
      end

      def hex_direction(i)
        raise if !(0..5).include?(i)
        HEX_DIRECTIONS_FLAT[i]
      end

      # (0..5, requires modulo prior)
      def hex_neighbor(i)
        self + hex_direction(i)
      end
    end

    #TODO(mjy) fix
    def self.point(center, size, i)
      angle_deg = 60.0 * i
      angle_rad = Math::PI / 180 * angle_deg
      Waxy::Geometry::Point.new(
        ((center.x + size) * Math.cos(angle_rad)),
        ((center.y + size ) * Math.sin(angle_rad))
      )
    end

    def self.hexagon(center, size)
      Hexagon.new(
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
