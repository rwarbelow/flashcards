class Card
  attr_reader :question, :answer
  def initialize(data)
    @question = data[:question]
    @answer   = data[:answer]
  end
end