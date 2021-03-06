require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
     # #2
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - View entry by number"
     puts "6 - Exit"
     print "Enter your selection: "
 
     # #3
     selection = gets.to_i
     
     case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2 
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5
            system "clear"
            view_entry_by_n
            main_menu
        when 6
            puts "Good-bye!"
            exit(0)
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end
   end
   
   def view_all_entries
       address_book.entries.each do |entry|
           system "clear"
           puts entry.to_s
           
           entry_submenu(entry)
       end
   end
   
   def view_entry_by_n
       print "Entry number: "
       n = gets.chomp.to_i
       address_book.entries.each_with_index do |entry, index|
           if index == n-1
               puts entry
               entry_submenu(entry)
           else
               puts "Thats an invalid input"
           end
       end
   end
   
   def create_entry
       system "clear"
       puts "New AddressBloc Entry"
       
       print "Name: "
       name = gets.chomp
       print "Phone number: "
       phone = gets.chomp
       print "Email: "
       email = gets.chomp
       
       address_book.add_entry(name, phone, email)
       
       system "clear"
       puts "New entry created"
   end
   
   def delete_entry(entry)
       address_book.entries.delete(entry)
       puts "#{entry.name} has been deleted"
   end
   
   def edit_entry(entry)
       print "Updated name: "
       name = gets.chomp
       print "Updated phone number: "
       phone_number = gets.chomp
       print "Updated email: "
       email = gets.chomp
       
       entry.name = name if !name.empty?
       entry.phone_number = phone_number if !phone_number.empty?
       entry.email = email if !email.empty?
       system "clear"
       
       puts "Updated entry:"
       puts entry
   end


       
   
   def search_entries
   end
   
   def read_csv
       print "Enter CSV file to import: "
       file_name = gets.chomp
       
       if file_name.empty?
           system 'clear'
           puts "No CSV file read"
           main_menu
       end
       
       begin
          entry_count = address_book.import_from_csv(file_name).count
          system "clear"
          puts "#{entry_count} new entries added from #{file_name}"
       rescue
          puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
          read_csv
       end
        
   end
   
   def entry_submenu(entry)
       puts "n - next entry"
       puts "d - delete entry"
       puts "e - edit this entry"
       puts "m - return to main menu"
       
       selection = gets.chomp
       
       case selection
        when "n"
        when "d"
        when "e"
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
            
        end
    end
end