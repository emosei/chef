#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# package コマンドでインストール
%w{libxml2 libxslt}.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file "~/Gemfile" do
end

execute 'bundler_install' do
  command 'bundler install'
end

