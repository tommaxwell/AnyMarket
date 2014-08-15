if ENV['BONSAI_URL']
  Tire.configure do
    url "http://index.bonsai.io"
  end
  BONSAI_INDEX_NAME = ENV['BONSAI_URL'][/[^\/]+$/]
else
  app_name = Rails.application.class.parent_name.underscore.dasherize
  BONSAI_INDEX_NAME = "#{app_name}-#{Rails.env}"
end