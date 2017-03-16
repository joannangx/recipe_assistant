class RecipesController < ApplicationController
  include RecipesHelper

  def index
  	@recipes = get_all_recipes()
  end

  def show
  end	

  def ingredients
  end

  def directions
  end	

  def new
  end	

  def add
  	add_recipe_to_table("Recipes", params["recipe"]["recipeName"], params["recipe"]["ingredients"], 
      params["recipe"]["directions"])
  	redirect_to root_path
  end

end
