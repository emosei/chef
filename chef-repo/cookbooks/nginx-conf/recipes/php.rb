#
# Cookbook Name:: nginx-conf
# Recipe:: default
#
# Copyright 2015, OpenWorks
#
# All rights reserved - OpenWorks. co.ltd
#

template "php.conf" do
  path "/etc/nginx/sites-available/#{node['nginx-conf']['php']}.conf"
  source 'nginx-php.conf.erb'
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[nginx]'
end

root_dir = "/home/#{node['user']}/#{node['php']['root_dir']}"
directory root_dir do
  owner "#{node['user']}"
  group "#{node['user']}"
  recursive true
end

template "index.php" do
  path "#{root_dir}/index.php"
  source 'index.php.erb'
  owner "#{node['user']}"
  group "#{node['user']}"
  mode '0755'
  notifies :reload, 'service[nginx]'
end

nginx_site 'default' do
  enable false
end
nginx_site "#{node['nginx-conf']['php']}.conf"
