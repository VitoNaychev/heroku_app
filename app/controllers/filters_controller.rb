require 'csv'

class FiltersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
    end 
    
    def create
        csv_file = params[:file]
        csv_file_path = csv_file.path
    
        sum = 0 
        countr = 0

        CSV.foreach(csv_file_path) do |row|
            if countr == 0
                countr += 1
                next
            end
            if Integer(row[2]) % 2 != 0
                sum += row[1].to_f
            end
        end

        puts ("%.2f" % sum)
        render :plain => ("%.2f\n" % sum).to_s
    end 
end
