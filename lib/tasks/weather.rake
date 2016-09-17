namespace :weather do
  task scrape: :environment do
    require 'open-uri'
    require 'json'
    
    open('http://apidev.accuweather.com/currentconditions/v1/236828.json?language=en&apikey=hoArfRosT1215') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      jsonhash = parsed_json.first
      temphash = jsonhash.fetch("Temperature")
      temp = temphash.fetch("Imperial")
      tempf = temp.fetch("Value")
      
      temp2 = temphash.fetch("Metric")
      tempc = temp2.fetch("Value")

      wicon = jsonhash.fetch("WeatherIcon")
  
      wtext = jsonhash.fetch("WeatherText")
      
      Weather.create do |x|
        x.tempf = tempf
        x.tempc = tempc
        x.wicon = wicon
        x.wtext = wtext
      end
    end

    
    
  end
end