

class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'], except: [:index]
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
