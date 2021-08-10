require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test 'create an artist' do
    artist = Artist.create! name: 'Bob Dylan'
    assert_equal 'bob-dylan', artist.slug
    assert_equal 'Bob Dylan', artist.to_s
  end
end
