# frozen_string_literal: true

require "yaml"

MESSAGES = YAML.load_file("messages.yml")

def messages(message, lang = "en")
  MESSAGES[lang][message]
end

def prompt(message)
  puts("=> #{message}")
end

def operator_valid?(operator)
  %w(1 2 3 4).include?(operator)
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def number_valid?(number)
  integer?(number) || float?(number)
end

def operation_to_message(operator)
  {
    "1" => "Adding",
    "2" => "Multiply",
    "3" => "Subtract",
    "4" => "Dividing"
  }[operator]
end

puts prompt(messages("welcome"))

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages("valid_name"))
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  number1 = ""

  loop do
    puts prompt("What's the first number?")
    number1 = gets.chomp

    if number_valid?(number1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  number2 = ""

  loop do
    puts prompt("What's the second number?")
    number2 = gets.chomp

    if number_valid?(number2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<~MSG
    What operator would you like to use? Use:
      1) Add
      2) Multiply
      3) Subtract
      4) Divide
  MSG
  puts prompt(operator_prompt)

  operator = ""

  loop do
    operator = gets.chomp.downcase

    if operator_valid?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep(1)

  result = case operator
           when "1" then number1.to_f + number2.to_f
           when "2" then number1.to_f * number2.to_f
           when "3" then number1.to_f - number2.to_f
           when "4" then number1.to_f / number2.to_f
           end

  prompt("The result id #{result}")

  prompt("Do you want to perform another calculation?")
  answer = gets.chomp.downcase

  break unless answer.start_with?("y")
end

prompt("Thank you for using the calculator!")
