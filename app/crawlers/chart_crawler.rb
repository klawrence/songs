require 'mechanize'

class ChartCrawler
  def initialize site
    @agent = Mechanize.new
    @site = site
  end

  def crawl_chart_page path
    entries = []
    page = @agent.get path, [], @site
    table = page.search('table').first
    table.search('tr').each do |row|
      cols = row.search('td')
      if cols.count == 3
        entries << [cols[1].text, cols[2].text]
      end
    end
    entries
  end
end
