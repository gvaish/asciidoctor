#!/usr/bin/env ruby

require 'rubygems'
require 'fileutils'

curdir = Dir.glob('[^book]*.html')

curdir.each do|f|
   text = File.read(f)
   replace = text.gsub(/<\?xml version="1.0" encoding="UTF-8"\?>\n.*?(<section|<div)/, '\1')
   replace = replace.gsub(/(<\/section>|<\/div>)<\/body><\/html>/, '\1')
   File.open(f, 'w') {|file| file.puts replace}
end
