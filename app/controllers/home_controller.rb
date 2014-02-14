class HomeController < ApplicationController
  require 'factual'
  def index
   factual = Factual.new("kZYgmYmyKrdBgWCxNJwajaNJZlU4laVqYMl99G2z", "YmQQTSGOz9sOetU0xf3TlRGQv0T5tQH7nEPzCuwA")

   @name = params[:name]
   @region = params[:region]
   @rows = []

   if @name.present? or @region.present?
	   @rows = factual.table("places").filters("name" => {"$bw" => @name}, "region" => {"$bw" => @region}).rows
   end 

  end
end
