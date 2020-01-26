
#include_recipe "rails"
include_recipe "passenger_apache2"

web_app "#{node[:palm_httpd][:app_name]}" do
  cookbook "passenger_apache2"
  docroot "#{node[:palm_httpd][:docroot]}"
  server_name "#{node[:palm_httpd][:servername]}"
  server_aliases []
  rails_env "#{node[:palm_httpd][:rails_env]}"
end
