require "test_helper"

class ChartTest < ActiveSupport::TestCase
  test 'a track has a position in a chart' do
    chart = Chart.create! name: 1965
    chart.create_chart_entries [
                    ['Bob Dylan',     'Mr Tambourine Man'],
                    ['Elvis Presley', 'Heartbreak Hotel'],
                    ['The Beatles',   'Eleanor Rigby'],
                ]

    assert_equal '1965', chart.to_s
    assert_equal 3, chart.entries.count

    assert_equal '1. Mr Tambourine Man — Bob Dylan', chart.entries[0].to_s
    assert_equal '2. Heartbreak Hotel — Elvis Presley', chart.entries[1].to_s
    assert_equal '3. Eleanor Rigby — The Beatles', chart.entries[2].to_s

    assert_equal 1, chart.entries[0].position
    assert_equal 'Mr Tambourine Man — Bob Dylan', chart.entries[0].track.to_s
    assert_equal 'Bob Dylan', chart.entries[0].track.artist.to_s
  end
end
