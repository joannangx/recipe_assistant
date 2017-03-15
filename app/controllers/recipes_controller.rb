class RecipesController < ApplicationController
  
  def index
  	dynamodb = Aws::DynamoDB::Client.new

  	@recipes = dynamodb.scan({
  		table_name: "Recipes"
  		})[0]
  end

  def recipe
  	dynamodb = Aws::DynamoDB::Client.new

  	@name = params[:dish]

  	@ingredients = dynamodb.scan({
  		table_name: "Recipes",
  		attributes_to_get: ["Ingredients"],
  		select: "SPECIFIC_ATTRIBUTES",
  		scan_filter: {
  			"RecipeName" => {
  				attribute_value_list: [params[:dish]],
  				comparison_operator: "EQ"
  			}
  		}
  		})[0]

  	@directions = dynamodb.scan({
  		table_name: "Recipes",
  		attributes_to_get: ["Directions"],
  		select: "SPECIFIC_ATTRIBUTES",
  		scan_filter: {
  			"RecipeName" => {
  				attribute_value_list: [params[:dish]],
  				comparison_operator: "EQ"
  			}
  		}
  		})[0]
  end	

  def ingredients
  	dynamodb = Aws::DynamoDB::Client.new

  	@ingredients = dynamodb.scan({
  		table_name: "Recipes",
  		attributes_to_get: ["Ingredients"],
  		select: "SPECIFIC_ATTRIBUTES",
  		scan_filter: {
  			"RecipeName" => {
  				attribute_value_list: [params[:dish]],
  				comparison_operator: "EQ"
  			}
  		}
  		})[0]
  end

  def directions
  	dynamodb = Aws::DynamoDB::Client.new

  	@directions = dynamodb.scan({
  		table_name: "Recipes",
  		attributes_to_get: ["Directions"],
  		select: "SPECIFIC_ATTRIBUTES",
  		scan_filter: {
  			"RecipeName" => {
  				attribute_value_list: [params[:dish]],
  				comparison_operator: "EQ"
  			}
  		}
  		})[0]
  end	

  def new
  end	

  def add
  	dynamodb = Aws::DynamoDB::Client.new

  	to_add = dynamodb.put_item({
  		table_name: "Recipes", 
  		item: {
  			"RecipeName" => params["recipe"]["recipeName"],
  			"Ingredients" => params["recipe"]["ingredients"],
  			"Directions" => params["recipe"]["directions"],
  		},
  	})
  	redirect_to root_path
  end

end
