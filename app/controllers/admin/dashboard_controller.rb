class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pass']
  def show
    @category = Category.count
    @product = Product.count
  end
end
