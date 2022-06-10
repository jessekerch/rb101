# Jesse Kercheval
# June 9, 2022
# Lesson 2 mortgage calculator
# Refactored several times to improve!

#method to validate user input
def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num 
end

#method to get and validate user name
def get_user_name
  loop do
    name = gets.chomp
    
    if name.empty?()
      puts "Please enter a valid name."
    else
      puts "Hello #{name}."
      break
    end
  end
end

#method to get and validate loan amount
def get_loan_amount
  loop do
    print "Please enter your loan amount: "
    loan = gets.chomp
    
    unless valid_number?(loan)
      puts "Hmm... that's not a valid number."
    else
      return loan.to_f
    end
  end
end 

#method to gather and validate monthly apr
def get_monthly_apr
  loop do
    print "Please enter your monthly interest rate (APR): "
    monthly_apr = gets.chomp
    
    unless valid_number?(monthly_apr)
      puts "Hmm... that's not a valid number."
    else
      return monthly_apr.to_f
    end
  end
end

#method to gather and validate loan duration
def get_loan_duration
  loop do
    print "Finally, enter the loan duration, in months: "
    duration = gets.chomp
    
    unless valid_number?(duration)
      puts "Hmm... that's not a valid number."
    else
      return duration.to_i
    end
  end
end

# method to calculate loan payment with three inputs
def payment_calc(loan, apr, duration)
   monthly_percent = (apr.to_f / 100) / 12
   loan * (monthly_percent / (1 - (1 + monthly_percent)**(-duration)))
end

print "Welcome to the mortage caclulator! Enter your name: "
get_user_name  # method to gather and validate user name

loop do  # main loop
  
  # call method to gather and validate loan amount input
  loan = get_loan_amount

  # call method to gather and validate monthly apr
  monthly_apr = get_monthly_apr

  # call method to gather and validate loan duration
  duration = get_loan_duration
  
  # call method to calculate monthly payment
  payment = payment_calc(loan, monthly_apr, duration)
  
  total_payments = format("%.2f", payment * duration)
  
  total_interest = format("%.2f", (payment * duration) - loan)

  puts "\n" + "=> Payment Every Month   $#{payment.round(2)}" 
  puts "=> Total of #{duration} Payments   $#{total_payments}" 
  puts "=> Total Interest   $#{total_interest}" 
  puts ""  # blank line before requesting input
  
  # Ask user if they'd like to do it again, i.e. back to top of main loop
  puts "Would you like to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase().start_with?("y")
end

puts "Thank you for using mortgage calculator. Goodbye!"