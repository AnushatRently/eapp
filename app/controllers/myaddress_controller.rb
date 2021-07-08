class MyaddressController < ApplicationController
  def index
    @addresses=Address.all
  end
end
