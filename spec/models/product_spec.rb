require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "dishes")
    
       
  end


  describe 'Validations' do
    it "saves a product" do 
      @product = @category.products.new(name: "cup", price: 140, quantity: 12)      
      expect(@product).to be_valid
    end
    it "errors when no name given" do
      @product = @category.products.create( name: nil, price: 140, quantity: 12)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    
    end
    it "errors when no price given" do
      @product = @category.products.create( name: "cup", quantity: 12)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "errors when no quantity given" do
      @product = @category.products.create( name: "cup", price: 140)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "errors when no category given" do
      @product = Product.create( name: "cup", price: 140, quantity: 12)
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
