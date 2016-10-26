namespace :rancho do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://www.rancholeonero.com/fishing_boat/fiishing_fish_report.html')
    @title = @page.search('p font')
    @y = @title.text.strip
    @p = @y.split("\n")
    @date = @page.search('.blue_black_bg font font bold').text
    Rancho.create do |x|
      x.title = @p.third
      x.date = @date
      x.url = 'http://www.rancholeonero.com/fishing_boat/fiishing_fish_report.html'
    end
    
  end
end