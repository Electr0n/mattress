class PagesController < ApplicationController
  def show
    @page = PagePart.find(params[:id])
  end

  def articles
    @articles = PagePart.articles
  end
end
