class TelesocisController < ApplicationController
  respond_to :html, :json
  
  def index
    @telesocis = Telesoci.all
  end

  def show
    @telesoci = Telesoci.find(params[:id])
    respond_with(@telesoci)
  end

  def new
    @telesoci = Telesoci.new
  end

  def edit
    @telesoci = Telesoci.find(params[:id])
  end

  def create
    @telesoci = Telesoci.new(telesoci_params)
    if @telesoci.save
      redirect_to @telesoci
    else
      # TODO: Fix error in new when validation fails - being called as POST
      render 'new'
    end
  end

  def update
    @telesoci = Telesoci.find(params[:id])

    if @telesoci.update(telesoci_params)
      redirect_to @telesoci
    else
      render 'edit'
    end
  end

  def destroy
    puts "ON DESTROY - PARAMS IS: #{params.inspect}"

    @telesoci = Telesoci.find(params[:id])
    puts "ON DESTROY - FOUND: #{@telesoci.inspect}}"
    @telesoci.destroy
    redirect_to telesocis_path, notice: 'Telesoci was successfully destroyed.'
  end

  private
  
  def telesoci_params
    params.require(:telesoci).permit(:phone, :nickname, :first_name,
              :last_name, :company_name, :email, :url, :notes)
  end
  
end
