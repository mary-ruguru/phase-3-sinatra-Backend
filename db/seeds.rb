puts "🌱 Seeding spices..."

# Seed your database here

# create a recipe instance
r1 = Recipe.create(
    name: "Boba Tea",
    image_url: "bit.ly/3Jbezxu",
    ingredient: "Boba , Milk, Water",
    cooking_time: "30 Minutes"
)

# create user instance

u1 = User.create(
    username: "Leo Delatore",
    email: "leo@user.com",
    password: "delatore"
)

# create category instance
c1 = Category.create(
    recipe_id: r1.id,
    recipe_name: r1.name
)

puts "✅ Done seeding!"
