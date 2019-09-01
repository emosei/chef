#
# Cookbook Name:: setup_mysql
# Recipe:: default
#
# Copyright 2019, OpenWorks
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password ''
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

#mysql2_chef_gem 'default' do
#  action :install
#end
