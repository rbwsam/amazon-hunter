require 'spec_helper'

describe 'Amazon::Hunter' do

  describe 'config=' do
    it 'sets config from a hash' do
      config = {
          :associate_tag => 'test',
          :AWS_access_key_id => 'test',
          :AWS_secret_key => 'test'
      }
      Amazon::Hunter.config = config
      Amazon::Hunter.config.should eql config
    end
  end

  describe '::lookup' do
    it 'takes an ASIN and returns an Amazon::Item' do
      item = Amazon::Hunter.lookup('B000W73M10')

      item.should be_an_instance_of Amazon::Item
      item.asin.should eql 'B000W73M10'
    end
  end

end