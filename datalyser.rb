require 'daru'

# def load_csv
#   @data_frame = Daru::DataFrame.from_csv('data/epl1819.csv').corr
# end
#
# p load_csv

# def other
#     #@data_frame = Daru::DataFrame.from_csv('data/epl1819.csv')
     
# end
class Datalyser
def test
  @other = Daru::DataFrame.from_csv('data/epl1819.csv').correlation
  plot = Daru::View::Plot.
  p plot.class
end

end