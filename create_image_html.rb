#!/usr/bin/env ruby
# encoding: utf-8

Dir['./images/fulls/*.jpg'].sort.each do |image|
  basename = File.basename(image)
  puts %{<article class="thumb"><a href="images/fulls/#{basename}" class="image"><img src="images/thumbs/#{basename}" alt="" /></a></article>}
end
