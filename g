#!/usr/bin/env ruby

require 'google-search'

if ARGV.empty?
  print "Usage: g [query terms]"
  exit
end

query = ""
ARGV[0..-1].each { |term| query += " " + term }

links = []

Google::Search::Web.new(query: query, size: :small).all.first(10).each do |result|
  links << result.uri
  
  puts links.count.to_s + ". " + result.title
  puts result.content
  puts result.uri
end

print "result: "
index = STDIN.gets.to_i

exec ( "lynx #{links[index]}" )
