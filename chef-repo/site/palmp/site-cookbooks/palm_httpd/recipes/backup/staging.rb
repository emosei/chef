apache2_install 'default'

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action [:start, :enable]
end

apache2_module 'deflate'
apache2_module 'headers'

app_dir = '/home/deployer/app/palm_mobile_app_staging/current/public'

directory app_dir do
  recursive true
end

file "#{app_dir}/index.html" do
  content 'Hello World'
  extend  Apache2::Cookbook::Helpers
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end

template 'basic_site' do
  extend  Apache2::Cookbook::Helpers
  source 'palm-httpd.conf.erb'
  path "#{apache_dir}/sites-available/palm_club_staging.conf"
  variables(
    server_name: 'palmblubtest.musashikoyama-palm.com',
    document_root: app_dir,
    log_dir: lazy { default_log_dir },
    site_name: 'palm_club_staging'
  )
end

apache2_site 'palm_club_staging'

apache2_site '000-default' do
  action :disable
end
