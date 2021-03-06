class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pass']

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categorie created!'
    else
      render :new
    end
  end

  

end
