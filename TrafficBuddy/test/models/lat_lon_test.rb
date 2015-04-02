require 'test_helper'

class LatLonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @lat_lon = LatLon.new(latitude: 123.123, longitude: 321.321,
                     traffic_event_id: 1)
  end

  test "should be valid" do
    assert @lat_lon.valid?
  end

  test "latitude should be present" do
    @lat_lon.latitude = nil
    assert_not @lat_lon.valid?
  end

  test "longitude should be present" do
    @lat_lon.longitude = nil
    assert_not @lat_lon.valid?
  end

  test "latitude should not be alphabetic" do
    @lat_lon.latitude = "a"
    assert_not @lat_lon.valid?
  end

  test "longitude should not be alphabetic" do
    @lat_lon.longitude = "a"
    assert_not @lat_lon.valid?
  end

  test "latitude should be numerical" do
    @lat_lon.latitude = -123.123
    assert @lat_lon.valid?
  end

  test "longitude should be numerical" do
    @lat_lon.longitude = -123.123
    assert @lat_lon.valid?
  end
end
