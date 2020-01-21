include_recipe 'apache2'

web_app 'palm-httpd' do
  template 'palm-httpd.conf.erb'
end

web_app 'palm-httpd-ssl' do
  template 'palm-httpd-ssl.conf.erb'
end

