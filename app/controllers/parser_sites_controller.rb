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
    # page.css('div.product-comment div.product-comment__inner div.product-comment__body p').each do |link|
      # word = link.content.split(" ")
      # word.each do |element|
      #   puts element.gsub(/[!@%&",?.]/,'').downcase
      # end
      # @parser_site = ParserSite.new(:comment => link.content.to_s, :url => source["url"])
      # @parser_site.save
    # end
    ParserCreate.call(page, source)
  end

  private

  def parser_pages_params
    params.require(:parser_site).permit(:url)
  end
end
