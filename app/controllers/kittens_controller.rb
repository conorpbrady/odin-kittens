class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created successfully"
      redirect_to @kitten
    else
      redirect_to 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
      end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten deleted successfully"
    redirect_to root_url
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update_attributes(kitten_params)
    flash[:success] = "Kitten edited successfully"
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :softness, :cuteness)
    end
end
