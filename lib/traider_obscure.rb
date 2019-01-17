require 'rubygems'
require 'nokogiri'
require 'open-uri'
def data
  symb_array = []
  pri_array = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  array_symbol = page.xpath("//td[@class='text-left col-symbol']")
  array_symbol.each do |symbol|
    symb_array << symbol.text
  end

  array_price = page.xpath("//a[@class='price']")
  array_price.each do |price|
    pri_array << price.text
  end
  pri_without_dollar = []
  pri_array.each {|value| pri_without_dollar << (value.delete '($)').to_f}
  clean_data = Hash[symb_array.zip(pri_without_dollar)]
  return clean_data
end
puts data
