module Waxy 
  module Geometry

    class Layout

      # Waxy::Geometry::Orientation
      attr_accessor :orientation

      # Waxy::Geometry::Point
      attr_accessor :size

      # Waxy::Geometry::Point
      attr_accessor :origin

      # pixels between hexes
      # !! Padding is applied at render time, not geometry compute time, i.e. using this will currently 
      # !! break things like pixel_to_hex
      attr_accessor :padding

      attr_reader :pad_h_offset, :pad_w_offset

      def initialize(_orientation, _size, _origin, _padding = 0.0) 
        @orientation = _orientation
        @size = _size
        @origin = _origin 
        @padding = _padding
        reset_padding
      end

      def hex_to_pixel(hex)
        m = orientation
        x = (m.f0 * hex.q + m.f1 * hex.r) * size.x
        y = (m.f2 * hex.q + m.f3 * hex.r) * size.y

        Waxy::Geometry::Point.new(x + origin.x,  y + origin.y)
      end

      def pixel_to_hex(p)
        m = orientation
        pt = Waxy::Geometry::Point.new((p.x - origin.x) / size.x,
                                       (p.y - origin.y) / size.y)
        q = m.b0 * pt.x + m.b1 * pt.y
        r = m.b2 * pt.x + m.b3 * pt.y

        Waxy::Geometry::FractionalHex.new(q, r, q * -1.0,  r * -1.0)
      end

      # @param corner [Integer]
      def hex_corner_offset(corner, s = nil)
        s ||= size
        angle = hex_corner_angle(corner)
        Waxy::Geometry::Point.new(s.x * Math.cos(angle), s.y * Math.sin(angle))
      end

      # @param corner [Integer]
      def hex_corner_angle(corner)
        2.0 * Math::PI * (orientation.start_angle + corner) / 6
      end

      # @params h [Waxy::Geometry::Hex]
      def polygon_corners(h)
        corners = []
        center = hex_to_pixel(h)
        (0..5).each do |i|
          offset = hex_corner_offset(i) 

          corners.push Waxy::Geometry::Point.new(
            center.x + offset.x,
            center.y + offset.y)
        end
        corners
      end

      # Departing from Redblob here

      def point(hex, i, scale = 1.0 )
        center = hex_to_pixel(hex)

        resized = size.dup
        resized.x = resized.x * scale
        resized.y = resized.y * scale 

        offset = hex_corner_offset(i, resized)

        Waxy::Geometry::Point.new( center.x + offset.x, center.y + offset.y  ) 
      end

      def triangle(hex, i)
        scale = hex.size[i]

        points = [ hex_to_pixel(hex) ] 
        points.push point(hex, i, scale)
        points.push point(hex, (i + 1 == 6 ? 0 : i + 1), scale) 
        points
      end

      def triangles(hex)
        (0..5).each_with_index.collect{|t,i| triangle(hex, i) }
      end

      #
      #    Padding methods are not part of Amit's original code. They are not integrated into geometry compute.
      #
      
      def reset_padding
        reset_h_padding
        reset_w_padding
      end

      def reset_h_padding
        @pad_h_offset = 0.0
      end

      def reset_w_padding
        @pad_w_offset = 0.0
      end

      def increase_h_padding
        @pad_h_offset += padding
      end

      def increase_w_padding
        @pad_w_offset += padding
      end

    end

  end
end

