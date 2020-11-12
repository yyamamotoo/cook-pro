class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(updated_at: :desc).limit(5)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    url = params[:recipe][:video]
    url = url.last(11)
    @recipe.video = url

    if @recipe.save
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
    params.require(:recipe).permit(:video, :title, :text, :image,
                                   :cook_1, :cook_2, :cook_3, :cook_4, :cook_5, :cook_6, :cook_7, :cook_8, :cook_9, :cook_10,
                                   :vegetable_1, :vegetable_2, :vegetable_3, :vegetable_4, :vegetable_5, :vegetable_6, :vegetable_7, :vegetable_8, :vegetable_9, :vegetable_10,
                                   :food_1, :food_2, :food_3, :food_4, :food_5, :food_6, :food_7, :food_8, :food_9, :food_10).merge(user_id: current_user.id)
  end
end
