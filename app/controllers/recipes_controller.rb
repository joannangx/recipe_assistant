class RecipesController < ApplicationController
  include RecipesHelper

  def index
  	@recipes = get_all_recipes()
  end

  def recipe
  	@name = params[:dish]
  	@ingredients = get_recipe_attr(@name, "Ingredients")
  	@directions = get_recipe_attr(@name, "Directions")
    @image = get_recipe_attr(@name, "Image_URL")
  end	

  def ingredients
    @ingredients = get_recipe_attr(params[:dish], "Ingredients")
    puts @ingredients
  end

  def directions
    @directions = get_recipe_attr(params[:dish], "Directions")
  end	

  def new
  end	

  def add
  	add_recipe_to_table("Recipes", params["recipe"]["recipeName"], params["recipe"]["ingredients"], 
      params["recipe"]["directions"])
  	redirect_to root_path
  end

end
