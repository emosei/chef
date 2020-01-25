#
# Cookbook Name:: ruby-env
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install openssl-devel and sqlite-devel
%w{ gcc gcc-c++ readline-devel openssl openssl-devel sqlite-devel nss curl libcurl bzip2 }.each do |pkg|
  package pkg do
    action [ :install, :upgrade ]
  end
end

# rbenv
git "/usr/local/.rbenv" do
  repository node['ruby-env']['rbenv_url']
  action :sync
  user  node['ruby-env']['user']
  group node['ruby-env']['group']
end

template "rbenv.sh" do
  source "rbenv.sh.erb"
  path   "/etc/profile.d/rbenv.sh"
  mode   0655
  owner  node['ruby-env']['user']
  group  node['ruby-env']['group']
  not_if "grep rbenv /etc/profile.d/rbenv.sh"
end

# ruby
directory "/usr/local/.rbenv/plugins" do
  mode   0755
  owner  node['ruby-env']['user']
  group  node['ruby-env']['group']
  action :create
end

git "/usr/local/.rbenv/plugins/ruby-build" do
  repository node['ruby-env']['ruby-build_url']
  action :sync
  user   node['ruby-env']['user']
  group  node['ruby-env']['group']
end

# source rbenv.sh
execute "source /etc/profile.d/rbenv.sh" do
  command "sh /etc/profile.d/rbenv.sh"
end

# install ruby
execute "rbenv install #{node['ruby-env']['version']}" do
  command "/usr/local/.rbenv/bin/rbenv install #{node['ruby-env']['version']}"
  user   node['ruby-env']['user']
  group  node['ruby-env']['group']
  environment(
    'HOME' => "/usr/local",
    'RUBY_BUILD_CURL_OPTS' => "--tlsv1.2"
  )
  not_if { File.exists?("/usr/local/.rbenv/versions/#{node['ruby-env']['version']}") }
end

# set rbenv global
execute "rbenv global #{node['ruby-env']['version']}" do
  command "/usr/local/.rbenv/bin/rbenv global #{node['ruby-env']['version']}"
  user   node['ruby-env']['user']
  group  node['ruby-env']['group']
  environment(
    'HOME' => "/usr/local"
  )
end

# install rbenv-rehash and bundler gem
%w{rbenv-rehash}.each do |gem_name|
  execute "gem install #{gem_name}" do
    command "/usr/local/.rbenv/shims/gem install #{gem_name}"
    user   node['ruby-env']['user']
    group  node['ruby-env']['group']
    environment(
      'HOME' => "/usr/local"
    )
    not_if "/usr/local/.rbenv/shims/gem list | grep #{gem_name}"
  end
end

# install rbenv-rehash and bundler gem
execute "gem install bundler" do
  command "/usr/local/.rbenv/shims/gem install bundler -v 1.16.4"
  user   node['ruby-env']['user']
  group  node['ruby-env']['group']
  environment(
    'HOME' => "/usr/local"
  )
  not_if "/usr/local/.rbenv/shims/gem list | grep bundler"
end
