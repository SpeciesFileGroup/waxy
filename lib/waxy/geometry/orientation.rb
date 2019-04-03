module Waxy 
  module Geometry

    class Orientation
      attr_accessor :f0, :f1, :f2, :f3,
        :b0, :b1, :b2, :b3,
        :start_angle

      def initialize(_f0, _f1, _f2, _f3, _b0, _b1, _b2, _b3, _start_angle)
        @f0 = _f0
        @f1 = _f1
        @f2 = _f2
        @f3 = _f3
        @b0 = _b0
        @b1 = _b1
        @b2 = _b2
        @b3 = _b3
        @start_angle = _start_angle
      end

      LAYOUT_POINTY = Orientation.new( 
        Math.sqrt(3.0), 
        Math.sqrt(3.0) / 2.0,
        0.0,
        3.0 / 2.0,
        Math.sqrt(3.0) / 3.0,
        -1.0 / 3.0,
        0.0,
        2.0 / 3.0,
        0.5
      )

      LAYOUT_FLAT = Orientation.new( 
        3.0 / 2.0,
        0.0,
        Math.sqrt(3.0) / 2.0,
        Math.sqrt(3.0),
        2.0 / 3.0,
        0.0,
        -1.0 / 3.0,
        Math.sqrt(3.0) / 3.0,
        0.0
      ) 


    end

  end
end

