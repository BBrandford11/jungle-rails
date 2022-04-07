class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pass']

  def index
    @categorie = Category.all
  end

  def new
    @categorie = Category.new
  end

  def create
    @categorie = Category.new(category_params)

    if @categorie.save
      redirect_to [:admin, :categories], notice: 'Categorie created!'
    else
      render :new
    end
  end

end
