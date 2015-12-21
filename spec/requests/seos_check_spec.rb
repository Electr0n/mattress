require "spec_helper"

describe 'Seos check', :js, :type => :request do

  let!(:manufacturer) {Manufacturer.first}
  let!(:product_series) {manufacturer.product_serieses.first}
  let!(:mattress) {FactoryGirl.create(:mattress, product_series: product_series)}

  let!(:app_seo) { Seo.default }

  before :each do
    @seos = {}
    [ Manufacturer, ProductSeries, Mattress ].each do |model_class|
      model_class.seo.try(:destroy)
      model = model_class.name.underscore
      @seos[model + '_base'] = FactoryGirl.create(:seo, title: model+'_base', model_type: model_class.name, model_id: nil)
      @seos[model] = FactoryGirl.create(:seo, title: model, model_type: model_class.name, model_id: send(model).id)
      send(model).seo = @seos[model]
    end
    app_seo.update_attributes(title: 'app_seo')
  end

  it 'should pass' do
    visit('/')
    page.find('title').text.should == app_seo.title
    visit(mattresses_path)
    page.find('title').text.should == @seos['mattress_base'].title
    click_on(manufacturer.name)
    page.find('title').text.should == @seos['manufacturer'].title
    click_on(product_series.title)
    page.find('title').text.should == @seos['product_series'].title
    click_on(mattress.title)
    page.find('title').text.should == @seos['mattress'].title
    click_on(manufacturer.name)
    page.find('title').text.should == @seos['manufacturer'].title
  end
end
