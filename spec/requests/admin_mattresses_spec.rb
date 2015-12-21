require "spec_helper"

describe 'Admin > Mattresses', :js, :type => :request do
  let(:admin) { FactoryGirl.create(:admin) }
  #let!(:size) { FactoryGirl.create(:size, width: 100, height: 200) }
  before { sign_in(admin) }
  it "should be able to add mattress" do
    pending 'New logic'
    visit admin_root_path
    within('h1') { page.should have_content('Mattresses') }
    click_on('New')
    within('h1') { page.should have_content('New Mattress') }
    FactoryGirl.attributes_for(:mattress).each do |k, v|
      fill_in "mattress_#{k}", :with => v
    end
    fill_in "mattress_title", :with => 'MyMattress'
    #click_on 'Add price'
    #fill_in 'Price', :with => 1000000
    #select '100x200', :from => 'Size'
    click_on 'Create Mattress'
    save_and_open_page
    page.should have_content('Mattress was successfully created.')
    page.should have_content('MyMattress')
  end
end
