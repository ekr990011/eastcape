require 'nokogiri'
require 'open-uri'

url = "https://east-cape-ekr990011.c9users.io/forums"

html_doc = Nokogiri::HTML(open(url))

puts html_doc.at_css('tr:nth-child(5) td:nth-child(1)')
