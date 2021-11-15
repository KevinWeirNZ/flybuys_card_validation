module CardCheck

    # card_check method will check the length of the input number. If the number is either 16 or 17 characters long, 
    # it will check the numbers prefix to determine the card type.
    # If the number is not the correct length it will return an error
    def card_check_length(card_number)
        #ensure valid = false.
        valid = false 
        card_length = card_number.length.to_i #.to_s
        if card_length.between?(16,17)
            valid = true
        else
            return valid = false
        end
    end
    #card check prefix method will split the array and take the first 10 elements, convert to integer and join them as one one integer.
    #then it will check if the number is within the range required to classify as type green. if not it proceeds do the same for each of the 
    #different types, taking the first numbers and comparing them against the type code.

    def card_check_prefix(card_number)

        card_number_array = card_number.to_s.delete(' ').split(//) #convert the card number to a string, delete the spaces between characters, and split each character into an array called card_number_array
        number = card_number_array.take(10).join().to_i         #take the first 10 elements of the array, join them as one string and convert them to integer.


        #This if statement will firstly check if number is between the range of (6014355526,6014355529) if not it will narrow down the number of integers
        # that it takes. (7 then 5 then 4) and checks the resulting number against the prefix for each card type. When there is a match the method will 
        #return the card type . If the number doesn't match any of the card types, it will return "unknown"
        if  number.between?(6014355526,6014355529)  #Card type Green
            return type = "Fly Buys Green"
        else
            number = card_number_array.take(7).join().to_i  #Card type Red
            if number == 6014352
                return type = "Fly Buys Red"
            else
                number = card_number_array.take(5).join().to_i  #Card type Black
                if number == 60141
                    return type = "Fly Buys Black"
                else
                    number = card_number_array.take(4).join().to_i  #Card type Blue
                    if number == 6014
                        return type = "Fly Buys Blue"
                    else
                        return type = "Unknown"
                    end
                end
            end
        end 
    end



    #checksum method takes the card number as a parameter, and starting from the second to last integer, multiplies every second digit by two.
    #The method will then sum all digits in the array and checks the remainder of the sum if divided by 10. If equal to 0 the method returns 
    #the variable checksum_valid = "Valid". If the remainder is not equal to 0 the method returns checksum_valid = "Invalid".
    def checksum(card_number)

        # reverse the card number and split it into an array. then convert to integers.
        card_num_reversed = card_number.reverse.split(//).map(&:to_i) 

        # this block checks the if the index number is odd, if it is then it will multiply the corresponding number by 2. if even it does nothing. 
        num_multiplied = card_num_reversed.map.with_index { |n, i| if i.odd? then n * 2 else n end } 

        # join the array into one number and split it again in order to ensure all integers in the array are single digits.
        a = num_multiplied.join()
        b = a.split(//).map(&:to_i)

        card_number_sum = b.sum
        
        #check if the remainder of card_number_sum / 10 is equal to zero.
        #if true the method will return "Valid", else it will return "Invalid"
        check_sum = card_number_sum % 10 == 0
        if check_sum == true
            return checksum_valid = "Valid"
        else
            return checksum_valid = "Invalid"
        end
    end

    def validate(card_number)
        #if the card number is the correct length get the card type and check if the number is valid.
       #if the card number is not the correct length get the card type and set validity to "Invalid"
       if card_check_length(card_number) == true 
           type = card_check_prefix(card_number)
           validity = checksum(card_number)
       else
           type = card_check_prefix(card_number)
           validity = "Invalid"
       end
       result = "#{type}: #{card_number} (#{validity})"
   end
end

