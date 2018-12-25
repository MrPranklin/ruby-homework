# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = params[:id]
  end

  def new
    @user = User.new
  end
end
