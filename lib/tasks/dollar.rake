namespace :dollar do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://www.x-rates.com/table/?from=MXN&amount=1')
    @dollar = @page.search('.ratesTable:nth-child(4) tr:nth-child(1) .rtRates+ .rtRates a').text.slice(0..4)
    @candollar = @page.search('.ratesTable:nth-child(4) tr:nth-child(6) .rtRates+ .rtRates a').text.slice(0..4)
    Dollar.create do |x|
      x.dollar = @dollar
      x.candollar = @candollar
    end
    
  end
end