require 'rubygems'
require 'nokogiri'
require 'open-uri'
def route_depute
  name_array = []
  first_name_array = []
  email_array = []
  page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=0#pagination_deputes"))
  name_array = page.xpath("//h2[@class='titre_normal']")
  new_name_array = []
  name_array.each do |name|
    new_name_array << name.text
  end
  return new_name_array
end

puts route_depute
