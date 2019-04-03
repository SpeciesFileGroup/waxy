require 'waxy/geometry/point'

RSpec.describe Waxy::Geometry::Point do
  it "initializes" do
    expect(Waxy::Geometry::Point.new(0,0)).not_to be nil
  end
end
