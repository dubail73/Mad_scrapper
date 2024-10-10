require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

hash={}

cryptos=doc.xpath("//tr/td[2]/div/a[2]").map {|crypto| crypto.text}

valeurs=doc.xpath("//tr/td[5]/div/span").map do |crypto|
crypto.text.gsub('$', '').gsub(',', '').to_f 
end

hash = cryptos.zip(valeurs).to_h

hash.each do |crypto, valeur|
  puts "#{crypto} => #{valeur}"
end

# Merci Charlie !!!