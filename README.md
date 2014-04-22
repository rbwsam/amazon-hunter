# Amazon::Hunter

Simple gem for looking up Amazon products.

## Installation

Add this line to your application's Gemfile:

    gem 'amazon-hunter', :git => 'git://github.com/rbwsam/amazon-hunter.git'

And then execute:

    $ bundle

## Usage

```ruby
require 'amazon/hunter'

Amazon::Hunter.config({
  :associate_tag => 'test',
  :AWS_access_key_id => 'test',
  :AWS_secret_key => 'test'
})

item = Amazon::Hunter.lookup('B000TTSXNI')

p item.asin
# B000TTSXNI

p item.brand
# Lasko
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
