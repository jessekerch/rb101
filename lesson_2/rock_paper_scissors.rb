VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer, scores)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt("Yay, you WON this round!!")
    scores[:player] += 1
  elsif (player == 'rock' && computer == 'paper') ||
     (player == 'paper' && computer == 'scissors') ||
     (player == 'scissors' && computer == 'rock')
     prompt("Oh no, Computer won this round.")
    scores[:computer] += 1
  else
    prompt("It's a tie!")
  end
end

def display_score(scores)
  prompt("**SCORE**  You: #{scores[:player]} vs Computer: #{scores[:computer]}")
  puts ""
end

score_hash = {player: 0, computer: 0}

loop do # main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
    end
  end
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose: #{choice.upcase}; Computer chose: #{computer_choice.upcase}")
  
  display_results(choice, computer_choice, score_hash)
  display_score(score_hash)
  
  prompt("Do you want to play another round?")
  answer = Kernel.gets().chomp()
  system 'clear'
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
