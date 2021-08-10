require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test 'artist has a slug' do
    artist = Artist.create! name: 'Bob Dylan'
    assert_equal 'bob-dylan', artist.slug
  end
end
