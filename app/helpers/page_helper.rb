# frozen_string_literal: true
module PageHelper
  def configure_page options
    @page_options = options
  end

  def page_options
    @page_options ||= {}
  end

  def page_title
    site = page_options[:site_title] || t('site.title')
    title = page_options[:title]

    if title.blank?
      site
    else
      page_title_format site, title
    end
  end

  def page_title_format site, title
    "#{title} | #{site}"
  end

  def page_description
    description = page_options[:description]
    if description.blank?
      t('site.description')
    else
      description
    end
  end

  def canonical_url
    cleaned_url(page_options[:canonical_url] || request.url)
  end

  def open_graph_image
    page_options[:open_graph_image] || "/#{t('site.logo.open_graph')}"
  end

  def page_no_index?
    page_options[:noindex]
  end

  def copyright_message
    t('site.copyright_message', year: Time.now.year)
  end

  def last_deployment_timestamp
    t('site.last_deployment_timestamp', time: last_deployed_at)
  end

  def cleaned_url url
    url.split('?').first.sub(/\/$/, '')
  end

  def last_deployed_at
    Rails.application.config.deployed_at if admin?
  end
end
