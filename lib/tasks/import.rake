namespace :import do
  desc "Import users as CSV"
  task user: :environment do
    file_path = File.join Rails.root, "user.csv"
    CSV.foreach(file_path, headers: true) do |row|
        user = User.create(email: row["email"],password: row["password"],password_confirmation: row["password_confirmation"],name: row["name"], role: row["role"])
        puts("#{user.email} - creation failed - #{user.errors.full_messages.join(';')}") if user.errors.any?
       puts("#{user.email} - created successfully") if not user.errors.any?
    end
  end
  end
