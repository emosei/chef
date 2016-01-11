#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# package コマンドでインストール
#%w{libxml2 libxslt}.each do |pkg|
#  package pkg do
#    action :install
#  end
#end

bash 'mk_app_root' do
  code <<-EOH
    mkdir -p #{::File.join('home', node['user'], node['rails']['app_dir'])}
    EOH
  not_if { ::File.exists?(::File.join('/home', node['user'], node['rails']['app_dir'])) }
end

template "/etc/profile.d/rbenv.sh" do
  path "/etc/profile.d/rbenv.sh"
  source 'rbenv.sh.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

template 'rails_Gemfile' do
  path ::File.join('/home', node['user'], node['rails']['app_dir'], "Gemfile")
  source 'rails_Gemfile.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

bash 'rails_bndler_install' do
  cwd ::File.join('home', node['user'], node['rails']['app_dir'])
  code <<-EOH
    source /etc/profile.d/rbenv.sh
    bundle install --path vendor/bundle
    bundle exec rails new . -f
    EOH
  not_if { ::File.exists?(::File.join('/home', node['user'], node['rails']['app_dir'], "app")) }
end

template 'app_Gemfile' do
  path ::File.join('/home', node['user'], node['rails']['app_dir'], "Gemfile")
  source 'app_Gemfile.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

bash 'rails_app_create' do
  cwd ::File.join('/home', node['user'], node['rails']['app_dir'])
  code <<-EOH
    source /etc/profile.d/rbenv.sh
    bundle install --path vendor/bundle
    EOH
end
