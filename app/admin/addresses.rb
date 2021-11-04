ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :age, :phone_number, :door_no, :street, :city, :district, :pincode, :state, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :phone_number, :door_no, :street, :city, :district, :pincode, :state, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :age
    column :phone_number
    column :door_no
    column :street
    column :city
    column :district
    column :pincode
    column :state
    column :user_id

    actions
  end
  filter :name,as: :select
  filter :user_id,as: :select
  filter :age,as: :select
  filter :phone_number,as: :select
  filter :door_no,as: :select
  filter :street,as: :select
  filter :city,as: :select
  filter :district,as: :select
  filter :pincode,as: :select
  filter :state,as: :select
  

end
