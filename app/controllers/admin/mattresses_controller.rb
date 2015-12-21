class Admin::MattressesController < Admin::ApplicationController
  # GET /mattresses
  # GET /mattresses.json
  def index
    @filter = params[:filter] || {}
    @filter[:manufacturers] = @filter[:manufacturers].presence || Manufacturer.scoped.pluck(:id)
    @filter[:manufacturers].select!(&:present?)
    @filter[:manufacturers].map!(&:to_i)
    @filter[:product_serieses] = @filter[:product_serieses].presence || ProductSeries.scoped.pluck(:id)
    @filter[:product_serieses].select!(&:present?)
    @filter[:product_serieses].map!(&:to_i)


    @mattresses = Mattress.includes(:product_series).where{product_series.id.in my{@filter[:product_serieses]}}
    @seo = Mattress.seo

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mattresses }
    end
  end

  # GET /mattresses/1
  # GET /mattresses/1.json
  def show
    @mattress = Mattress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mattress }
    end
  end

  # GET /mattresses/new
  # GET /mattresses/new.json
  def new
    @mattress = Mattress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mattress }
    end
  end

  # GET /mattresses/1/edit
  def edit
    @mattress = Mattress.find(params[:id])
  end

  # POST /mattresses
  # POST /mattresses.json
  def create
    @mattress = Mattress.new(params[:mattress])

    respond_to do |format|
      if @mattress.save
        format.html { redirect_to [:admin, @mattress], notice: 'Mattress was successfully created.' }
        format.json { render json: @mattress, status: :created, location: @mattress }
      else
        format.html { render action: "new" }
        format.json { render json: @mattress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mattresses/1
  # PUT /mattresses/1.json
  def update
    @mattress = Mattress.find(params[:id])

    respond_to do |format|
      if @mattress.update_attributes(params[:mattress])
        format.html { redirect_to [:admin, @mattress], notice: 'Mattress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mattress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mattresses/1
  # DELETE /mattresses/1.json
  def destroy
    @mattress = Mattress.find(params[:id])
    @mattress.destroy

    respond_to do |format|
      format.html { redirect_to admin_mattresses_url }
      format.json { head :no_content }
    end
  end
end
