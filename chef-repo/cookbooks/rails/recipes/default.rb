#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2015, OpenWorks
#
# All rights reserved - Do Not Redistribute
#
# package コマンドでインストール
#%w{libxml2 libxslt}.each do |pkg|
#  package pkg do
#    action :install
#  end
#end

#アプリケーションディレクトリを作成する。
bash 'mk_app_root' do
  code <<-EOH
    mkdir -p #{::File.join('home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])}
    EOH
  not_if { ::File.exists?(::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])) }
end

bash 'chown_app_user' do
  code <<-EOH
    chown -R #{node['user']}:#{node['user']} #{::File.join('home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])}
    EOH
end

bash 'chmod_app_dir' do
  code <<-EOH
    chmod -R 755 #{::File.join('home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])}
    EOH
end

template "/etc/profile.d/rbenv.sh" do
  path "/etc/profile.d/rbenv.sh"
  source 'rbenv.sh.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

#railsインストールのGemファイル作成
template 'rails_Gemfile' do
  path ::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], "Gemfile")
  source 'rails_Gemfile.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

#railsインストール
bash 'rails_bndler_install' do
  cwd ::File.join('home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])
  code <<-EOH
    source /etc/profile.d/rbenv.sh
    bundle install --path vendor/bundle
    bundle exec rails new . -f
    EOH
  not_if { ::File.exists?(::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], 'app')) }
end

#app用のGemファイル作成
template 'app_Gemfile' do
  path ::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], "Gemfile")
  source 'app_Gemfile.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end

#rails app Gemインストール
bash 'rails_app_create' do
  cwd ::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'])
  code <<-EOH
    source /etc/profile.d/rbenv.sh
    bundle install --path vendor/bundle
    EOH
end

#unicorn 設定ファイル作成
template 'unicorn_config' do
  path ::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'],"config", "unicorn.rb")
  source 'unicorn.rb.erb'
  owner node['user']
  group node['user']
  mode  '0644'
end


