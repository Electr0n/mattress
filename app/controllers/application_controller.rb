class ApplicationController < ActionController::Base

  before_filter :find_seo
  protect_from_forgery

  def find_seo
    if params[:controller] =~ /\A(home|mattresses|pages)\z/
      @seo ||= Seo.for(seo_type)
    end
  end

  def seo_type
    type = params[:controller].try(:classify)
    id = params[:id]
    case params[:controller]
    when 'pages'
      type = 'PagePart'
    when 'mattresses'
      type = if params[:id]
               'Mattress'
             elsif params[:product_series_id]
               id = params[:product_series_id]
               'ProductSeries'
             elsif params[:manufacturer_id]
               id = params[:manufacturer_id]
               'Manufacturer'
             else
               'Mattress'
             end
    end
    {model_type: type, model_id: id}
  end
end
