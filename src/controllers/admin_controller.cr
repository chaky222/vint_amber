require "jasper_helpers"
require "base64"

class AdminController < ApplicationController

  before_action do
    # runs for specified actions
    # only [:index, :world, :show] { increment(1) }
    # runs for all actions
    all do
      puts "\n\n before_action started! \n\n"
      bauth = context.request.headers["Authorization"]?
      user_name = bauth ? Base64.decode_string(bauth.lchop("Basic ")).split(':').first : nil
      puts "\n\n user_name=[#{user_name}] \n\n"
    end
  end
  LAYOUT = "admin.slang"
end
