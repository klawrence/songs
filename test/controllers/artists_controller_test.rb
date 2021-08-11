require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elvis = Artist.create! name: 'Elvis Presley'
    @bob = Artist.create! name: 'Bob Dylan'
    @suzi = Artist.create! name: 'Suzi Quattro'

    @bob.tracks.create! title: 'Blowing in the Wind'
    @bob.tracks.create! title: 'Idiot Wind'
    @elvis.tracks.create! title: 'Heartbreak Hotel'
  end


  test 'show a list of artists' do
    get artists_url
    assert_response :success

    assert_select '.artists-list' do
      assert_select '.artist', 3
      assert_select '.artist:nth-of-type(1)' do
        assert_select '.name', 'Bob Dylan'
      end
    end
  end
end
