crawler = LyricsCrawler.new 'https://www.songfacts.com/'


# lyrics = crawler.crawl_lyrics_page '/lyrics/the-beatles/eleanor-rigby'

Track.where(lyrics: nil).each do |track|
  crawler.crawl_lyrics track

  interval = 300 + rand(60)
  puts "Sleeping #{interval}"
  sleep(interval)
end
