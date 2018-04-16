#!/usr/bin/env ruby

# print "test: do it.\n"

# output to stdout

require 'csv'

average_blood_pressure = 0
CSV.foreach('./src/diabetes.csv', converters: :numeric) do |row|
  average_blood_pressure += row[3].to_i 
end

puts average_blood_pressure/768