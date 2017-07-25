require_relative 'deck'
require 'pry'

class Game
attr_accessor :player_hand, #//methods called on the class Game
             :dealer_hand,
             :player_value,
             :dealer_value,
             :deck,
             :bank

def initialize #// starts the game (instance variables)
  @player_hand = [] #//player_hand empty string
  @dealer_hand = []
  @deck = Deck.new
  @deck.shuffle
  @bank = 100
end

def joshua #//promts the start of the game
  puts "Would you like to play a game? Y or N"
  vague_answer = gets
  if vague_answer.downcase.chomp == 'y'#//removes /n and downcases answer
    deal
  elsif vague_answer.downcase.chomp == 'n'
    exit
  else
    puts 'Are you sure?'#//not a acceptable answer returns to prompt
    joshua
  end
end

def deal #//deals 2 cards to player and dealer\
  @player_hand = []
  @dealer_hand = []
  @deck.shuffle
  @bank -= 10
  2.times do
    @player_hand << @deck.draw #//
    @dealer_hand << @deck.draw
  end
puts @player_hand[0]
puts @player_hand[1]
puts "Dealer hand:"
puts @dealer_hand[1]
puts 'if you cant add to 21 then fuck off'
puts "#{@bank} in chips"
if hand_total(@player_hand) == 21
  puts "blackjack!  You win!"
  @bank += 20
  joshua
end
action
end

def action
  puts "Hit or Stay?"
  decision = gets
  if decision.chomp.downcase == "h" || decision.chomp.downcase == "hit"
    hit
  elsif decision.chomp.downcase == "s" || decision.chomp.downcase == "stay"
  end_of_game
  else
    puts 'Lets get weird'
    action
  end
  end

  def hit
    @player_hand << @deck.draw#//draws a card
    puts display_hand(@player_hand)#//shows player hand
    if hand_total(@player_hand) > 21
      puts "You bust"
      joshua
    else
      action
    end
  end

def end_of_game
  if hand_total(@dealer_hand) == 21 #//checks for dealer blackjack
  puts  "blackjack! You lose"
    joshua
  end
  puts display_hand(@dealer_hand)

  if hand_total(@dealer_hand) < 17
    while hand_total(@dealer_hand) < 17#//runs loop for dealer hit
      @dealer_hand << @deck.draw
      puts @dealer_hand.last
    end
    puts display_hand(@dealer_hand)
  end
  if hand_total(@player_hand) >= hand_total(@dealer_hand) #//evaluates hand
    puts "You win!"
    @bank += 20
    joshua
  else hand_total(@dealer_hand) > hand_total(@player_hand) && hand_total(@dealer_hand) <= 21
    puts "You lose!"
    joshua
 end

end


def display_hand(hand) #//display hand values
  hand.collect(&:to_s).join(", ")
end

def hand_total(hand) #//returns the total score for any hand
  hand.reduce(0) do |acc, value|
    acc = acc + value.value
  end
end

end

game = Game.new
game.joshua
