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
    
    it 'is valid' do
      expect(@user).to be_valid
    end

    it 'not valid without a name' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'not valid without an email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'not valid if the password does not match password confirmation' do
      @user.password_confirmation = 'not_the_same'
      expect(@user).not_to be_valid
    end

    it 'should not accept a user with the sane email address' do
      @user.save
      @user = User.create({
        :name => 'John Smith',
        :email => 'john@smith.com',
        :password => 'password123',
        :password_confirmation => 'password123',
      })
      @user.save
      puts @user.inspect
      expect(@user.id).to eq nil
    end

  end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.create({
        :name => 'John Smith',
        :email => 'john@smith.com',
        :password => 'password123',
        :password_confirmation => 'password123',
      })
      @user.save
    end

    it 'log a user in with correct creds' do
      user = User.authenticate_with_credentials('john@smith.com', 'password123')
      expect(user).to eq(@user)
    end

    it 'don\'t log a user in with invalid password' do
      user = User.authenticate_with_credentials('john@smith.com', 'notPassword123')
      expect(user).not_to eq(@user)
    end

    it 'login a user with an email address with spaces before and after' do
      user = User.authenticate_with_credentials('  john@smith.com  ', 'password123')
      expect(user).to eq(@user)
    end

    it 'login a user with an email regardless of email letters case' do
      user = User.authenticate_with_credentials('JOHN@SMITH.com', 'password123')
      expect(user).to eq(@user)
    end

  end

end
