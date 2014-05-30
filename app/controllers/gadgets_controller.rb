class GadgetsController < ApplicationController
  before_action :set_gadget, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @gadgets = current_user.gadgets
  end

  def new
    @gadget = Gadget.new
  end

  def edit
  end

  def create
    @gadget = current_user.gadgets.new(gadget_params)

    respond_to do |format|
      if @gadget.save
        format.html { redirect_to gadgets_url, notice: 'Gadget was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @gadget.update(gadget_params)
        format.html { redirect_to gadgets_url, notice: 'Gadget was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gadget.destroy
    respond_to do |format|
      format.html { redirect_to gadgets_url, notice: 'Gadget was successfully destroyed.' }
    end
  end

  def search
    @gadgets = Gadget.search(params[:q])
    flash[:notice] = "Found #{@gadgets.count} results for query '#{params[:q]}'"
    render :index
  end

  private
    def set_gadget
      @gadget = current_user.gadgets.find(params[:id])
    end

    def gadget_params
      params.require(:gadget).permit(:user_id, :name)
    end
end
