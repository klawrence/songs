require 'mechanize'

class ChartCrawler
  def initialize site
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @site = site
  end

  def crawl_chart name, path
    entries = crawl_chart_page path

    chart = Chart.create! name: name
    chart.create_chart_entries entries
  end

  def crawl_chart_page path
    entries = []

    page = @agent.get path, [], @site
    table = page.search('table').first
    table.search('tr').each do |row|
      cols = row.search('td')
      entries << [cols[1].text, cols[2].text] if cols.count == 3
    end

    entries
  end
end
