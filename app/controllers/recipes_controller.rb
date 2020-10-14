class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
    render :index
  end
  
  def new
    @recipe = Recipe.new
    #@tag = Tag.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      #flash[:notice] = "Created Successfully!"
      redirect_to recipes_path
    else
      #flash[:alert] = "There was an error"
      render :new 
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
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
      #flash[:notice] = "Recipe Updated Successfully!"
    else
      #flash[:alert]  = "There was an error"
      render :edit
    end
  end  
  
  def destroy
    @recipe = Recipe.find[params[:id]]
    @recipe.destroy
    #flash[:notice] = "YOU SHREDDED THAT RECIPE"
    redirect_to recipes_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients, :rating)
    end

    
end  