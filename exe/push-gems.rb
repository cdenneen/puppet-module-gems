#!/usr/bin/env ruby

require_relative '../lib/puppet-module-gems/constants.rb'
include PuppetModuleGems::Constants

OWNERS = [
"morgan@puppetlabs.com",
"bradejr@puppetlabs.com",
"stahnma@puppetlabs.com",
"melissa@puppetlabs.com",
"bryan.jen@puppet.com",
"david.schmitt@puppet.com",
"hunter@puppet.com",
"paula@puppet.com",
"helen@puppet.com",
"david.swan@puppet.com",
"jesse@puppetlabs.com",
"tim@sharpe.id.au",
"glenn.sarti@puppet.com",
"loredana.ionce@puppet.com",
"florin.dragos@puppet.com",
"daniel.milan@puppet.com",
"sheena@puppet.com",
"michael.lombardi@puppet.com",
"william.hurt@puppet.com",
"erick@puppet.com",
"tp@puppet.com",
]

Dir["#{PKG_PATH}/*.gem"].each do |file|
  gem = File.basename(file).split('.gem').first
  gem_version = gem.split('-').last
  gem_name = gem.split("-#{gem_version}").first

  puts "## Updating owners list for #{gem_name}."
  OWNERS.each do |owner|
    value = `gem owner --add #{owner} #{gem_name}`
    puts value
  end

  puts "## Pushing #{gem_name} to https://rubygems.org."
  value = `gem push #{file}`
  puts value
end
