module Waxy 
  module Geometry
    
    class Point
      attr_accessor :x, :y

      def initialize(_x, _y)
        @x = _x
        @y = _y
      end

      def hex_to_pixel(layout, h)
        m = layout.orientation
        x = (m.f0 * h.q + m.f1 * h.r) * layout.size.x
        y = (m.f2 * h.q + m.f3 * h.r) * layout.size.y
        return Point.new(x + layout.origin.x, y + layout.origin.y)
      end

      def hex_corner_offset(layout, corner)
        size = Point.new(layout.size)
        angle = 2.0 * M_PI * (layout.orientation.start_angle + corner ) / 6
        Point.new(size.x * cos(angle), size.y * sin(angle)) 
      end



    end

  end
end
