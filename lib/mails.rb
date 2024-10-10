require 'nokogiri'
require 'open-uri'

annuaire = Nokogiri::HTML(URI.open("https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie"))

hash = {}
emails = annuaire.xpath('//a[@class="send-mail"]').map do |email_link|
  email_link.text unless email_link.nil? 
end

names = annuaire.xpath('//*[@id="main"]/div/div/div/article/div[3]/ul').map do |name_link|
  name_link.text unless name_link.nil?
end


hash = names.zip(emails).to_h

hash.each do |email, name|
  puts "#{name}, " ", #{email}"
end

