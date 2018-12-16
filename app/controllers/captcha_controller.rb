class CaptchaController < ApplicationController
  def new

  end

  def show
    @is_valid = params[:captcha]
  end

  def create
    x = params[:x].to_i
    y = params[:y].to_i
    z = params[:z].to_i
    n = params[:random_number].to_i

    is_valid = check(x, y, z, n)

    redirect_to "/captcha/#{is_valid}"

  end

  def check(x, y, z, n)
    if (x + y - z) == n
      return 1
    else
      return 0
    end
  end
  
end