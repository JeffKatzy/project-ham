class ComparisonsController < ApplicationController

  def index
    @boroughs = Borough.all
  end

  def show
   
    @boroughs = Borough.all
    @comparison = Comparison.new(params[:data_set_one],params[:data_set_two],params[:normalizer_one],params[:normalizer_two])
# this logic shuld be in an adapter, or somewhere else
# Way too big for one method in a controller
    data_array_1 = @comparison.get_hash(params[:data_set_one],params[:normalizer_one]).values
    data_array_2 = @comparison.get_hash(params[:data_set_two],params[:normalizer_two]).values
    gon.graph_name = "#{params[:data_set_one]} vs #{params[:data_set_two]}"
    #javascript for data1
    gon.data1bronx = data_array_1[0]
    gon.data1brooklyn = data_array_1[1]
    gon.data1manhattan = data_array_1[2]
    gon.data1queens = data_array_1[3]
    gon.data1staten = data_array_1[4]
    #javascript for data1
    gon.data2bronx = data_array_2[0]
    gon.data2brooklyn = data_array_2[1]
    gon.data2manhattan = data_array_2[2]
    gon.data2queens = data_array_2[3]
    gon.data2staten = data_array_2[4]



  end



end
