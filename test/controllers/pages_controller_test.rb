require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test 'home page' do
    Chart.create! name: '1950s'
    Chart.create! name: '1960s'

    get home_url
    assert_response :success

    assert_select '.decade', 2
    assert_select '.decade:first-of-type h3', '1950s'
  end
end
