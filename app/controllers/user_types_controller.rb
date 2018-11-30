class UserTypesController < ApplicationController

  def new
     @type=UserType.new
   end


  def create
     @type=UserType.new(params.required(:user_type).permit(:name))
   end
end
