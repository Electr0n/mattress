class Admin::ProductSeriesController < Admin::ApplicationController
  # GET /product_series
  # GET /product_series.json
  def index
    @product_series = ProductSeries.all
    @seo = ProductSeries.seo

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_series }
    end
  end

  # GET /product_series/1
  # GET /product_series/1.json
  def show
    @product_series = ProductSeries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_series }
    end
  end

  # GET /product_series/new
  # GET /product_series/new.json
  def new
    @product_series = ProductSeries.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_series }
    end
  end

  # GET /product_series/1/edit
  def edit
    @product_series = ProductSeries.find(params[:id])
  end

  # POST /product_series
  # POST /product_series.json
  def create
    @product_series = ProductSeries.new(params[:product_series])

    respond_to do |format|
      if @product_series.save
        format.html { redirect_to [:admin, @product_series], notice: 'Product series was successfully created.' }
        format.json { render json: @product_series, status: :created, location: [:admin, @product_series] }
      else
        format.html { render action: "new" }
        format.json { render json: @product_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_series/1
  # PUT /product_series/1.json
  def update
    @product_series = ProductSeries.find(params[:id])

    respond_to do |format|
      if @product_series.update_attributes(params[:product_series])
        format.html { redirect_to [:admin, @product_series], notice: 'Product series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_series/1
  # DELETE /product_series/1.json
  def destroy
    @product_series = ProductSeries.find(params[:id])
    @product_series.destroy

    respond_to do |format|
      format.html { redirect_to admin_product_series_index_url }
      format.json { head :no_content }
    end
  end
end
