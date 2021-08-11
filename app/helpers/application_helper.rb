module ApplicationHelper
  def main_logo
    link_to image_tag(t('site.logo.header.large'), alt: t('site.logo.header.alt')), home_path
  end

  def current_version
    Rails.application.config.deployed_at.as_json
  end
end
