require 'open-uri'
require 'csv'

class Analytics
  def initialize url
    @csv = url.empty? ? CSV.new('') : CSV.new(open(url))
  end

  def parse
    rows = Array.new

    @csv.each do |row|
      next if row.nil? or row[0].nil? or row[1].nil? or row[0].start_with? '#'

      rows << row
    end

    rows
  end
end
