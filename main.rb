require_relative "card_check"
include CardCheck

#Get user input
print "Flybuys card validator\n\n"
print "Enter a flybuys card number: "

card_number = gets.chomp

#if statement checks if the card_number, when spaces are removed, contains only digits. 
#If yes proceed with card checks. otherwise informs the user the validator only accepts integers. 
if card_number.delete(' ').scan(/\D/).empty?
    result = validate(card_number)
    puts result
else
    puts "The code that was input was invalid. \nFly buys card number must not contain letters or symbols."
end