require 'rubygems'
require 'yaml'
require 'watir'
require 'find'
require 'rspec/expectations'

require File.dirname(__FILE__) + "/support"
require File.dirname(__FILE__) + "/../../lib/application"
require File.dirname(__FILE__) + "/../../lib/page"
require File.dirname(__FILE__) + "/../../lib/pages"

require_all("#{File.dirname(__FILE__)}/../../lib/pages")