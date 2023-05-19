require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before :each do
      @user = User.create({
        name: "John",
        email: "john@example.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
    end

    it 'should create a user and save a valid password and password_confirmation' do
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password and password_confirmation do not match' do
      @user.password_confirmation =  "11111111"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password and password_confirmation are both missing' do
      @user.password_confirmation =  nil
      @user.password =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password_confirmation is missing' do
      @user.password_confirmation =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password is missing' do
      @user.password =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when email already exists' do
      user = User.create({
        name: "Jane",
        email: "john@example.com",
        password: "4141414141",
        password_confirmation: "41414141"
      })
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do

    before(:all) do
      @user = User.create({
        name: "Rachel",
        email: "rachelberry@example.com",
        password: "22222222",
        password_confirmation: "22222222"
      })
    end

    it 'should pass - create a user instance when email and password are correct' do
      user = User.authenticate_with_credentials("rachelberry@example.com", "22222222")
      expect(user.name).to eq "Rachel"
    end

    it 'should pass - create a user instance when email has white spaces' do
      user = User.authenticate_with_credentials("  rachelberry@example.com  ", "22222222")
      expect(user.name).to eq "Rachel"
    end

    it 'should pass - create a user instance when email has different case insensitivity' do
      user = User.authenticate_with_credentials("RachelBerry@example.COM", "22222222")
      expect(user.name).to eq "Rachel"
    end

    it 'should fail - not create a user instance when password is wrong' do
      user = User.authenticate_with_credentials("john@example.com", "11111111")
      expect(user).to be_nil
    end

    it 'should fail - not create a user instance when email does not exist' do
      user = User.authenticate_with_credentials("fake@nono.com", "11111111")
      expect(user).to be_nil
    end

    it 'should fail - not create a user instance when password is empty' do
      user = User.authenticate_with_credentials("john@example.com", "")
      expect(user).to be_nil
    end
  end
end
