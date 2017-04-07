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



















    # @newsf = @page.form_with(:action => "//www.google.com/search?cf=all&hl=en&pz=1&ned=us")
    # @newsf.q = "east cape baja"
    # @search_results = @a.submit(@newsf)
    # @search = @search_results.links
    # @google_list = ["Search", "Images", "Maps", "Play", "YouTube", "Gmail", "Drive",
                    # "More »", "Web History", "Settings", "Sign in", "", "All", "Images",
                    # "Videos", "Shopping", "Maps", "Books", "Blogs", "Past hour", "Past 24 hours",
                    # "Past week", "Past month", "Past year", "Archives", "Sorted by date",
                    # "2", "3", "4", "5", "6", "7", "8", "9", "10", "Next", "Advanced search",
                    # "RSS", "Search Help", "Send feedback", "Business Solutions", "Privacy", "Terms", "About Google",
                    # "Google Home", "Advertising Programs", "Search settings", "Even more »", "Docs", "Photos", "Finance",
                    # "Blogger", "Wallet", "Mobile", "Translate", "Calendar", "More", "News", "Google+", "here"]
    # @search.each do |x|
      # if @google_list.exclude?(x.text)
        # Google.create do |y|
          # y.title = x.text
          # y.url = x.uri.to_s.slice(7..-1).split("&sa")[0]
        # end
      # end
    # end



  end
end
