require 'spec_helper'

describe Report do
  let(:analytics) { double() }
  let(:website) { double() }
  let(:report) { Report.new analytics, website }

  describe '#render' do
    context 'when analytics returns empty array' do
      before(:each) do
        analytics.stub(:parse) { Array.new }
        website.stub(:pages) { Array.new }
      end

      it 'should return empty string' do
        #analytics.should_receive(:parse)
        report.render.should == ''
      end
    end

    context 'when analytics returns two records' do
      before(:each) do
        analytics.stub(:parse) { ['/2013/01/goodbye-cruel-world/', 119,488] } 
      end

      xit 'should return the page views for that page and the user that created it' do
        report.render.should == 'chris: 119,488'
      end
    end
  end
end
