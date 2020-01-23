#include_recipe "rails"
include_recipe "passenger_apache2"

web_app "palm_staging" do
  cookbook "passenger_apache2"
  docroot "/path/to/root/"
  server_name "myproj.#{node[:domain]}"
  server_aliases [ "myproj", node[:hostname] ]
  rails_env "production"
end
