#!/usr/bin/env ruby

require 'google-search'
require 'rainbow'

if ARGV.empty?
  print "Usage: g [query terms]"
  exit
end

query = ""
ARGV[0..-1].each { |term| query += " " + term }

links = []

Google::Search::Web.new(query: query, size: :small).all.first(10).each do |result|
  links << result.uri
  
  puts Rainbow("#{links.count.to_s}) " + result.title).yellow
  puts result.content
  puts Rainbow(result.uri).magenta

  puts
end

print Rainbow("result: ").red
index = STDIN.gets.to_i

exec ( "lynx #{links[index]}" )
