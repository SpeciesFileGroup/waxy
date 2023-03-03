require 'waxy/render'

RSpec.describe 'Svg' do

  let(:layout) { 
    Waxy::Geometry::Layout.new(
      Waxy::Geometry::Orientation::LAYOUT_POINTY,
      Waxy::Geometry::Point.new(10,10),
      Waxy::Geometry::Point.new(0,0),
    ) 
  } 

  let(:metadata) {
    [Waxy::Meta.new ]
  }

  let(:hex) { Waxy::Geometry::Hex.new( 0, 0, 0) }

  specify '.hexagon' do
    expect(Waxy::Render::Svg.hexagon(layout, hex)).to be_truthy 
  end

  specify '.hex_pie' do
    expect(Waxy::Render::Svg.hex_pie(layout, hex)).to be_truthy 
  end

  specify '.rectangle' do
    expect(Waxy::Render::Svg.rectangle(layout, metadata)).to be_truthy 
  end

  # https://www.redblobgames.com/grids/hexagons/#map-storage
  specify '.rectangle_coords' do
    expect(Waxy::Render::Svg.rectangle_coords(2, 2)).to  contain_exactly([[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[-1, 2], [0, 2], [1, 2]])
  end

  specify '.square' do
    expect(Waxy::Render::Svg.square(layout, metadata)).to be_truthy 
  end

end
