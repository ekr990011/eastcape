namespace :google do
  task scrape: :environment do
    require 'mechanize'

    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.google.com/search?hl=en&gl=us&tbm=nws&authuser=0&q=east+cape+baja&oq=east+cape+baja&gs_l=news')
    @titles = @page.search('#ires > ol > div > table > tr > td > h3')

    @i = 0
    while @i < 3 do
      @title = @titles[@i].text
      @href_raw = @titles[@i].children.attr('href').value.sub('/url?q=', "")
      @thref_length = @href_raw.length

      # possible other way, notice split /  x.uri.to_s.slice(7..-1).split("&sa")[0]
      @href = @href_raw[0...(@thref_length - 93)]

      Google.create do |y|
        y.title = @title
        y.url = @href
      end
      
      @i += 1
    end
    
    Google.where("created_at < ?", (Time.now - 60.minutes)).destroy_all

  end
end
