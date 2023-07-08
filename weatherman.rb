require('./extreme_weather')
require('./average_weather')
require('./barchart')
begin

case ARGV[0]

when '-e'
  ExtremeWeather.new.findfile(ARGV[1], ARGV[2])
when '-a'
    AverageWeather.new.findfile(ARGV[1],ARGV[2],ARGV[3])
  
when '-c'
    BarChart.new.findfile(ARGV[1],ARGV[2],ARGV[3])
  
else
 puts  "Wrong Choice"
   
end

end