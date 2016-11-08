require 'nokogiri'
require 'open-uri'
require 'net/http'

BASE_URL = "http://www.languagedaily.com"
urls = []
url = 'http://www.languagedaily.com/learn-german/vocabulary'
doc = Nokogiri::HTML(open(url))
links = doc.css('a')
urls = links.map { |link| link['href'] }.compact.uniq.select { |s| s.match(/common-german-words/) }

urls.each do |a|
  page = Nokogiri::HTML(open("#{BASE_URL}#{a}"))
  page.css('#jsn-mainbody div.com-content div div.jsn-article-content table tbody').each do |el|
    original_text = []
    translated_text = []
    original_text = el.css('td.bigLetter').map { |org| org.text }
    translated_text = el.css('td:nth-child(3)').map { |trn| trn.text }
    translated_text.shift
    words = Hash[original_text.zip(translated_text)]
    words.each do |o, t|
      Card.create(:original_text => o, :translated_text => t) unless t.empty?
    end
  end
end
