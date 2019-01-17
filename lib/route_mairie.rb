require 'rubygems'
require 'nokogiri'
require 'open-uri'
def get_townhall_email

    new_mairie_href = []
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    href_mairie = page.xpath("//a[@class='lientxt']/@href")
    href_mairie.each do |mairie_href|
      new_mairie_href << mairie_href.text
    end

  new_mairie_array = []
  #page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  url_mairie = page.xpath("//a[@class='lientxt']")
  url_mairie.each do |mairie|
    new_mairie_array << mairie.text
  end


  new_mairie_href.each do |email|
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{email}"))
    email = page.xpath("//tbody/td[4]/tr[2]")
    email_array = email.grep(/@/)
    email_array.each do |res_mail|
      new_mail_array << res_mail.text
    end
  end

  clean_data = Hash[new_mairie_array.zip(new_mail_array)]
  return clean_data

end
puts get_townhall_email
