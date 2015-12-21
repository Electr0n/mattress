class Admin::SeosController < Admin::ApplicationController
  def update
    @seo = Seo.find(params[:id])
    if @seo.update_attributes(params[:seo])
      flash[:notice] = 'Seo updated'
    else
      flash[:error] = 'Seo not updated'
    end
  end
end
