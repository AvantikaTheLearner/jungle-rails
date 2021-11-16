require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.new(name: "testing") }
  subject(:products) do
      category.products.new(
        name: "test",
        description: "for RSpec",
        price_cents: 2000,
        quantity: 20,
      )
  end
  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(products).to be_valid
      expect(products.errors.full_messages).to be_empty
    end
    it "is not valid without a name" do
      products.name = nil
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include "Name can't be blank"
    end
    it "is not valid without a price" do
      products.price_cents = nil
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include "Price can't be blank"
    end
    it "is not valid without a quantity" do
      products.quantity = nil
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include "Quantity can't be blank"
    end
    it "is not valid without a category" do
      products.category = nil
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include "Category can't be blank"
    end
  end
end