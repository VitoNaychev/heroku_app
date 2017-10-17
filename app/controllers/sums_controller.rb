require 'csv'

class SumsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
    end
    
    def create
        csv_file = params[:file]
        csv_file_path = csv_file.path
        
        sum = 0

        CSV.foreach(csv_file_path) do |row|
            sum += row[0].to_f
        end

        puts ("%.2f" % sum)
        render :plain => ("%.2f\n" % sum).to_s
    end
end
