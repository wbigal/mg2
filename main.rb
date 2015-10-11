Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each { |file| load file }

file = ARGV[0] || "input.txt"

is = InputService.new

File.open(file, "r") do |f|
  f.each_line do |line|
    is.input line
  end
end

is.output.each do |message|
  puts message
end
