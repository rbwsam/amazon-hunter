require 'spec_helper'

describe 'Amazon::Hunter' do

  describe '::lookup' do
    it 'takes an ASIN and returns an Amazon::Item' do
      Amazon::Hunter.lookup('B000W73M10').should be_an_instance_of Amazon::Item
    end
  end

end