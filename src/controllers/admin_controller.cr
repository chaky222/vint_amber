require "jasper_helpers"
require "base64"

class AdminController < ApplicationController
  before_action do
    # runs for specified actions
    # only [:index, :world, :show] { increment(1) }
    # runs for all actions
    all do
      # puts "\n\n before_action started! \n\n"
      bauth = context.request.headers["Authorization"]?
      bauth = bauth.lchop("Basic ") if bauth
      user_name = Base64.decode_string(bauth) if bauth
      current_user = user_name ? User.find_by(:name, user_name.split(':').first) : nil
      # puts "\n\n current_user=[#{current_user.inspect}] \n\n"
      if current_user
        context.data[:user_id] = current_user.id
      else
        context.data[:user_id] = nil
        redirect_to "/login"
      end
    end
  end
  LAYOUT = "admin.slang"
end
