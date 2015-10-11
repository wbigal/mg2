Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each { |file| load file }

input = [
  'glob is I',
  'prok is V',
  'pish is X',
  'tegj is L',
  'glob glob Silver is 34 Credits',
  'glob prok Gold is 57800 Credits',
  'pish pish Iron is 3910 Credits'
]

input.each do |item|
  Knowledge.instance.learn item
end

q = Question.new('how much is pish tegj glob glob?')

#credit = Credit.new('glob prok Gold is 57800 Credits')
#puts credit.unit_value
