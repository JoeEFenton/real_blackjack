require_relative 'card'


class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    build_deck
  end

def build_deck
  Card.suits.each do |suit|
    Card.faces.each do |face|
        @deck << Card.new(face,suit)
    end
  end
end

def shuffle
  @deck.shuffle!
end

def draw
  @deck.shift
end

end
