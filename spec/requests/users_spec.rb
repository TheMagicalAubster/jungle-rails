require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    
    it 'should create a user if a password is valid' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
    

      expect(@user).to be_valid
    end

    it 'should not create a user if a passwords do not match' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password123'

      expect(@user).to_not be_valid
    end

    it 'should not create a user if email is already in use' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save

      @user2 = User.new
      @user2.email = 'email@email.com'
      @user2.first_name = 'test'
      @user2.last_name = 'test'
      @user2.password = 'password'
      @user2.password_confirmation = 'password'

      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include 'Email has already been taken'

    end

    it 'should not create a user if a password is not 8 characters' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'pass'
      @user.password_confirmation = 'pass'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include 'Password password must be 8 characters'
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should log in with a valid email and password' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save

      @user2 = User.authenticate_with_credentials("email@email.com", "password")
     
      expect(@user2).to_not be_nil
    end

    it 'should log in with a valid email and password' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save

      @user2 = User.authenticate_with_credentials("email@email.com", "password")
     
      expect(@user2).to_not be_nil
    end
    it 'should log in with additional white space to email and valid password' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save

      @user2 = User.authenticate_with_credentials("   email@email.com", "password")
     
      expect(@user2).to_not be_nil
    end

    it 'should log in with capitals in the email and valid password' do
      @user = User.new
      @user.email = 'email@email.com'
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save

      @user2 = User.authenticate_with_credentials("EMAIL@email.com", "password")
     
      expect(@user2).to_not be_nil
    end
  end

end
