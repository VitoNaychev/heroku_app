require 'csv'
require_relative "simple-linear-regression"

class LinRegressionsController < ApplicationController
  
    skip_before_action :verify_authenticity_token
    def index
    end
    
    def create
        csv_file = params[:file]
        csv_file_path = csv_file.path
        
        xs, ys = [], []
    
        countr = -1

        CSV.foreach(csv_file_path) do |row|
            if countr == -1
                countr += 1
                next
            end
            ys << row[0].to_f
            xs << countr.to_f
            countr += 1
        end
        linear_model = SimpleLinearRegression.new(xs, ys)
        
        print ("%.6f," % linear_model.slope)
        puts ("%.6f" % linear_model.y_intercept)
        render :plain => ("%.6f," % linear_model.slope).to_s + ("%.6f\n" % linear_model.y_intercept).to_s
    end
end
