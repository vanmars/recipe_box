class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
    @tags = Tag.all
    render :index
  end
  
  def new
    if Tag.find(params[:tag_id])
      @tag = Tag.find(params[:tag_id])
      @recipe = @tag.recipes.new
    else
      @recipe = Recipe.new
    end
    render :new
  end
  
  def create
    if params[:tag_id]
      puts "was here"
      @tag = Tag.find(params[:tag_id])
      @recipe = @tag.recipes.new(recipe_params)
      if @recipe.save
        @tag.recipes << @recipe
        redirect_to tag_path(@tag)
      else
        flash[:alert] = "There was an error while creating your recipe."
        render :new 
      end


    else
      @recipe = Recipe.new(recipe_params)
      if @recipe.save
        flash[:notice] = "Recipe Created Successfully!"
        redirect_to recipes_path
      else
        flash[:alert] = "There was an error while creating your recipe."
        render :new 
      end
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
      flash[:notice] = "Recipe Updated Successfully!"
    else
      flash[:alert]  = "There was an error"
      render :edit
    end
  end  
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "YOU SHREDDED THAT RECIPE"
    redirect_to recipes_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients, :rating, :tag_id)
    end

    
end  