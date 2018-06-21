require 'csv'

namespace :import do

  desc "Import users from csv"
  task users: :environment do
    filename = File.join Rails.root, "users.csv"
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      p row 
      p row ["Email"]

      email, first, last, description = row
      user = User.create(email: row["Email"], first_name: first, last_name: last, description: description)
      puts "#{email} - #{user.error.full_messages.join(",")}" if user.errors.any? 
      counter += 1 if user.persisted?
    end 

    puts "Imported #{counter} users."
  end 
end 