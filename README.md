# Visits Counter App

## App description

Ruby script that
  
  a. Receives a log as argument (webserver.log is provided)
            e.g.: ./parser.rb webserver.log
            
  b. Returns the following:
             > list of webpages with most page views ordered from most pages views to less page views
             e.g.:           

## Technology stack

|                     Name                     | Version |
| :------------------------------------------: | :-----: |
|      [Ruby](https://www.ruby-lang.org)       |  2.6.2  |


## Setup

- Configuration
  `bundle install`

- Running the script
  `cd lib`
  `ruby parser.rb`

- Running specs 
  `rspec`
  
- Test coverage
  open in the browser `coverage/index.html`     
  