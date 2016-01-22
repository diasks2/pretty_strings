# Pretty Strings

[![Gem Version](https://badge.fury.io/rb/pretty_strings.svg)](https://badge.fury.io/rb/pretty_strings) [![Build Status](https://travis-ci.org/diasks2/pretty_strings.png)](https://travis-ci.org/diasks2/pretty_strings) [![License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](https://github.com/diasks2/pretty_strings/blob/master/LICENSE.txt)

Some strings have been abused by being run through many a CAT tool (one too many times). When you only want text and you don't want any inline tags, triple-escaped HTML entities or the like then this gem is for you.

## Installation

Add this line to your application's Gemfile:

**Ruby**  
```
gem install pretty_strings
```

**Ruby on Rails**  
Add this line to your application’s Gemfile:  
```ruby 
gem 'pretty_strings'
```

## Usage

```ruby
text = "&amp;lt;CharStyle:body copy&amp;gt;The Supe&amp;lt;cTracking:-75&amp;gt;r&amp;lt;cTracking:&amp;gt;Track system is easy to set up and use, providing real-time &amp;lt;SoftReturn&amp;gt;insight and stats."
PrettyStrings::Cleaner.new(text).pretty

# => "The SuperTrack system is easy to set up and use, providing real-time insight and stats."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/diasks2/pretty_strings/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2016 Kevin S. Dias

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.