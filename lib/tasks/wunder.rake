namespace :wunder do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.wunderground.com/blog/Geary/gearys-sea-of-cortez-weather')
    @title = @page.search('#show-entry:nth-child(1) .article a')
    @title.each do |x|
      @urlugly = x['href']
      @link = "https://www.wunderground.com/" + @urlugly
    end
    Wunderground.create do |x|
      x.title = @title.text
      x.url = @link
    end
  
  end
end