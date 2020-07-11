CHOICES = {
  rock: { beats: %w(scissors lizard), valid_choices: %w(r rock) },
  paper: { beats: %w(spock rock), valid_choices: %w(p paper) },
  scissors: { beats: %w(paper lizard), valid_choices: %w(s scissors) },
  lizard: { beats: %w(paper spock), valid_choices: %w(l lizard) },
  spock: { beats: %w(rock scissors), valid_choices: %w(sp spock) }
}

def win?(first, second)
  CHOICES[first.to_sym][:beats].include?(second.to_s)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts("=> #{message}")
end

scores = {
  player: 0,
  computer: 0
}

def winner_name(scores)
  scores.max { |a, b| a[1] <=> b[1] }[0]
end

def record_score(player, computer, scores)
  return if player == computer

  if win?(player, computer)
    scores[:player] += 1
  else
    scores[:computer] += 1
  end
end

def reset_scores(scores)
  scores[:player] = 0
  scores[:computer] = 0
end

def valid_choice?(choice)
  CHOICES.any? { |_, v| v[:valid_choices].include?(choice) }
end

def formatted_choice(choice)
  CHOICES.select { |_k, v| v[:valid_choices].include?(choice) }.keys.first.to_s
end

loop do
  player_choice = ""

  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors, (l)izard or (sp)ock")
    player_choice = gets.chomp

    if valid_choice?(player_choice)
      player_choice = formatted_choice(player_choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = CHOICES.keys.sample.to_s

  puts("You chose #{formatted_choice(player_choice)}, the computer chose #{computer_choice}")

  display_results(player_choice, computer_choice)
  record_score(player_choice, computer_choice, scores)

  if scores[:player] == 5 || scores[:computer] == 5
    prompt("#{winner_name(scores).capitalize} is the grand champion!")
    prompt("Scores -> Player: #{scores[:player]} | Computer: #{scores[:computer]}")
    reset_scores(scores)
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing. Good bye!")
