#
# Cookbook Name:: nginx-conf
# Recipe:: default
#
# Copyright 2015, OpenWorks
#
# All rights reserved - OpenWorks. co.ltd
#

template "vhost.conf" do
  path "/etc/nginx/sites-available/#{node['nginx-conf']['vhost']}.conf"
  source 'nginx-vhost.conf.erb'
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[nginx]'
end

nginx_site 'default' do
  enable false
end
nginx_site "#{node['nginx-conf']['vhost']}.conf"
