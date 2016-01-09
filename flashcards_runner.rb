require_relative 'round'
require_relative 'card_generator'

print "Welcome! Enter the name of the file you'd like to use for your deck: "
file = gets.chomp

until File.exist?(file)
  print "Sorry. That file doesn't exist. Please enter a new file (for example: cards.csv): "
  file = gets.chomp
end

cards = CardGenerator.new(file).create_cards

round = Round.new(cards)

round.start

puts "Thank you for playing!"
