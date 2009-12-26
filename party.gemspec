spec = Gem::Specification.new do |s|
  s.name = 'party'
  s.version = '0.1'
  s.summary = 'easy money splitting'
  s.description = "a tool to aid calculating how much everybody should pay at a party"
  s.files = Dir['lib/**/*.rb'] + Dir['examples/**/*.rb']
  s.require_path = 'lib'
  s.has_rdoc = false
  s.author = 'Toon Willems'
  s.email = 'willemstoon@gmail.com'
end