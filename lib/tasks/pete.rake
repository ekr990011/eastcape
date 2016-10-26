namespace :pete do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://www.petethomasoutdoors.com')
    @title = @page.search('#entry-6a0120a77b966b970b01b7c884ea86970b .entry-header a')
    @date = @page.search('#alpha-inner > .date-header:nth-child(3)')
    @title.each do |x|
      @url = x['href']
    end  
    Pete.create do |x|
     x.title = @title.text
     x.date = @date.text
     x.url = @url
     end
     
   end
 end