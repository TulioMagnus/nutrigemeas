# frozen_string_literal: true

class ApplicationController < ActionController::Base
  after_action :generate_alert

  def generate_alert
    notice = flash.now[:notice]
    alert = flash.now[:alert]
    success = flash.now[:success]
    warning = flash.now[:warning]

    if notice.present?
      sweetalert_info(notice, '', toast: true, position: 'top-end', icon: 'info', timer: 5000, button: false)
      flash[:notice] = nil
    end

    if success.present?
      sweetalert_success(success, '', toast: true, position: 'top-end', icon: 'success', timer: 5000, button: true)
      flash[:success] = nil
    end

    if alert.present?
      sweetalert_error(alert, 'Atenção!', timer: 50_000, icon: 'error', button: 'Entendido!')
      flash[:alert] = nil
    end

    if warning.present?
      sweetalert_error(warning, '', timer: 50_000, icon: 'warning', button: 'Entendido!')
      flash[:warning] = nil
    end
  end

  def build_notification(icon, message, url)
    { icon: icon, message: message, url: url }
  end
end
