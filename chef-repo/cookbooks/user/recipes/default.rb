#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, OpenWorks
#
# All rights reserved - Do Not Redistribute
#
group node["user"] do
  group_name node["user"]
  action     [:create]
end

user node["user"] do
  comment  "#{node["user"]} user"
  password node["passwd"]
  group node["user"]
  home     "/home/#{node["user"]}"
  manage_home true
  action   [:create, :manage]
end

