# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0

  hand.each do |card|
    case card
    when 'Jack', 'Queen', 'King'
      score += 10
    when 'Ace'
      score += 11
    else
      card.class == Integer && card >= 2 && card <= 10 ? score += card : (raise ArgumentError, "Invalid card: #{card}")
    end
  end

  if score > 21
    aces = hand.count('Ace')

    while aces > 0
      score -= 10

      break if score <= 21

      aces -= 1
    end
  end

  raise ArgumentError, "Bust!" if score > 21

  return score
end

