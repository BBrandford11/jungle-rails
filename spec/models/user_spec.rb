require 'rails_helper'

# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end

RSpec.describe User, type: :model do

 

  describe 'Validations' do
    it "saves a user" do  
      @user = User.create(name: "Bryce", email: "example@gmail.com", password: "Dark", password_confirmation: "Dark")        
      expect(@user).to be_valid
    end

    it "errors when no name" do        
      @user = User.create(name: nil, email: "example@gmail.com", password: "Dark", password_confirmation: "Dark")  
      
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    
    it "errors when no email" do        
      @user = User.create(name:"Bryce", password: "Dark", password_confirmation: "Dark")  
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "errors when passwords dont match" do        
      @user = User.create(name: "Bryce", email: "example@gmail.com", password: "ark", password_confirmation: "Dark")  
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "errors when passwords dont match" do        
      @user = User.create(name: "Bryce", email: "example@gmail.com", password: "Dark", password_confirmation: "dk")  
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "no error with case sensitive email" do        
      @user = User.create(name: "Bryce", email: "exAMple@GMAIL.cOm", password: "Dark", password_confirmation: "Dark")  
      expect(@user).to be_valid
    end

    it "no error whitespace beside email" do        
      @user = User.create(name: "Bryce", email: "    example@gmail.com   ", password: "Dark", password_confirmation: "Dark")  
      expect(@user).to be_valid
    end

    it "errors when password is to short" do        
      @user = User.create(name: "Bryce", email: "    example@gmail.com   ", password: "D", password_confirmation: "D")  
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end

    it "errors when email is already taken" do        
      @user = User.create(name: "Bryce", email: "example@gmail.com", password: "Dark", password_confirmation: "Dark")
      @user2 = User.create(name: "Bryce1", email: "example@gmail.com", password: "Danrk", password_confirmation: "Danrk")  
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    
  end

  
end
