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

  specify '.square' do
    expect(Waxy::Render::Svg.square(layout, metadata)).to be_truthy 
  end

end
