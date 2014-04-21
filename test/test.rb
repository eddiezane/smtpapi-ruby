require "test/unit"
require "./lib/smtpapi"

class SmtpapiTest < Test::Unit::TestCase
  def test_empty
    header = Smtpapi::Header.new
    assert_equal("{}",header.json_string)
  end

  def test_add_to
    header = Smtpapi::Header.new
    header.add_to('you@youremail.com')
    header.add_to('other@otheremail.com', 'Other Name')
    assert_equal("{\"to\":[\"you@youremail.com\",\"Other Name <other@otheremail.com>\"]}",header.json_string)
  end

  def test_set_tos
    header = Smtpapi::Header.new
    header.set_tos(['you@youremail.com', 'other@otheremail.com'])
    assert_equal("{\"to\":[\"you@youremail.com\",\"other@otheremail.com\"]}",header.json_string)
  end

  def test_add_substitution
    header = Smtpapi::Header.new
    header.add_substitution('keep', ['secret'])        # sub = {keep: ['secret']}
    header.add_substitution('other', ['one', 'two'])   # sub = {keep: ['secret'], other: ['one', 'two']}
    assert_equal("{\"sub\":{\"keep\":[\"secret\"],\"other\":[\"one\",\"two\"]}}",header.json_string)
  end

  def test_set_substitutions
    header = Smtpapi::Header.new
    header.set_substitutions({'keep' => ['secret']})  # sub = {'keep': ['secret']}
    assert_equal("{\"sub\":{\"keep\":[\"secret\"]}}",header.json_string)
  end

  def test_add_section
    header = Smtpapi::Header.new
    header.add_section('-charge-', 'This ship is useless.')
    header.add_section('-bomber-', 'Only for sad vikings.')
    assert_equal("{\"section\":{\"-charge-\":\"This ship is useless.\",\"-bomber-\":\"Only for sad vikings.\"}}",header.json_string)
  end

  def test_set_sections
    header = Smtpapi::Header.new
    header.set_sections({'-charge-' => 'This ship is useless.'})
    assert_equal("{\"section\":{\"-charge-\":\"This ship is useless.\"}}",header.json_string)
  end

  def test_add_unique_arg
    header = Smtpapi::Header.new
    header.add_unique_arg('cat', 'dogs')
    assert_equal("{\"unique_args\":{\"cat\":\"dogs\"}}",header.json_string)
  end

  def test_set_unique_args
    header = Smtpapi::Header.new
    header.set_unique_args({'cow' => 'chicken'})
    header.set_unique_args({'dad' => 'proud'})
    assert_equal("{\"unique_args\":{\"dad\":\"proud\"}}",header.json_string)
  end

  def test_add_category
    header = Smtpapi::Header.new
    header.add_category('tactics') # category = ['tactics']
    header.add_category('advanced') # category = ['tactics', 'advanced']
    assert_equal("{\"category\":[\"tactics\",\"advanced\"]}",header.json_string)
  end

  def test_set_categories
    header = Smtpapi::Header.new
    header.set_categories(['tactics', 'advanced']) # category = ['tactics', 'advanced']
    assert_equal("{\"category\":[\"tactics\",\"advanced\"]}",header.json_string)
  end

  def test_add_filter
    header = Smtpapi::Header.new
    header.add_filter('footer', 'enable', 1)
    header.add_filter('footer', 'text/html', '<strong>boo</strong>')
    assert_equal("{\"filters\":{\"footer\":{\"settings\":{\"enable\":1,\"text/html\":\"<strong>boo</strong>\"}}}}",header.json_string)
  end

  def test_set_filters
    header = Smtpapi::Header.new
    filter = {
      'footer' => {
        'setting' => {
          'enable' => 1,
          "text/plain" => 'You can haz footers!'
        }
      }
    }
    header.set_filters(filter)
    assert_equal("{\"filters\":{\"footer\":{\"setting\":{\"enable\":1,\"text/plain\":\"You can haz footers!\"}}}}",header.json_string)
  end

  def test_add_category_unicode
    header = Smtpapi::Header.new
    header.add_category('天破活殺') # category = ['天破活殺']
    header.add_category('南斗鳳凰拳') # category = ['天破活殺', '南斗鳳凰拳']
    assert_equal("{\"category\":[\"\\u5929\\u7834\\u6d3b\\u6bba\",\"\\u5357\\u6597\\u9cf3\\u51f0\\u62f3\"]}",header.json_string)
  end

end
