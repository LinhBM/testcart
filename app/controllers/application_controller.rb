class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      Order.create order_status_id: 1
    end
  end
end
