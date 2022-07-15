#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      raw.split(' - ')[0].to_s.tidy.gsub(/^Dr\. ?/, '').gsub(/^The Hon. ?/, '')
    end

    def position
      raw.split(' - ')[1].to_s.tidy
    end

    def raw
      noko.text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.menu_ministers .mx-name-container1')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
