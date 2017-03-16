module RecipesHelper

	def get_all_recipes
		dynamodb = Aws::DynamoDB::Client.new
		return  dynamodb.scan({
  					table_name: "Recipes"
  				})[0]
	end

	def get_recipe_attr(recipeName, attribute)
		dynamodb = Aws::DynamoDB::Client.new
		return dynamodb.scan({
			  		table_name: "Recipes",
			  		attributes_to_get: [attribute],
			  		select: "SPECIFIC_ATTRIBUTES",
			  		scan_filter: {
			  			"RecipeName" => {
			  				attribute_value_list: [recipeName],
			  				comparison_operator: "EQ"
			  			}
			  		}
		  		})[0]
	end

	def add_recipe_to_table(tableName, recipeName, ingredients, directions)
		dynamodb = Aws::DynamoDB::Client.new

		dynamodb.put_item({
	  		table_name: tableName, 
	  		item: {
	  			"RecipeName" => recipeName,
	  			"Ingredients" => ingredients,
	  			"Directions" => directions,
	  		},
	  	})

	end	
end
