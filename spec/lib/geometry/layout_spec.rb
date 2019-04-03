require 'waxy/geometry/layout'

RSpec.describe Waxy::Geometry::Layout do

  let(:l) { Waxy::Geometry::Layout } 
  let(:o) { Waxy::Geometry::Orientation::LAYOUT_POINTY } 
  let(:h) { Waxy::Geometry::Hex }
  let(:p) { Waxy::Geometry::Point } 

  let(:size) { p.new(400,400) }
  let(:origin) { p.new(0,0) }

  let(:layout) { l.new(o, size, origin) }
  let(:hex) { h.new(0,0,0) }

  it "initializes" do
    expect(l.new(nil, nil, nil)).not_to be nil
  end

  specify 'hex_to_pixel' do
    expect( layout.hex_to_pixel( h.new(1,1,1)).y ).to eq (600.0) # hacked in check
  end

  specify 'pixel_to_hex 1' do
    expect( layout.pixel_to_hex( origin ).q ).to eq (0) 
  end

  specify 'pixel_to_hex 2' do
    expect( layout.pixel_to_hex( origin ).r ).to eq (0) 
  end

  specify 'hex_corner_offset' do
    expect( layout.hex_corner_offset( 1 ).y ).to eq (400.0) # hacked in check 
  end

  specify 'polygon_corners' do
    expect( layout.polygon_corners( h.new(1,1,1) ).size).to eq (6) 
  end

  specify 'point' do
    expect(layout.point(hex, 0).x).to be_truthy 
  end

  specify 'triangle' do
    expect(layout.triangle(hex, 0).size).to eq(3) #  be_truthy 
  end

  specify 'triangles' do
    expect(layout.triangles(hex).size).to eq(6) #  be_truthy 
  end

  specify 'hex_corner_angle' do
    expect(layout.hex_corner_angle(0).round(3)).to eq(0.524) # We didn't really calculate this
  end




end
