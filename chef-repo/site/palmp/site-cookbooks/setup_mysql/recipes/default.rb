#
# Cookbook Name:: setup_mysql
# Recipe:: default
#
# Copyright 2019, OpenWorks
#
# All rights reserved - Do Not Redistribute
#
remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el7-5.noarch.rpm" do
  source 'http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm'
  action :create
end

rpm_package 'mysql-community-release' do
  source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el7-5.noarch.rpm"
  action :install
end

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
