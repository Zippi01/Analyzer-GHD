class ParserSitesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def index
    source = 'http://shop1759.tk/'
    page = Nokogiri::HTML(open(source.to_s))
    puts page
  end
end
