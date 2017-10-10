require 'csv'

class IntervalsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
    end 
    
    def create
        csv_file = params[:csv_file]
        csv_file_path = csv_file.path
    
         
        countr = 0
        countr2 = 0

        sums = []

        CSV.foreach(csv_file_path) do |row|
            sums[countr] = 0
            CSV.foreach(csv_file_path) do |row2|
                if countr2 >= countr and countr2 < countr + 30
                    sums[countr] += row2[1].to_f 
                end
                countr2 += 1
            end
            countr += 1
        end
        
        big_sum = 0
        countr2 = 0
        
        while countr2 < countr do
            if sums[countr2] != nil and big_sum != nil
                if sums[countr2] > big_sum
                    big_sum = sums[countr2]
                end
            end
            countr2 += 1
        end

        puts ("%.2f" % big_sum)
        render :plain => ("%.2f\n" % big_sum).to_s
    end 
end

