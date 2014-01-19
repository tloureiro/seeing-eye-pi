#!/usr/bin/env ruby
# encoding: utf-8

#~ TODO: disambiguation
#~ TODO: section selector

require 'open-uri'
require 'json'
require 'nokogiri'
require 'uri'

def isInvalidNode(node)

	if !node.css(".mw-headline#References").empty? ||
	   ( !node["class"].nil? && node["class"].include?("mw-ext-cite-error") ) ||
	   ( !node["class"].nil? && node["class"].include?("reflist") ) ||
	   ( !node["class"].nil? && node["class"].include?("dablink") ) ||
	   ( !node["class"].nil? && node["class"].include?("metadata") ) ||
	   ( !node["class"].nil? && node["id"] == "toc" ) ||
	   ( !node["class"].nil? && node["class"].include?("noprint") )
	   

		return true
	else
		return false
	end
end


def isEndOfArticle(node)

	if !node.css(".mw-headline#External_links").empty? ||
	   !node.css("#See_also").empty?
		return true
	else
		return false
	end
end

if ARGV[0].nil? || ARGV[0].empty?
	puts "Usage: wikipedia article"
	exit
end

article_name = ARGV[0]
article_name = URI.escape(article_name)

contents = open("http://en.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&titles="+article_name+"&rvprop=content&rvparse"){|f|f.read}

jsonObject = JSON.parse(contents)

article = jsonObject["query"]["pages"].values[0]["revisions"][0].values[0]

doc_full = Nokogiri::HTML(article)

text = ""

doc_full.css("body>*").each do |node|
	
	if node.name == "p" || node.name == "h1" || node.name == "h2" ||
	   node.name == "h3" || node.name == "h4" || node.name == "h5" ||
	   node.name == "div" || node.name == "ul"
	   
		if isEndOfArticle(node)
			break
		end
		
		if !isInvalidNode(node)
			text += node.text + "\n"
		end
		
	end
	
end

puts text.gsub(/\[.*?\]/, '').gsub(/ /, ' ').gsub(/ /, ' ').gsub(/\t/, ' ').gsub(/^\n$/, '').gsub(/\s\s+/, ' ').gsub(/^\s*\n$/, '')
