# Twitter Tools

A collection of Ruby command-line utilities for processing Twitter data in JSON format.


## extract-hashtags.rb

A command-line utility that reads tweets in JSON format from the standard input and outputs the hashtags in the tweets on the standard output.

### Usage

`cat tweets.json | ./extract-hashtags.rb > hashtags.txt`


## extract-mentions.rb

A command-line utility that reads tweets in JSON format from the standard input and outputs the user mentions in the tweets on the standard output.

### Usage

`cat tweets.json | ./extract-mentions.rb > mentions.txt`


## tweets2geojson.rb

A command-line utility that reads tweets in JSON format from the standard input and outputs a [GeoJSON](http://geojson.org/) feature collection on the standard output. Each geocoded tweet is represented by a point feature in the GeoJSON output.

### Usage

`cat tweets.json | ./tweets2geojson.rb > tweets.geojson`

The `tweets.geojson` output file can be imported into tools such as [geojson.io](http://geojson.io) and [visualised by GitHub](https://help.github.com/articles/mapping-geojson-files-on-github/).
