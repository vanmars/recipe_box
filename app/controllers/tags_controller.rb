class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
    render :index
  end
  
  def new
    @tag = Tag.new
    render :new
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Recipe category created successfully!"
      redirect_to tags_path
    else
      flash[:alert] = "There was an error. Please try again."
      render :new 
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
    render :show
  end  

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path
      flash[:notice] = "Recipe category updated successfully!"
    else
      flash[:alert]  = "There was an error. Please try again."
      render :edit
    end
  end  
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "YOU SHREDDED THAT CATEGORY!"
    redirect_to tags_path
  end
  
  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end  