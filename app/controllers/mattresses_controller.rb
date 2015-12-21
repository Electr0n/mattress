# coding: utf-8"

class MattressesController < ApplicationController
  before_filter :find_context, :only => :index

  before_filter :load_menu_data

  def index
    #TODO pagination
    @mattresses = (@current_product_series || @current_manufacturer).mattresses.front_listing.page(params[:page])
    @spalni = (@current_manufacturer.name.casecmp('Спальни') == 0)
  end

  def show
    @mattress = Mattress.includes(:product_series, :manufacturer).find(params[:id])
    @current_product_series = @mattress.product_series
    @current_manufacturer = @mattress.manufacturer
    @spalni = (@current_manufacturer.name.casecmp('Спальни') == 0)
  end

  protected
  def load_menu_data
    @manufacturers = Manufacturer.includes(:product_serieses)
  end
  def find_context
    @current_manufacturer = Manufacturer.find(params[:manufacturer_id]) if params[:manufacturer_id]
    @current_product_series = ProductSeries.find(params[:product_series_id]) if params[:product_series_id]
    #@current_product_series ||= (@current_manufacturer.try(:product_serieses) || ProductSeries).first
    @current_manufacturer = @current_product_series.manufacturer if @current_product_series
    @current_manufacturer ||= Manufacturer.first
  end
end
