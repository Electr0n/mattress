class Admin::BulkPriceChangesController < Admin::ApplicationController
  def new
    @bulk_price_change = BulkPriceChange.new
  end

  def create
    @bulk_price_change = BulkPriceChange.new(params[:bulk_price_change])
    if @bulk_price_change.save
      flash[:notice] = 'Prices were successfuly changed'
      # render success
    else
      render 'new'
    end
  end
end
