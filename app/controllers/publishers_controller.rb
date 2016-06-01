class PublishersController < ApplicationController

  def new
    @page_title = "Add New Publisher"
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher created succesffully"
    redirect_to publishers_path
    else
    render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    @publisher.update(publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher updated succesffully"
    redirect_to publishers_path
    else
    render 'edit'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.destroy
      flash[:notice] = "Publisher deleted succesffully"
    redirect_to publishers_path
    else
      flash.now[:alert] = "Publisher was NOT succesffully deleted"
    render 'edit'
    end
  end

  def index
    @publishers = Publisher.all
  end

  private
    def publisher_params
        params.require(:publisher).permit(:name)
  end
end
