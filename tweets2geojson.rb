#!/usr/bin/env ruby

require "json"

#
# tweets2geojson.rb
#
# by Jeffrey Morgan
# https://jeffreymorgan.io/
#
# A command-line utility that reads tweets in JSON format
# from the standard input and outputs a GeoJSON feature
# collection on the standard output. Each geocoded tweet
# is represented by a point feature in the GeoJSON output.
#

def extract_coordinates(tweet)
  coordinates = tweet["coordinates"]["coordinates"]
  {
    :longitude => coordinates[0],
    :latitude  => coordinates[1]
  }
end

def create_feature(tweet)
  coordinates = extract_coordinates(tweet)
  {
  	:type => "Feature",
  	:properties => {},
  	:geometry => {
  	  :type => "Point",
  	  :coordinates => [
  	  	coordinates[:longitude],
  	  	coordinates[:latitude]
  	  ]
  	}
  }
end

def has_geocoding(tweet)
  tweet["coordinates"] != nil
end

def create_features
  features = []
  until STDIN.eof?
    line = STDIN.readline
    tweet = JSON.parse(line)
    if has_geocoding(tweet)
  	  feature = create_feature(tweet)
  	  features.push(feature)
    end
  end
  features
end

def tweets_to_geojson
  geoJSON = {
    :type => "FeatureCollection",
    :features => create_features
  }
  puts JSON.generate(geoJSON)
end

tweets_to_geojson
