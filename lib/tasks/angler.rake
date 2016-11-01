namespace :angler do
  task scrape: :environment do
    require 'nokogiri'
    require 'open-uri'
    
    doc = Nokogiri::XML(open("https://eastcapeangler.wordpress.com/feed/"))
    
     @title = doc.xpath('//item').xpath('title').first.text
     @date = doc.xpath('//item').xpath('pubDate').first.text.slice(0..24)
     @url = doc.xpath('//item').xpath('guid').first.text
  
     News.create do |x|
       x.title = @title
       x.date = @date
       x.url = @url
       x.save
     end
    
  end
end