# smtpapi-ruby

This ruby gem allows you to quickly and more easily generate SendGrid X-SMTPAPI headers.

[![Build Status](https://travis-ci.org/SendGridJP/smtpapi-ruby.svg?branch=master)](https://travis-ci.org/SendGridJP/smtpapi-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'smtpapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smtpapi

## Usage

### Initializing

```ruby
header = Smtpapi::Header.new
```

### json_string

This gives you back the stringified json formatted X-SMTPAPI header. 

```ruby
header = Smtpapi::Header.new
header.json_string
```

### add_to

```ruby
header    = Smtpapi::Header.new
header.add_to('you@youremail.com')
header.add_to('other@otheremail.com')
```

### set_to

```ruby
header    = Smtpapi::Header.new
header.set_tos(['you@youremail.com', 'other@otheremail.com'])
```

### add_substitution

```ruby
header    = Smtpapi::Header.new
header.add_substitution('keep', array('secret'))        # sub = {keep: ['secret']}
header.add_substitution('other', array('one', 'two'))   # sub = {keep: ['secret'], other: ['one', 'two']}
```

### set_substitutions

```ruby
header    = Smtpapi::Header.new
header.set_substitutions({'keep' => 'secret'})  # sub = {keep: ['secret']}
```

### add_unique_arg

```ruby
header    = Smtpapi::Header.new
header.add_unique_arg('cat', 'dogs')
```

### set_unique_args

```ruby
header    = Smtpapi::Header.new
header.set_unique_args({'cow' => 'chicken'})
header.set_unique_args({'dad' => 'proud'})
```

### add_category

```ruby
header    = Smtpapi::Header.new
header.add_category('tactics') # category = ['tactics']
header.add_category('advanced') # category = ['tactics', 'advanced']
```

### set_categories

```ruby
header    = Smtpapi::Header.new
header.set_categories(['tactics', 'advanced']) # category = ['tactics', 'advanced']
```

### add_section

```ruby
header    = Smtpapi::Header.new
header.add_section('-charge-', 'This ship is useless.'])
header.add_section('-bomber-', 'Only for sad vikings.'])
```

### set_sections

```ruby
header    = Smtpapi::Header.new
header.set_sections({'-charge-' => 'This ship is useless.'})
```

### add_filter

```ruby
header    = Smtpapi::Header.new
header.add_filter('footer', 'enable', 1)
header.add_filter('footer', 'text/html', '<strong>boo</strong>')
```

### set_filters

```ruby
header    = Smtpapi::Header.new
filter = { 
  'footer' => { 
    'setting' => { 
      'enable' => 1,
      "text/plain" => 'You can haz footers!'
    }
  }
} 
header.set_filters(filter)
```

## Contributing

1. Fork it ( http://github.com/sendgridjp/smtpapi-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Running Tests

The existing tests in the `test` directory can be run using test gem with the following command:

```bash
rake test
```
