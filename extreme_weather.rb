# frozen_string_literal: true

require 'date'
require 'byebug'

class ExtremeWeather
  def findfile(user_year, folder_name)
    filename = Dir.entries("./Weather_data/#{folder_name}/")
    filename.shift(2)
    print_temperature(user_year, folder_name,filename)
  end

  def highest_temperature(user_year, folder_name, filename)
    max_temp = 0
    dated = ''
    filename.each do |file|
      year = file.split('_')[2]
      if( user_year.to_i == year.to_i)
      File.foreach("./Weather_data/#{folder_name}/#{file}").with_index do |line, line_num|
        next if line_num == 1
        highest = line.split(',')[1]
        date = line.split(',')[0]
        if highest.to_i > max_temp.to_i
          max_temp = highest
          dated = date
        end
      end
    end
    end
    print "Highest:#{max_temp}C on #{get_date(dated)}\n"
  end

  def lowest_temperature(user_year, folder_name, filename)
    min = 1000
    dated = ''
    filename.each do |file|
      year = file.split('_')[2]
      if( user_year.to_i == year.to_i)
      File.foreach("./Weather_data/#{folder_name}/#{file}").with_index do |line, line_num|
        next if line_num == 1
        lowest = line.split(',')[3]
        date = line.split(',')[0]
        if lowest.to_i < min.to_i && !lowest.to_i.zero?
          min = lowest
          dated = date
        end
      end
    end
    end
    print "Lowest:#{min}C on #{get_date(dated)} \n"
  end

  def most_humidity(user_year, folder_name, filename)
    max_humid = 0
    dated = ''
    filename.each do |file|
      year = file.split('_')[2]
      if( user_year.to_i == year.to_i)
      File.foreach("./Weather_data/#{folder_name}/#{file}").with_index do |line, line_num|
        next if line_num == 0
        date = line.split(',')[0]
        humid = line.split(',')[7]
        if humid.to_i > max_humid.to_i
          max_humid = humid
          dated = date
        end
      end
    end
    end
    print "Humid:#{max_humid}% on  #{get_date(dated)} \n"
  end

  def  get_date(date)
    date = Date.strptime(date, '%Y-%m-%d').strftime('%B %d')
  end

  def print_temperature(user_year, folder_name,filename)
    highest_temperature(user_year, folder_name, filename)
    lowest_temperature(user_year, folder_name, filename)
    most_humidity(user_year, folder_name, filename)
  end
end


