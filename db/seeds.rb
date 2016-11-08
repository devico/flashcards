# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
require 'net/http'

BASE_URL = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"

for i in 1..12
  url = case i
  when 1
    BASE_URL
  when 2
    "http://www.languagedaily.com/learn-german/vocabulary/most-common-german-words-2"
  else
    "#{BASE_URL}-#{i}"
  end

  puts url
  if Net::HTTP.get_response(URI.parse(url)).is_a?(Net::HTTPSuccess)
    page = Nokogiri::HTML(open(url))
    page.css('#jsn-mainbody div.com-content div div.jsn-article-content table tbody').each do |el|
      original_text = []
      translated_text = []
      original_text = el.css('td.bigLetter').map { |org| org.text }
      translated_text = el.css('td:nth-child(3)').map { |trn| trn.text }
      translated_text.shift
      words = Hash[original_text.zip(translated_text)]
#      words.each { |o, t| Card.create(:original_text => o, :translated_text => t) }
      puts words.class
      end
  else
    puts "error open URL"
  end
end
