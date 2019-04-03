module Waxy 
  module Render
    module Svg

      TEMPLATE_PATH = File.join(__dir__, 'templates').freeze

      def self.open_svg(canvas)
        t = Tilt.new(File.join(TEMPLATE_PATH, 'open_svg.erb'))
        t.render(canvas)
      end

      def self.close_svg
        t = Tilt.new(File.join(TEMPLATE_PATH, 'close_svg.erb'))
        t.render
      end

      def self.hexagon(layout, hex, color = 'black')
        t = Tilt.new(File.join(TEMPLATE_PATH, 'hex.erb'))
        t.render(layout, hex: hex, color: color)
      end

      def self.hex_pie(layout, hex, meta = Waxy::Meta.new)
        hex.size = meta.size
        t = Tilt.new(File.join(TEMPLATE_PATH, 'hex_pie.erb'))
        s = t.render(layout, hex: hex, meta: meta)
      end

      # A spiral layout that is continuous from an
      # empty center.
      # TODO: use a theta/spiral calc and pixel_to_hex
      # to simplify(?) the algorithim
      def self.spiral(layout, radius, metadata)
        str = ''
        hex = Waxy::Geometry::Hex.new( 0, 0, nil)
        directions = [2, 3, 4, 5]

        (0..radius).each do |r|
          (0..r).each do |z|
            hex = hex.hex_neighbor(0) 
            str <<  Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop )
            return str if metadata.size == 0
          end

          (0..r - 1).each do |o|
            hex = hex.hex_neighbor(1) 
            str << Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop )
            return str if metadata.size == 0
          end

          directions.each do |v1|
            (0..r).each do |y|
              hex = hex.hex_neighbor(v1) 
              str << Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop)
              return str if metadata.size == 0
            end
          end
        end
        str
      end

      # Code directly from Amit/RedBlob games 
      # This is for known radius, if you don't
      # have enough hexes it won't render a full hexagon,
      # "painted" because it completes in bands
      def self.painted_hexagon(layout, map_radius, metadata)
        str = ''
        ((-1 * map_radius)..(map_radius - 1)).each do |q|
          r1 = [(-1 * map_radius), (-1 * q) - map_radius].max
          r2 = [map_radius, (-1 * q) + map_radius].min

          (r1 ... r2 - 1).each do |r|
            hex = Waxy::Geometry::Hex.new( q, r, ((-1 * q) - r))
            str << Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop)

            return str if metadata.size == 0
          end
        end
        str
      end

      # Map for Square
      def self.square(layout, metadata)
        str = ''
        h = Math.sqrt(metadata.size).to_i

        (0..h).each do |r|
          (0..h).each do |j|
            return str if metadata.size == 0
            q = j - (r/2).floor
            hex = Waxy::Geometry::Hex.new(q, r)
            str << Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop)
          end
        end
        str
      end


      def self.rectangle(layout, metadata, w = 10, h = 10)
        str = ''

        (0..h).each do |r|
          layout.reset_w_padding
          (0..w).each do |j|
            return str if metadata.size == 0
            q = j - (r/2).floor
            hex = Waxy::Geometry::Hex.new(q, r)
            str << Waxy::Render::Svg.hex_pie(layout, hex, metadata.pop)
            layout.increase_w_padding
          end
          layout.increase_h_padding
        end
        str
      end


      # Interesting capped layout 
      # r = i
      # q = j - [0, r - j].max 

      # Point top triangle
      # r = i
      # q = j - [0, j - r].max 

      # Upside down triangle
      # r = i
      # q = j - r - [0,  (j - r)].max

      # left pointing triangle
      #   r = i
      #   q = j - r - [0,  (j - r)].max 

    end 
  end
end
