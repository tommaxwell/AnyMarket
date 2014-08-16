if ENV['production']
  Tire.configure do
    url ENV['BONSAI_URL']
  end
  BONSAI_INDEX_NAME = ENV['BONSAI_URL'][/[^\/]+$/]
else
  app_name = Rails.application.class.parent_name.underscore.dasherize
  BONSAI_INDEX_NAME = "#{app_name}-#{Rails.env}"
end