namespace :test do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @page = @a.get('http://www.x-rates.com/table/?from=MXN&amount=1')
    @dollar = @page.search('.ratesTable:nth-child(4) tr:nth-child(1) .rtRates+ .rtRates a').text.slice(0..4)
    @candollar = @page.search('.ratesTable:nth-child(4) tr:nth-child(6) .rtRates+ .rtRates a').text.slice(0..4)
    
    
    
  end
end