crawler = LyricsCrawler.new 'https://www.songfacts.com/'


# lyrics = crawler.crawl_lyrics_page '/lyrics/the-beatles/eleanor-rigby'

Track.where(lyrics: nil).each do |track|
  crawler.crawl_lyrics track

  if track.lyrics.present?
    interval = 180 + rand(60)
    puts "Sleeping #{interval}"
    sleep(interval)
  end
end
