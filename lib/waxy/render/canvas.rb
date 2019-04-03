module Waxy 
  module Render
    module Svg

      # Concept from http://www-cs-students.stanford.edu/~amitp/game-programming/grids/draw_grid.rb
      class Canvas

        attr_accessor :width, :height
        attr_accessor :body

        def initialize(_width = 1000, _height = 1000)
          @width = _width
          @height = _height 

          @body = ''
        end

        def to_svg
          doc = Waxy::Render::Svg.open_svg(self)
          doc << body 
          doc << Waxy::Render::Svg.close_svg
          doc
        end

      end 
    end
  end
end
