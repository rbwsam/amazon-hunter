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
    end
  end

end