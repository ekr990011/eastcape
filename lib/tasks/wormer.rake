namespace :wormer do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://vanwormerresorts.com/fishing-report')
    @title = @page.search('li:nth-child(1) .desc')
    @date = @page.search('li:nth-child(1) span')
    @url = @page.search('li:nth-child(1) .read_more')
    Vm.create do |p|
      p.title = @title.text
      p.url   = @url.attribute('href').text
      p.date  = @date.text
      p.save
    end
    
  end
end