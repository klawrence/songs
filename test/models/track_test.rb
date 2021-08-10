require "test_helper"

class TrackTest < ActiveSupport::TestCase
  setup do
    @dylan = Artist.create! name: 'Bob Dylan'
  end

  test 'an artist can have multiple tracks' do
    track = @dylan.tracks.create! title: 'Mr Tambourine Man'
    assert_equal 'mr-tambourine-man', track.slug
    assert_equal 'Bob Dylan', track.artist.name
    assert_equal 'Mr Tambourine Man — Bob Dylan', track.to_s
  end
end
