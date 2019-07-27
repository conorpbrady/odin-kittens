class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
    else
      redirect_to 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    Kitten.find(params[:id]).destroy
    redirect_to root_url
  end

  def update
    @kitten = Kitten.find(params[:id])
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :softness, :cuteness)
    end
end
