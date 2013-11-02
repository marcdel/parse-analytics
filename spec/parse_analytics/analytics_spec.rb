require 'spec_helper'

describe Analytics do
  describe '#parse' do
    context 'when url is empty' do
      before(:each) do
        @analytics = Analytics.new ''
      end

      it 'should return an empty list' do
        @analytics.parse.should be_empty
      end
    end

    context 'when document contains one path/page view pair' do
      before(:each) do
        @analytics = Analytics.new ''
      end

      xit 'should return one row' do
        @analytics.parse.count.should eql(1)
      end
    end
  end
end
