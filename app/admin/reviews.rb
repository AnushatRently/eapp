ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :product_id, :comment, :rating
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :product_id, :comment, :rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :user_id
    column :product_id
    column :comment
    column :rating
    actions
  end

  filter :user_id,as: :select
  filter :product_id,as: :select
  filter :id,as: :select
  filter :comment,as: :select
  filter :rating,as: :select

end
