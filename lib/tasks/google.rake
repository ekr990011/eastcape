namespace :google do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://news.google.com/')
    @newsf = @page.form_with(:action => "//www.google.com/search?cf=all&hl=en&pz=1&ned=us")
    @newsf.q = "east cape baja"
    @search_results = @a.submit(@newsf)
    @search = @search_results.links
    @google_list = ["Search", "Images", "Maps", "Play", "YouTube", "Gmail", "Drive", 
                    "More »", "Web History", "Settings", "Sign in", "", "All", "Images",
                    "Videos", "Shopping", "Maps", "Books", "Blogs", "Past hour", "Past 24 hours",
                    "Past week", "Past month", "Past year", "Archives", "Sorted by date",
                    "2", "3", "4", "5", "6", "7", "8", "9", "10", "Next", "Advanced search",
                    "RSS", "Search Help", "Send feedback", "Business Solutions", "Privacy", "Terms", "About Google", 
                    "Google Home", "Advertising Programs", "Search settings", "Even more »", "Docs", "Photos", "Finance",
                    "Blogger", "Wallet", "Mobile", "Translate", "Calendar", "More", "News", "Google+", "here"]
    @search.each do |x|
      if @google_list.exclude?(x.text)
        Google.create do |y|
          y.title = x.text
          y.url = x.uri.to_s.slice(7..-1).split("&sa")[0] 
        end
      end
    end
    
  end
end