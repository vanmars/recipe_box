class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
    @tags = Tag.all
    render :index
  end
  
  def new
    @recipe = Recipe.new
    render :new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        flash[:notice] = "How exciting! Your recipe was successfully added!"
        redirect_to recipes_path
      else
        flash[:alert] = "There was an error. Please try adding your recipe again."
        render :new 
      end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all
    if params[:tag_to_add]
      tag = Tag.find(params[:tag_to_add])
      # Add a check to see if recipe already contains new tag
      @recipe.tags.each do |t|
        if t.id == tag.id
          flash[:notice] = "You have already added that category."
          redirect_to recipe_path and return
        end
      end
      @recipe.tags << tag
    end
    render :show
  end  


  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path
      flash[:notice] = "Your recipe was successfully updated!"
    else
      flash[:alert]  = "There was an error. Please try updating your recipe again."
      render :edit
    end
  end  
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "YOU SHREDDED THAT RECIPE!"
    redirect_to recipes_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients, :rating)
    end
end  