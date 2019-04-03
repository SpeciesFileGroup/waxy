module Waxy 
  module Geometry

    class FractionalHex

      attr_accessor :q, :r, :mq, :mr

      # Ints
      def initialize(_q, _r, _mq, _mr)
        @q = _q
        @r = _r
        @mq = _mq
        @mr = _mr
      end

   #  def == (b)
   #    q == b.q && r == b.r && s == b.s 
   #  end

   #  def != (b)
   #    !(self == b)
   #  end

   #  def + (b)
   #    Hex.new(q + b.q, r + b.r, s + b.s)
   #  end

   #  def - (b)
   #    Hex.new(q - b.q, r - b.r, s - b.s)
   #  end

   #  # @param a [Hex]
   #  # @param k [Int]
   #  def * (k)
   #    Hex.new(q * k, r * k, s * k)
   #  end 

   #  def hex_length(hex)
   #    ((hex.q.abs + hex.r.abs + hex.s.abs) / 2).to_i
   #  end

   #  def distance(b)
   #    hex_length(self - b)
   #  end

   #  def hex_direction(i)
   #    raise if !(0..5).include?(i)
   #    HEX_DIRECTIONS[i]
   #  end

   #  # (0..5, requires modulo prior)
   #  def hex_neighbor(i)
   #    self + hex_direction(i)
   #  end

   #  def polygon_corners(layout)

   #  end

    end
  end 
end 
