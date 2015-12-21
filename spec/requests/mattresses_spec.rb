require 'spec_helper'

describe "Mattresses" do
  describe "GET /mattresses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mattresses_path
      response.should be_success
    end
  end
end
