require 'nokogiri'
require 'open-uri'

class Website
  attr_reader :pages

  def initialize url
    @url = url
    @pages = Array.new
  end

  def find_author page, selector
    html = Nokogiri::HTML(open(@url + page.path))
    page.author = html.css(selector).text
  end

  def add_page page
    @pages << page
  end
end
