class Page
  attr_accessor :path
  attr_accessor :view_count
  attr_accessor :author

  def initialize path, view_count
    @path = path || ''
    @view_count = view_count.gsub(',', '') || '0'
    @author = ''
  end
end
