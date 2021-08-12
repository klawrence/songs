require 'mechanize'

class LyricsCrawler
  def initialize site, sitemap
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @site = site
    @sitemap = sitemap
  end

  def crawl_lyrics track
    puts "Fetching #{track}"
    url = "/lyrics/#{slug track.artist.name}/#{slug track.title}"
    unless available_tracks.include? url
      puts 'Not available'
      return
    end

    lyrics = crawl_lyrics_page url
    track.update lyrics: lyrics if lyrics
  end

  def slug text
    text.downcase.gsub(/[^a-z0-9 ]/, '').gsub(/ +/, '-')
  end

  def crawl_lyrics_page path
    page = @agent.get path, [], @site
    lyrics = page.search('.lyrics-results .inner').first
    if lyrics
      lyrics.children.map { |node| node.name.in?(['br', 'span']) ? "\n" : node.text.strip }.join
    else
      puts page.search('body h1').first.text
      raise 'No lyrics found'
    end
  end

  def available_tracks
    return @tracks if @tracks

    doc = File.open(@sitemap) { |f| Nokogiri::XML(f) }
    @tracks = Set.new doc.css('loc').map(&:text).map{|url| url.gsub(/https:\/\/.+?\//, '/') }
  end
end
