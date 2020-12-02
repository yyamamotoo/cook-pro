class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_recipe, only: [:index, :search]
  before_action :set_recipe, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @recipes = Recipe.all.order(updated_at: :desc)
  end

  def new
    @recipe = Recipe.new
    @recipe.materials.build
    @recipe.chefs.build
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
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user).order(updated_at: :desc)
    @material = Material.where(recipe_id: params[:id])
    @chef = Chef.where(recipe_id: params[:id])
    # if @comment.save
    # ActionCable.server.broadcast "comment_channel", content: @comment, name: @comment.user.name
    # end
  end

  def edit
    unless current_user == @recipe.user
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    url = params[:recipe][:video]
    url = url.last(11)
    @recipe.video = url
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.order(updated_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:video, :title, :text, :image, :genre_id,
                                   materials_attributes: [:id, :amount, :vegetable, :_destroy],
                                   chefs_attributes: [:id, :cook, :_destroy]).merge(user_id: current_user.id)
  end

  def search_recipe
    @p = Recipe.ransack(params[:q])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    unless @recipe.user == current_user
      redirect_to action: :index
    end
  end
end
