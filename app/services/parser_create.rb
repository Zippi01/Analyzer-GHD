class ParserCreate < ApplicationService
  attr_reader :page

  def initialize(page, source)
    @page = page
    @source = source["url"]
  end

  def call
    @page.css('section.product-comments div.product-comments__header h2.product-tabs__heading span.product-tabs__heading_color_gray').each do |link|
      @comments_count = link.content
    end

    puts "comments count", @comments_count
    @pages = @comments_count.to_f
    while (@pages. % 10) < 6
      @pages += 1
    end
    @pages /= 10.0
    puts "pages count", @pages.round
    get_id_product_from_url
    puts @source
  end

  def get_id_product_from_url
    @source = @source.match("p[0-9]+").to_s.gsub(/p/, '')
  end
end
