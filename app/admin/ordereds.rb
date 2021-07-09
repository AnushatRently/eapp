ActiveAdmin.register Ordered do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :order_item_id, :total
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :order_item_id, :total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :user_id
    column :order_item_id
    column :total
    actions
  end


end
