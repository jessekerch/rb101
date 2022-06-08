# Lesson 2 mortgage calculator

# m = p * (j / (1 - (1 + j)**(-n)))
# p = loan amount
# n = loan duration in months
# j = monthly interest rate
# m = monthly payment

def prompt(message)
  puts("=> #{message}")
end 

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num 
end   

prompt("Welcome to the mortage caclulator! Enter your name: ")

name = ""

loop do
  name = gets.chomp
  
  if name.empty?()
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do  # main loop
  loan = ""
  loop do
    prompt("Please enter your loan amount: ")
    loan = gets.chomp
    
    if valid_number?(loan)
      break
    else
      prompt("Hmm... that's not a valid number.")
    end
  end 
  
  monthly_apr = ""
  loop do
    prompt("Please enter your monthly interest rate (APR): ")
    monthly_apr = gets.chomp
    
    if valid_number?(monthly_apr)
      break
    else
      prompt("Hmm... that's not a valid number.")
    end
  end

  duration = ""
  loop do
    prompt("Finally, enter the loan duration, in months: ")
    duration = gets.chomp
    
    if valid_number?(duration)
      break
    else
      prompt("Hmm... that's not a valid number.")
    end
  end

  monthly_payment = loan.to_f * (((monthly_apr.to_f / 100) / 12) / (1.0 - (1.0 + ((monthly_apr.to_f / 100) / 12))**(-duration.to_f)))

  prompt("Your monthly payment will be: $#{monthly_payment.round(2)}")
  puts ""
  
  prompt("Would you like to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?("y")
end 

prompt("Thank you for using mortgage calculator. Goodbye!")
 