#spec/CardCheck.rb
require_relative 'spec_helper'
require_relative '../card_check.rb'


describe CardCheck do

    include CardCheck #required for testing methods in modules

    describe "#card_check_length" do
        it "If the length of the card number is valid returns true" do
            card_number = "60141016700078611"
            expect(card_check_length(card_number)).to eq(true)
        end
    end

    describe "#card_check_length" do
        it "If the length of the card number is not valid returns false" do
            card_number = "60141123456"
            expect(card_check_length(card_number)).to eq(false)
        end
    end

    describe "#card_check_prefix" do
        it "Checks the prefix of a given card number. It is true it returns the value Fly buys Green" do
            card_number = "6014355527"
            expect(card_check_prefix(card_number)).to eq("Fly Buys Green")
        end
        it "Checks the prefix of a given card number. It is true it returns the value Fly buys Red" do
            card_number = "6014352"
            expect(card_check_prefix(card_number)).to eq("Fly Buys Red")
        end
        it "Checks the prefix of a given card number. It is true it returns the value Fly buys Black" do
            card_number = "60141"
            expect(card_check_prefix(card_number)).to eq("Fly Buys Black")
        end
        it "Checks the prefix of a given card number. It is true it returns the value Fly buys Blue" do
            card_number = "6014"
            expect(card_check_prefix(card_number)).to eq("Fly Buys Blue")
        end
        it "Checks the prefix of a given card number. It is true it returns the value Unknown" do
            card_number = "6015352"
            expect(card_check_prefix(card_number)).to eq("Unknown")
        end
    end

    describe "#checksum" do
        it "Returns the value of 'valid' if a given number is valid" do
            card_number = "60141016700078611"
            expect(checksum(card_number)).to eq("Valid")
        end
    end

    describe "#checksum" do
        it "Returns the value of 'valid' if a given number is valid" do
            card_number = "60141016700078611"
            expect(checksum(card_number)).to eq("Valid")
        end
    end

    describe "#checksum" do
        it "Returns the value of 'valid' if a given number is valid" do
            card_number = "6014152705006141"
            expect(checksum(card_number)).to eq("Invalid")
        end
    end
    
    describe "#validate" do
        it "puts a given card number with the information about type, card number, and validity." do
            card_number = "6014111100033006"
            expect(validate(card_number)).to eq("Fly Buys Black: 6014111100033006 (Valid)")
        end
    end

end
       