require "test_helper"

class TracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elvis = Artist.create! name: 'Elvis Presley'
    @bob = Artist.create! name: 'Bob Dylan'
    @suzi = Artist.create! name: 'Suzi Quattro'

    @blowing = @bob.tracks.create! title: 'Blowing in the Wind',
                                   lyrics: 'The answer is blowing in the wind.'
    @idiot_wind = @bob.tracks.create! title: 'Idiot Wind'
    @hotel = @elvis.tracks.create! title: 'Heartbreak Hotel'
  end

  test 'show a track page' do
    get artist_track_url(@bob, @blowing)
    assert_response :success

    assert_select 'h2.title', 'Blowing in the Wind'
    assert_select 'h3.subtitle', 'Bob Dylan'

    assert_select '.lyrics', 'The answer is blowing in the wind.'
  end
end
