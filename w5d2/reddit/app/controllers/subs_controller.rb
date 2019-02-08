class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:error] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by(id: param[:id])
  end

  def edit
    @sub = current_user.subs.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.requrie(:sub).permit(:title, :description)
  end
end
