ActiveAdmin.register OrderItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :quantity, :product_id, :user_id, :order_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:quantity, :product_id, :user_id, :order_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :quantity
    column :product_id
    column :user_id
    actions
  end

  filter :quantity,as: :select
  filter :product_id,as: :select
  filter :user_id,as: :select
end
