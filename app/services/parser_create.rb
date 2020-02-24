class ParserCreate < ApplicationService
  attr_reader :page

  def initialize(page)
    @page = page
  end

  def call
    @page.css('section.product-comments div.product-comments__header h2.product-tabs__heading span.product-tabs__heading_color_gray').each do |link|
      @comments_count = link.content
    end

    puts @comments_count
    @pages = @comments_count.to_f
    while (@pages. % 10) < 6
      puts @pages += 1
    end
     @pages /= 10.0
     puts @pages.round
  end
end
