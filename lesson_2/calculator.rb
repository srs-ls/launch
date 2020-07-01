# frozen_string_literal: true

puts "Welcome to the Calculator!"

puts "What's the first number?"
number1 = gets.chomp.to_f

puts "What's the second number?"
number2 = gets.chomp.to_f

puts "What operation would you like to use? Use 'x', '+', '-' or '/'"
operation = gets.chomp.downcase

case operation
when "+" then puts number1 + number2
when "x" then puts number1 * number2
when "-" then puts number1 - number2
when "/" then puts number1 / number2
else
  puts "You entered an invalid operation!"
end
