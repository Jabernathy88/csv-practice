#!/usr/bin/env ruby

require 'csv'

test_table = CSV.read('./src/diabetes.csv', :headers => true)

test_table.delete("Triceps skin fold thickness (mm)")

CSV.open('./output.csv', 'w') do |new_table|
  new_header_array = ["transaction_id", "Number of times pregnant", "Plasma glucose concentration", "Diastolic blood pressure (mm Hg)", "2-Hour serum insulin (mu U/ml)", "Body mass index (weight in kg/(height in m)^2)", "Diabetes pedigree function", "Age (years)", "Class"]
  new_table << new_header_array
  test_table.each do |old_row|
    new_table.puts old_row    
  end 
end 

print "New output file created.\n"