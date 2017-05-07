require 'spec_helper'

describe 'restaurants/index.html.erb' do

	before(:each) do |example|
		unless example.metadata[:skip_initialize_user]
			assign(:current_user, FactoryGirl.build_stubbed(:user, email: 'bill@gmail.com'))
		end
		controller.singleton_class.class_eval do
      protected
      def current_user
        FactoryGirl.build_stubbed(:user)
      end
      helper_method :current_user
    end
	end

  it 'displays title content correctly on the index page' do
    render
    expect(rendered).to have_content('FOOD IN YOUR NEIGHBORHOOD')
    expect(rendered).to have_content('RESTAURANTS OF THE DAY')
  end

  

end