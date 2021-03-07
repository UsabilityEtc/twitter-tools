#!/usr/bin/env ruby

#
# extract-hashtags.rb
#
# by Jeffrey Morgan
# https://jeffreymorgan.io/
#
# A command-line utility that reads tweets in JSON format
# from the standard input and outputs the hashtags in the
# tweets on the standard output.
#

require "json"

def extract_hashtags
  until STDIN.eof?
    line = STDIN.readline
    tweet = JSON.parse(line)
    hashtags = tweet["entities"]["hashtags"];
    hashtags.each do |hashtag|
      puts "#" + hashtag["text"]
    end
  end
end

extract_hashtags
