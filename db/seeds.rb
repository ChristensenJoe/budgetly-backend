puts "🌱 Seeding spices..."

# Seed your database here

puts "Seeding User Table"

User.create(username: "Test", hashed_password: "12345")

puts "Seeding Category Table"

Category.create(user_id: 1, name: "Food", balance: 1200, percentage: 0.12)
Category.create(user_id: 1, name: "Entertainment", balance: 600, percentage: 0.04)
Category.create(user_id: 1, name: "Saving", balance: 2400, percentage: 0.20)

puts "Seeding Transactions Table"

Transaction.create(user_id: 1, name: "Burrito", amount: 12)

puts "Seeding Category Transaction Table"

CategoryTransaction.create(category_id: 1, transaction_id: 1, primary_category: true)
CategoryTransaction.create(category_id: 2, transaction_id: 1, primary_category: false)
CategoryTransaction.create(category_id: 3, transaction_id: 1, primary_category: false)


puts "✅ Done seeding!"
