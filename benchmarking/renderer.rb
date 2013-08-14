require 'erb'
dir = File.expand_path(File.dirname(__FILE__))

@javascript = ERB.new(File.read("#{dir}/benchmark.js.erb")).result
html = ERB.new(File.read("#{dir}/graph.html.erb"))

File.open("#{dir}/graph.html", 'w') do |f|
  f.write html.result(binding)
end
