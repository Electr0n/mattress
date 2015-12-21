require 'spec_helper'

describe User do
  context 'validations' do
    let(:user) { FactoryGirl.build(:user) }
    it('should be valid from factory') { user.should be_valid }
    it('should validate presence of email') { user.email = ''; user.should be_invalid }
    it('should validate presence of password') { user.password = ''; user.should be_invalid }
    it('should validate password confirmation') { user.password_confirmation = user.password + 'asd'; user.should be_invalid }
  end
end
