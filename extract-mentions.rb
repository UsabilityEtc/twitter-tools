#!/usr/bin/env ruby

#
# extract-mentions.rb
#
# by Jeffrey Morgan
# http://usabilityetc.com/
#
# A command-line utility that reads tweets in JSON format
# from the standard input and outputs the user mentions
# in the tweets on the standard output.
#

require "json"

def extract_user_mentions
  until STDIN.eof?
    line = STDIN.readline
    tweet = JSON.parse(line)
    user_mentions = tweet["entities"]["user_mentions"];
    user_mentions.each do |user_mention|
      puts "@" + user_mention["screen_name"]
    end
  end
end

extract_user_mentions
