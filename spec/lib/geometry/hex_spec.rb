require 'waxy/geometry/hex'

RSpec.describe Waxy::Geometry::Hex do

  let(:hex) { Waxy::Geometry::Hex }

  it "initializes" do
    expect(Waxy::Geometry::Hex.new(1,2,3)).not_to be nil
  end

  context 'operations' do
    let(:a) { Waxy::Geometry::Hex.new(0,0,0) }
    let(:b) { Waxy::Geometry::Hex.new(1,1,1) }

    specify '==' do
      expect(a == b).to be_falsey
    end

    specify '-' do
      expect((a - b) == hex.new(-1, -1, -1) ).to be_truthy
    end

    specify '+' do
      expect((a + b) == hex.new(1, 1, 1) ).to be_truthy
    end

    specify '*' do
      expect((b * 4) == hex.new(4, 4, 4) ).to be_truthy
    end

    specify 'hex_length' do
      expect(a.hex_length(hex.new(5,5,5))).to eq(7) # maybe not right
    end

    specify 'distance' do
      expect(a.hex_length(b)).to eq(1) # maybe not right
    end

    specify 'hex_direction' do
      expect(a.hex_direction(0)).to eq( hex.new(1, 0, -1) )
    end

    specify 'hex_neighbor' do
      expect(b.hex_neighbor(0)).to eq( hex.new(2, 1, 0) )
    end

  end

end
