namespace :test do
  task test: :environment do
    
@a = Mechanize.new
@page = @a.get('http://www.petethomasoutdoors.com')
@title = @page.search('#entry-6a0120a77b966b970b01b7c884ea86970b .entry-header a')
@date = @page.search('#alpha-inner > .date-header:nth-child(3)')

  @title.each do |x|
    @url = x['href']
  end  

pp @title.text
pp @date.text
pp @url
  
  end
end