# frozen_string_literal: true

class AverageWeather
  def findfile(user_year, user_month, folder_name)
    filename = Dir.entries("./Weather_data/#{folder_name}/")
    filename.shift(2)
    print_temperature(user_year,user_month, folder_name,filename)
  end

  def average_highest_temperature(user_year, user_month, folder_name, filename)
    aver_max_temp = 0
    count = 0
    filename.each do |n|
      year = n.split('_')[2]
      month = File.basename(n, File.extname(n)).split('_')[3]
      if(user_month.to_s == month.to_s && user_year.to_i == year.to_i)

      File.foreach("./Weather_data/#{folder_name}/#{n}").with_index do |line, line_num|
        next if line_num == 1

        highest = line.split(',')[1]
        aver_max_temp = aver_max_temp.to_i + highest.to_i
        count += 1
      end
    end
  end
    print "Highest Average:#{aver_max_temp / count}C \n"
  end

  def average_lowest_temperature(user_year, user_month, folder_name, filename)
    aver_min_temp = 0
    count = 0
    filename.each do |n|
      year = n.split('_')[2]
      month = File.basename(n, File.extname(n)).split('_')[3]
      if(user_month.to_s == month.to_s && user_year.to_i == year.to_i)
      File.foreach("./Weather_data/#{folder_name}/#{n}").with_index do |line, line_num|
        next if line_num == 1

        lowest = line.split(',')[3]
        aver_min_temp = aver_min_temp.to_i + lowest.to_i
        count =count+1
      end
    end
  end
    average_min_temp=aver_min_temp / count
    print "Lowest Average:#{average_min_temp}C \n"
  end

  def average_most_humidity(user_year, user_month, folder_name, filename)
    aver_max_humid = 0
    count = 0
    filename.each do |n|
      year = n.split('_')[2]
      month = File.basename(n, File.extname(n)).split('_')[3]
      if(user_month.to_s == month.to_s && user_year.to_i == year.to_i)

      File.foreach("./Weather_data/#{folder_name}/#{n}").with_index do |line, line_num|
        next if line_num == 1

        humid = line.split(',')[7]
        aver_max_humid = aver_max_humid.to_i + humid.to_i
        count += 1
      end
    end
  end
    print "Average Humidity:#{aver_max_humid / count}% "
  end

  def print_temperature(user_year,user_month, folder_name,filename)
    average_highest_temperature(user_year, user_month, folder_name, filename)
    average_lowest_temperature(user_year, user_month, folder_name, filename)
    average_most_humidity(user_year, user_month, folder_name, filename)
  end
end