class Answer
  attr_reader :card, :response
  def initialize(response, card)
    @response = response
    @card     = card
  end

  def correct?
    response == card.answer
  end
end