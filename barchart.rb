# frozen_string_literal: true

require 'colorize'
require 'date'
class BarChart

    def findfile(user_year, user_month, folder_name)
    filename = Dir.entries("./Weather_data/#{folder_name}/")
    filename.shift(2)
    temperature_finder(user_year, user_month, folder_name, filename)
    end

    def temperature_finder(user_year, user_month, folder_name, filename)
    filename.each do |n|
        year = n.split('_')[2]
        month = File.basename(n, File.extname(n)).split('_')[3]
        if(user_month.to_s == month.to_s && user_year.to_i == year.to_i)

        File.foreach("./Weather_data/#{folder_name}/#{n}").with_index do |line, line_num|
        next if line_num.zero?

        highest = line.split(',')[1]
        lowest = line.split(',')[3]
        date = line.split(',')[0]
        dated = date
        d = Date.parse(dated)
        highest_value = highest.to_i
        lowest_value = lowest.to_i
        print d.day
        (0..highest_value).each { |_n| print '+'.red }
        puts "#{highest}C \n"
        print d.day
        (0..lowest_value).each { |_n| print '+'.blue }
        puts "#{lowest}C \n"
        end
    end
end
    end
end