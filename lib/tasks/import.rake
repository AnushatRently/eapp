namespace :import do
  desc "Import Product as CSV"
  task product_import_from_csv: :environment do
    file_path = File.join Rails.root, "products.csv"
    CSV.foreach(file_path, headers: true) do |row|
        product=Product.create(title:row["title"],description:row["description"],cost:row["cost"], available:row["available"],user_id:row["user_id"],about:row["about"],rating:row["rating"])
        puts("#{product.title} - creation failed - #{product.errors.full_messages.join(';')}") if product.errors.any?
       puts("#{product.title} - created successfully") if not product.errors.any?
    end
  end
  end
