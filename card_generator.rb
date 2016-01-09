require_relative 'card'

class CardGenerator
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def create_cards
    cards = []
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      cards << Card.new(row)
    end
    cards.shuffle
  end
end