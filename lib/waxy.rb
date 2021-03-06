require_relative "waxy/version"
require_relative "waxy/geometry"
require_relative "waxy/render"
require_relative "waxy/meta"

module Waxy 
  class Error < StandardError; end

  COLORS = {
    1 => 'yellow',
    2 => 'orange',
    3 => 'red',
    4 => 'purple',
    5 => 'blue',
    6 => 'green'
  }

end


# total = 100 

# def point(center, size, i)
#   angle_deg = 60.0 * i
#   angle_rad = Math::PI / 180 * angle_deg
#   return ((center.x + size) * Math.cos(angle_rad)), ((center.y + size ) * Math.sin(angle_rad))
# end

# def triangle(center, size, i)
#   points = []
#   points.push [0,0]
#   points.push point(center, size, i)
#   points.push point(center, size, (i + 1 == 7 ? 1 : i + 1)) 
#   points
# end

# def hexagon(sizes)
#   center = Center.new(SIZE, SIZE)
#   triangles = []
#   sizes.each_with_index do |s, i|
#     next if s < 1.0
#     triangles.push triangle(center, s, i.to_f)
#   end 

#   triangles.each_with_index do |t, i| 
#     color = COLORS[i + 1] 
#     puts "<polygon fill=\"#{color}\" class=\"triangle\" points=\"#{t.collect{|p| p.join(',')}.join(' ')}\"></polygon>"
#     puts "<line x1=\"0\" y1=\"0\" x2=\"#{t[1][0]}\" y2=\"#{t[1][1]}\" stroke=\"white\" width=\"2\" />"
#     puts "<line x1=\"0\" y1=\"0\" x2=\"#{t[2][0]}\" y2=\"#{t[2][1]}\" stroke=\"white\" width=\"2\" />"
#   end
# end

# puts '<svg id="image-fill" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="1000" xmlns:xlink="http://www.w3.org/1999/xlink">'

# i = 0.0
# j = 0.0

# total.times.each do |z|
#   sizes = (1..6).collect{|s| rand(0..SIZE) }

#   puts "<g transform=\"translate(#{(i * 50.0)  + 50.0} , #{(j * 50.0 + 50.0)})\">"
#     hexagon(sizes)
#   puts '</g>'
#   i += 1
#   if i > 9 
#     i = 0 
#     j = j + 1
#   end
# end

# puts '</svg>'
