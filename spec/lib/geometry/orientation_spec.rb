require 'waxy/geometry/orientation'

RSpec.describe Waxy::Geometry::Orientation do
  let(:o) { Waxy::Geometry::Orientation } 

  it "initializes" do
    expect(o.new(0,0,0,0,0,0,0,0,0.5)).not_to be nil
  end
end
