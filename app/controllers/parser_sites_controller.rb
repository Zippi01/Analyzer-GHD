class ParserSitesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def index
    source = 'https://hard.rozetka.com.ua/kingston_kc_s44240_6f/p70512518/comments/'
    page = Nokogiri::HTML.parse(open(source))
    h3 = page.css('div.product-comment div.product-comment__inner div.product-comment__body p').each do |link|
      puts link.content
    end
  end
end
