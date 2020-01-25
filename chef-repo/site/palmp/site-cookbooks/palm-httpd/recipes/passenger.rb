
#include_recipe "rails"
include_recipe "passenger_apache2"

web_app "palm_production" do
  cookbook "passenger_apache2"
  docroot "#{node[:palmclub][:docroot]}"
  server_name "#{node[:palmclub][:servername]}"
  server_aliases []
  rails_env "production"
end
