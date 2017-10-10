require 'csv'
require_relative 'simple-linear-regression'


class LinRegressionController < ApplicationController

    skip_before_action :verify_authenticity_token
    def index
    end
    
    def create
        csv_file = params[:csv_file]
        csv_file_path = csv_file.path
        
        xs, ys = [], []
    
        countr = 0

        CSV.foreach(csv_file_path) do |row|
            xs << row[0].to_f
            ys << countr.to_f
            countr += 1
        end
        linear_model = SimpleLinearRegression.new(xs, ys)
        
        print ("%.6f," % linear_model.y_intercept)
        puts ("%.6f" % linear_model.slope)
        render :plain => ("%.6f," % linear_model.slope).to_s + ("%.6f\n" % linear_model.y_intercept).to_s
    end
end
