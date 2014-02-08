class Admin::ProductsController < ApplicationController

	def index
		render :text=>params and return false
	end

	def show
		@product = Product.find(params[:id],:conditions=>["user_id = ? and name = ?",params[:user_id],params[:name]])
	end
end
