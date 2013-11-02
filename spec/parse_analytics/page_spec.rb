require 'spec_helper'

describe Page do
  before(:each) do
    @page = Page.new '', '0'
  end

  it 'should respond to path' do
    @page.should respond_to(:path)
  end

  it 'should respond to view_count' do
    @page.should respond_to(:view_count)
  end

  it 'should respond to author' do
    @page.should respond_to(:author)
  end
end
