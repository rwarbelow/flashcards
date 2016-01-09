require 'csv'
require_relative 'deck'
require_relative 'answer'

class Round
  attr_reader :deck, :answers
  def initialize(cards)
    @deck    = Deck.new(cards)
    @answers = []
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    puts "Here is your first question:"
    @deck.cards.each do |card|
      response = get_response(card)
      answer   = record_answer(response, card)
      give_feedback(answer)
    end
    end_round
  end

  private

  def number_correct
    answers.count { |answer| answer.correct? }  
  end

  def end_round
    puts "You answered #{number_correct} correct."
    puts "Would you like to save the results?"
    response = gets.chomp
    if response == "yes"
      save_results
      puts "Your results have been saved."
    end
  end

  def save_results
    CSV.open("results.csv", "wb") do |csv|
      csv << ["Question", "Correct Answer", "Your Response", "Result"]
      answers.each do |answer|
        csv << [answer.card.question, answer.card.answer, answer.response, answer.correct?]
      end
    end
  end

  def get_response(card)
    puts "Question: #{card.question}"
    gets.chomp
  end

  def record_answer(response, card)
    answer = Answer.new(response, card)
    answers << answer
    answer
  end

  def give_feedback(answer)
    if answer.correct?
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end