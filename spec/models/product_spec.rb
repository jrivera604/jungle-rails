require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Category')
      @product = Product.new(
        name: 'Product Name',
        price: 9.99,
        quantity: 10,
        category: @category
      )
    end

    it 'saves successfully when all fields are set' do
      expect(@product.save).to be true
    end

    it 'validates presence of name' do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail due to missing price coulmn' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'validates presence of quantity' do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates presence of category' do
      @product.category = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
