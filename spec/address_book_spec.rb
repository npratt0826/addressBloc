require_relative '../models/address_book'

RSpec.describe AddressBook do 
    describe "attributes" do
        let(:book) { AddressBook.new }
        
        it "responds to entries" do 
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do 
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
        
    end
    
    describe "#add_entry" do
        let(:book) { AddressBook.new }
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
            expect(book.entries.size).to eq(1)
         end
 
         it "adds the correct information to entries" do
           book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
           new_entry = book.entries[0]
     
           expect(new_entry.name).to eq('Ada Lovelace')
           expect(new_entry.phone_number).to eq('010.012.1815')
           expect(new_entry.email).to eq('augusta.king@lovelace.com')
         end
    end
    
    describe "#remove_entry" do 
        let(:book) { AddressBook.new }
        it "remove only one entry from the address book" do
            book.add_entry("Nick Pratt", "010.210.5181", "nick.pratt@pratt.com")
            
            name = "Ada Lovelace"
            phone_number = "010.012.1815"
            email_address = "augusta.king@lovelace.com"
            book.add_entry(name, phone_number, email_address)
            
            expect(book.entries.size).to eq 2
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq 1
            expect(book.entries.first.name).to eq("Nick Pratt")
        end
    end
        
            
end