require 'spec_helper'

describe Website do
  let(:website) { Website.new 'http://www.toonhole.com' }

  describe '#find_author' do
    let(:page) { Page.new '/2013/01/goodbye-cruel-world/', '119,488' }

    it 'should set page author to Chris' do
      website.find_author page, "a[rel='tag']"
      page.author.should == 'Chris'
    end
  end

  describe '#add_page' do
    let(:page) { double() }

    before(:each) do
      page.stub(:path) { '' }
      page.stub(:view_count) { 0 }
    end

    it 'should increase page count by one' do
      lambda {
        website.add_page page
      }.should change(website.pages, :count).from(0).to(1)
    end
  end
end
