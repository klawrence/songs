crawler = ChartCrawler.new 'https://www.uk-charts.top-source.info'

crawler.crawl_chart '1950s', '/1952-to-1959.shtml'

year = 1960
while year < 2030
  crawler.crawl_chart "#{year}s", "/#{year}-to-#{year + 9}.shtml"
  year += 10
end
