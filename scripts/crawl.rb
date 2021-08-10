crawler = ChartCrawler.new 'https://www.uk-charts.top-source.info'


entries = crawler.crawl_chart_page '/1952-to-1959.shtml'
chart = Chart.create! name: '1950s'
chart.create_chart_entries entries

year = 1960
while year < 2030
  entries = crawler.crawl_chart_page "/#{year}-to-#{year + 9}.shtml"

  chart = Chart.create! name: "#{year}s"
  chart.create_chart_entries entries

  year += 10
end
