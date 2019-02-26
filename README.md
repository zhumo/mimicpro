# Overview
A scraper for Mimic Pro keyword simulation program. 
Rather than viewing all the keywords in the interface, this allows you get a csv with all the keywords to analyze in Excel.

# How to use
```
bundle
```
Create a file called `.env` in the root and put your credentials for Mimic Pro in there.

```
# .env file
MIMICPRO_USERNAME=itsamemario@plumbers.com
MIMICPRO_PW=starsandmushrooms
```

Next run:
```
$ ruby keywords.rb
```
