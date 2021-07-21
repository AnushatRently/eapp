ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :available

  scope :all, :default => true

  scope :banned_users do |users|
    users.where("locked_at is not null")
  end

 action_item :lock,only: :show do
    if user.access_locked?
      link_to 'Unlock User', unlock_admin_user_path(user),method: :put
    else
      link_to 'Lock User', lock_admin_user_path(user),method: :put
    end
  end

  member_action :lock,method: :put do
    user = User.find(params[:id])
    begin
      user.lock_access!
    rescue
      redirect_to admin_user_path(user)
    end

  end

  member_action :unlock,method: :put do
    user = User.find(params[:id])
    user.unlock_access!
    redirect_to admin_user_path(user)
  end


  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :name, :age, :phone_number, :door_no, :street, :city, :district, :pincode, :state, :available]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :name
    column :locked_at if params[:scope] == "banned_authors"
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :name
    end
  end



  filter :role,as: :select
  filter :id,as: :select
  filter :email,as: :select

end
