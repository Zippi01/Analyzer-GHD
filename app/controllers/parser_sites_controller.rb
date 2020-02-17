class ParserSitesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def index; end

  def new
    @parser_site = ParserSite.new
  end

  def create
    source = parser_pages_params
    page = Nokogiri::HTML.parse(open(source["url"]))
    page.css('div.product-comment div.product-comment__inner div.product-comment__body p').each do |link|
      # puts link.content
      @parser_site = ParserSite.new(:comment => link.content.to_s, :url => source["url"])
      @parser_site.save
    end
  end

  private

  def parser_pages_params
    params.require(:parser_site).permit(:url)
  end
end
