#
# Cookbook:: apache2
# Definition:: web_app
#
# Copyright:: 2008-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :web_app, template: 'web_app.conf.erb', local: false, enable: true, server_port: 80 do
  require_relative '../libraries/helpers.rb'

  application_name = params[:name]

  include_recipe 'apache2::default'
  include_recipe 'apache2::mod_rewrite'
  include_recipe 'apache2::mod_deflate'
  include_recipe 'apache2::mod_headers'

  template "#{apache_dir}/sites-available/#{application_name}.conf" do
    source params[:template]
    local params[:local]
    owner 'root'
    group node['apache']['root_group']
    mode '0644'
    cookbook params[:cookbook] if params[:cookbook]
    variables(
      application_name: application_name,
      params: params
    )
    if ::File.exist?("#{apache_dir}/sites-enabled/#{application_name}.conf")
      notifies :reload, 'service[apache2]', :delayed
    end
  end

  site_enabled = params[:enable]
  apache_site params[:name] do
    enable site_enabled
  end
end
