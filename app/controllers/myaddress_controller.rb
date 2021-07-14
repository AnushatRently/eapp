class MyaddressController < ApplicationController
  before_action :authenticate_user!
def index

  @addresses_has=Address.find_by(user_id:current_user)
  @addresses=Address.all

if @addresses_has
  redirect_to myaddress_path(:id=>current_user.id)

else
  redirect_to new_address_path
end
end


def show
  @addresses_has=Address.find_by(user_id:current_user)
  @addresses=Address.all
end
end
