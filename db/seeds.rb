AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

table_names = %w(members articles entries)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds",Rails.env,table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end
