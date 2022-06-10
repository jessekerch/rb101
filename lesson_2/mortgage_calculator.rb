# Jesse Kercheval
# June 9, 2022
# RB101 Lesson 2 - Mortgage Calculator

require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')
LANGUAGE = 'en'

def messages(message, language = 'en')
  MESSAGES[language][message]
end


def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_user_name
  loop do
    name = gets.chomp

    if name.empty?()
      puts "Please enter a valid name."
    else
      puts "\n" + "Hi #{name}!" + "\n" + "\n"
      break
    end
  end
end

def get_loan_amount
  loop do
    print messages('loan', LANGUAGE)
    loan = gets.chomp

    if valid_number?(loan) && loan.to_f > 0
      return loan.to_f
    else
      puts "Hmm... that's not a valid number."
    end
  end
end

def get_monthly_apr
  loop do
        print messages('apr', LANGUAGE)
    monthly_apr = gets.chomp

    if valid_number?(monthly_apr)
      return monthly_apr.to_f
    else
      puts "Hmm... that's not a valid number."
    end
  end
end

def get_loan_duration
  loop do
    print messages('duration', LANGUAGE)
    duration = gets.chomp

    if valid_number?(duration)
      return duration.to_i
    else
      puts "Hmm... that's not a valid number of months."
    end
  end
end

def payment_calc(loan, apr, duration)
  monthly_percent = (apr.to_f / 100) / 12
  loan * (monthly_percent / (1 - (1 + monthly_percent)**(-duration)))
end

print messages('welcome', LANGUAGE)
get_user_name

loop do # main loop
  loan = get_loan_amount
  monthly_apr = get_monthly_apr
  duration = get_loan_duration

# if APR = 0, simply calculate total loan divided by months
  if monthly_apr == 0
    payment = loan / duration
  else
    payment = payment_calc(loan, monthly_apr, duration)
  end

  total_payments = format("%.2f", payment * duration)
  total_interest = format("%.2f", (payment * duration) - loan)
  
  if duration == 0
    payment = loan
    duration = 1
    total_interest = 0
    total_payments = loan
  end
  
  puts "\n" + "=> Payment Every Month   $#{format("%.2f", payment)}"
  puts "=> Total of #{duration} Payments   $#{total_payments}"
  puts "=> Total Interest   $#{total_interest}"
  puts "" # blank line before requesting input

  # Ask user if they'd like to do it again, i.e. back to top of main loop
  puts messages('again', LANGUAGE)
  answer = gets.chomp
  system 'clear'
  break unless answer.downcase() == "y" || answer.downcase() == "yes"
end

  puts messages('goodbye', LANGUAGE)
