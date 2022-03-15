require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before do
      # @category = Category.create({:name => 'Toys'})
      # @product = Product.create({:name => 'product', :price_cents => 1000, :quantity => 500, :category => @category})
      @user = User.create({
        :name => 'John Smith',
        :email => 'john@smith.com',
        :password => 'password123',
        :password_confirmation => 'password123',
      })
    end
    
    it 'Validate Name is Present' do
      puts "HEY DUDE"
      puts @user.inspect

    end

  end

end
