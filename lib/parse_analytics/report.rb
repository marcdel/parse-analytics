class Report
  def initialize analytics, website
    @analytics = analytics
    @website = website

    add_pages
  end

  def render
    calculate_totals
    return '' if @totals.empty?

    report = "Total (non-home page) views: #{@grand_total}"
    report << "\n------------------"
    report << "\nPer User page views"
    @totals.each do |author, view_count|
      report << "\n#{author}: #{view_count} (#{get_percent(view_count)}%)"
    end

    return report
  end

  def calculate_totals
    @totals = Hash.new
    @grand_total = 0

    @website.pages.each do |page|
      @totals[page.author] = 0 if @totals[page.author].nil?

      view_count = page.view_count.to_i
      @totals[page.author] += view_count
      @grand_total += view_count
    end
  end

  def get_percent view_count
    ((view_count.to_f / @grand_total.to_f) * 100).round(2)
  end

  def add_pages
    @analytics.parse.each do |row|
      next unless row[0].start_with? '/' and row[0] != '/'

      page = Page.new row[0], row[1]
      @website.find_author page, "a[rel='tag']"
      @website.add_page page
    end
  end
end
