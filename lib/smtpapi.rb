# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)
require "smtpapi/version"
require "json"

module Smtpapi
  class Header

    attr_reader :to, :sub, :section, :category, :unique_args, :filters, :send_at, :send_each_at

    def initialize
      @to = []
      @sub = {}
      @section = {}
      @category = []
      @unique_args = {}
      @filters = {}
      @send_at = nil
      @send_each_at = []
    end

    def add_to(address, name=nil)
      if address.is_a?(Array)
        @to.concat(address)
      else
        value = address
        value = "#{name} <#{address}>" if name != nil
        @to.push(value)
      end
      self
    end

    def set_tos(addresses)
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
      @filters[filter_name] = {}    if @filters[filter_name] == nil
      @filters[filter_name]['settings'] = {}  if @filters[filter_name]['settings'] == nil
      @filters[filter_name]['settings'][parameter_name] = parameter_value
      self
    end

    def set_filters(filters)
      @filters = filters
      self
    end

    def set_send_at(send_at)
      @send_at = send_at
    end

    def set_send_each_at(send_each_at)
      @send_each_at = send_each_at
    end

    def to_array
      data = {}
      data["to"]  = @to     if @to.length > 0
      data["sub"]   = @sub    if @sub.length > 0
      data["section"]   = @section  if @section.length > 0
      data["unique_args"] = @unique_args if @unique_args.length > 0
      data["category"]  = @category   if @category.length > 0
      data["filters"]   = @filters  if @filters.length > 0
      data["send_at"] = @send_at.to_i if @send_at != nil
      str_each_at = []
      @send_each_at.each {|val|
        str_each_at.push(val.to_i)
      }
      data["send_each_at"] = str_each_at if str_each_at.length > 0
      data
    end
    protected :to_array

    def json_string
      escape_unicode(self.to_array.to_json)
    end
    alias_method :to_json, :json_string

    def escape_unicode(str)
      str.unpack('U*').map{|i| i > 127 ? "\\u#{i.to_s(16)}" : i.chr("UTF-8")}.join
    end

  end
end
