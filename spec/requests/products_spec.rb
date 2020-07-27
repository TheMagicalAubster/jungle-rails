require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it 'should create product' do
      @category = Category.new
      @category.name = "TestNameCategory"
      
      @product = Product.new
      @product.name = 'Name'
      @product.price = 3
      @product.quantity = 2
      @product.category = @category
      
      expect(@product).to be_valid
    
    end

    it 'should have a product name' do
      @category = Category.new
      @category.name = "TestNameCategory"
      
      @product = Product.new
      # @product.name = 'Name'
      @product.price = 3
      @product.quantity = 2
      @product.category = @category
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    
    end

    it 'should have a product quantity' do
      @category = Category.new
      @category.name = "TestNameCategory"
      
      @product = Product.new
      @product.name = 'Name'
      @product.price = 3
      # @product.quantity = 2
      @product.category = @category
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    
    end

   it 'should have a product category' do
      @category = Category.new
      @category.name = "TestNameCategory"
      
      @product = Product.new
      @product.name = 'Name'
      @product.price = 3
      @product.quantity = 2
      # @product.category = @category
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    
    end

  end
end
