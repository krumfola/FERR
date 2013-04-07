###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################
puts prompt = "What's your first name?"
first_name = gets.chomp

puts prompt = "What's your last name?"
last_name = gets.chomp

player_name = first_name + " " + last_name

puts "Welcome" + " " + player_name + "!" + "You have 3 guesses to guess the Secret Number between 1 and 10."

guesses_left = 3

set_of_numbers = (1..10).to_a
secret_number = set_of_numbers.sample  #this will give a random #

messages = Hash.new
messages[:win] = "You Won!"
messages[:lose] = "You lost."
messages[:too_low] = "Your guess is too low"
messages[:too_high] = "Your guess is too high"

3.times do |count|
	puts "you have #{guesses_left} guesses left"
	puts "Please make your guess:"
	players_guess = $stdin.gets.chomp.to_i
	guesses_left -= 1
	if secret_number == players_guess
		puts messages[:win]
		puts "you guessed in #{count + 1} turns!"
		exit
	elsif  secret_number < players_guess
		puts messages[:too_high]
	elsif secret_number > players_guess
		puts messages[:too_low]
	end
end

puts messages[:lose]
	puts "The secret number is #{secret_number}"

