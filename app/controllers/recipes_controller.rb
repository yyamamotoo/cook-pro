class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    url = params[:recipe][:video]
    url = url.last(11)
    @recipe.video = url

    if @recipe.valid?
      @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:video, :title, :text, :image).merge(user_id: current_user.id)
  end
end
