require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create({:name => 'Toys'})
      @product = Product.create({:name => 'product', :price_cents => 1000, :quantity => 500, :category => @category})
    end
    
    it 'Validate Name is Present' do
      expect(@product.name).to be_present
    end

    it 'Validate Price is Present' do
      expect(@product.price).to be_present
    end

    it 'Validate Quantity is Present' do
      expect(@product.quantity).to be_present
    end

    it 'Validate Category is Present' do
      expect(@product.category).to be_present
    end

  end
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end