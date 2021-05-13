class ApplicationController < ActionController::Base

  def get_remote_ip
    if request.remote_ip == '::1'
      # Hard coded remote address
      '149.167.62.138'
    else
      request.remote_ip
    end
  end

end
