$:.unshift File.dirname(__FILE__) 
require "smtpapi/version"
require "json"

module Smtpapi
  class Header

    def initialize()
      @to = []
      @sub = {}
      @section = {}
      @category = []
      @unique_args = {}
      @filters = {}
    end 

    def add_to(address, name=nil)
      value = address
      value = "#{name} <#{address}>" if name != nil
      @to.push(value)
      self
    end
  
    def set_tos( addresses ) 
      @to = addresses
      self
    end

    def add_substitution(sub, values) 
      @sub[sub] = values
      self
    end

    def set_substitutions(key_value_pairs) 
      @sub = key_value_pairs
      self
    end

    def add_section(key, value)
      @section[key] = value
      self
    end

    def set_sections(key_value_pairs)
      @section = key_value_pairs
      self
    end

    def add_unique_arg(key, value) 
      @unique_args[key] = value
      self
    end

    def set_unique_args(key_value_pairs) 
      @unique_args = key_value_pairs
      self
    end

    def add_category(category) 
      @category.push(category)
      self
    end

    def set_categories(categories)
      @category = categories
      self
    end

    def add_filter(filter_name, parameter_name, parameter_value)
      @filters[filter_name] = {} 		if @filters[filter_name] == nil
      @filters[filter_name]['settings'] = {} 	if @filters[filter_name]['settings'] == nil
      @filters[filter_name]['settings'][parameter_name] = parameter_value
      self
    end

    def set_filters(filters) 
      @filters = filters
      self
    end

    def to_array()
      data = {}
      data["to"] 	= @to 		if @to.length > 0
      data["sub"] 	= @sub 		if @sub.length > 0
      data["section"] 	= @section 	if @section.length > 0
      data["unique_args"] = @unique_args if @unique_args.length > 0
      data["category"] 	= @category 	if @category.length > 0
      data["filters"] 	= @filters 	if @filters.length > 0
      data
    end
    protected :to_array

    def json_string()
      JSON.generate(self.to_array)
    end

  end
end
