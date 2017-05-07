require "rails_helper"

RSpec.describe User, :type => :model do
  before(:each) do |example|
  	unless example.metadata[:skip_create_user]
  		@user = FactoryGirl.build_stubbed(:user, email: 'george@gmail.com')
  	end
  end

  it "a user without a email should not be created", :skip_create_user do
  	user = FactoryGirl.build_stubbed(:user, email: nil)
    expect(user).to_not be_valid
	end


end
