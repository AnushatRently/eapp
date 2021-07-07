ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :description, :cost, :img_url, :user_id, :available
  #
  # or
  #
  #permit_params do
  #   permitted = [:title, :description, :cost, :img_url, :user_id, :available]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :title
      row :description
      row :cost
      row :available
      row :image do |ad|
        image_tag url_for(ad.img_url)
      end
    end
  end

end
