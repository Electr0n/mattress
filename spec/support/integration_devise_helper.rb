include Warden::Test::Helpers

module IntegrationDeviseHelper
  def sign_in(user = nil)
    user ||= FactoryGirl.create(:user, :password => '123456')
    login_as(user)
    visit '/'
  end

  def sign_out
    logout
    visit '/'
  end
end

RSpec.configure do |config|
  config.include IntegrationDeviseHelper, :type => :request
end

