class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    recipes = Recipe.all # get all recipes (array format)
    recipes.to_json()
  end

  # Get single recipe
  get "/recipe/:pk" do
    recipe = Recipe.find_by(id: params[:pk])
    recipe.to_json()
  end

  # Post Recipe..we use params to get data from postman or frontend
  post "/recipe/" do
    recipe = Recipe.create(
       name: params[:name],
       image_url: params[:image_url],
       ingredient: params[:ingredient],
       cooking_time: params[:cooking_time]
    )
    recipe.save()

    {
      "Message": "Created successfully",
      "Status": "HTTP_200_OK"
    }.to_json()
  end

  # Patch Recipe - is more of like updating
  patch "/recipe/update/:id" do
    recipe = Recipe.find_by(id: params[:id])

    recipe.update(
      name: params[:name],
      image_url: params[:image_url],
      ingredient: params[:ingredient],
      cooking_time: params[:cooking_time]
    )

    recipe.to_json()
  end

  # Delete Recipe
  delete "/recipe/:id" do
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    {
      "message":"Successfully Delete Recipe #{params[:id]}",
      "Status":"HTTP_Status_OK"
    }.to_json()
  end

  # Save User
  post "/user/" do
    existing_user = User.find_by(email: params[:email])
    # check if user exists
    if existing_user
      return {"error":"User Already Existing"}.to_json()
    end
    # create user instance
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    user.save
    {
      "message":"User Created successfully",
      "status": "HTTP_2001_created"
    }.to_json()
  end

  


  



end



