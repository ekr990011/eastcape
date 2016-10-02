namespace :testy do
  task scrape: :environment do
    require 'mechanize'
    
@a = Mechanize.new
    @page = @a.get('https://news.google.com/')
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
                    "Google Home", "Advertising Programs"]
    @search.each do |x|
      if @google_list.exclude?(x.text)
        puts x.uri
      end
    end
    
  end
end