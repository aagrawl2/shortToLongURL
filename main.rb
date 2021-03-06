#Lines 2- 13 is required if you want to install dependencies in the run time
require "json"
require 'bundler/cli'
 
require 'rubygems'
require 'bundler'
require 'net/http'

#Initialize bundler to handle run time dependencies
bundle = Bundler::CLI.new
bundle.invoke(:install,[],:path => './',:verbose => false, :deployment => false)
Bundler.setup(:default, :ci)

require  'mechanize'
class Link
 
  def initialize(message_link)
    @short = message_link
    @client = Mechanize.new #Create new mechanize object
  end
 
  # Opens the shortened url, grabs redirect header.
  def long_url
    @client.redirect_ok = false
    page = @client.get @short #Get the Long URL
    long =  page.header['location']
    puts "#{@short} => #{long}"
    long
  end
 
  def short_url
    @short
  end

end


 link = Link.new('http://bit.ly/Y2HLwU')
 link.long_url
