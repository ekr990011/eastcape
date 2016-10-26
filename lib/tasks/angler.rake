namespace :angler do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://eastcapeangler.wordpress.com/')
    @title = @page.search('.tag-adventure.tag-roosterfish .post-title a')
    @date = @page.search('.tag-adventure.tag-roosterfish .post-meta a:nth-child(1)')
    News.create do |p|
        p.title = @title.text
        p.url   = @title.attribute('href').text
        p.date  = @date.text
        p.save
    end
    
  end
end