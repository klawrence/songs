# frozen_string_literal: true
module CookiesHelper
  def show_cookie_banner?

    # ! cookies_accepted?
  end

  def cookies_accepted?
    request.cookies['cookie']
  end

  def analytics_cookies_ok?
    request.cookies['cookie'] != 'no_analytics'
  end
end
