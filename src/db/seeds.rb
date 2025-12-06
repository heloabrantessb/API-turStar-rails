# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_role = Role.find_or_create_by!(title: "Admin")
customer_role = Role.find_or_create_by!(title: "Customer")
manager_role = Role.find_or_create_by!(title: "Manager")

["Admin", "Customer"].each do |role_title|
  Role.find_or_create_by!(title: role_title)
end

User.find_or_create_by!(name: "Administrador", username: "admin", email: "admin@email.com", role: admin_role) do |user|
  user.password_digest = "admin123"
end             


User.find_or_create_by!(name: "Frederico Batista", username: "frederico.batista", email: "frederico.batista@email.com", role: customer_role) do |user|
  user.password_digest = "frederico123"
end

User.find_or_create_by!(name: "Diego Ferreira", username: "di.ferreira", email: "di.ferreira@email.com", role: manager_role) do |user|
  user.password_digest = "diego123"
end

["Beach", "Mountain", "City", "Ecological", "Historical"].each do |category|
  Category.find_or_create_by!(title: category)
end
