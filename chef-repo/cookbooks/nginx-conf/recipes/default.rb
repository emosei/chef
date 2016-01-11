#
# Cookbook Name:: nginx-conf
# Recipe:: default
#
# Copyright 2015, OpenWorks
#
# All rights reserved - OpenWorks. co.ltd
#
template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[nginx]'
end
