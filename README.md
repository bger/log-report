## Description

Create a ruby script that take a file name as a first argument and type of grouping as a second.
Returns the following

### list of webpages with most page views ordered from most pages views to less page views e.g.

/home 90 visits
<br>
/index 80 visits

### list of webpages with most unique page views also ordered

/about/2 8 unique views
<br>
/index 5 unique views

## Install

0. git clone
1. bundle install
1. chmod 755 script.rb

## Usage

1. ./script.rb webserver.log

## Tests

rspec spec

## Improvements

1. Documentation
2. Implement validation of edge cases, like invalid entry
3. Code could be rebuilt into gem, to make script executable.
