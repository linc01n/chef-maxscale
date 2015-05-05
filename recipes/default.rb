#
# Cookbook Name:: maxscale
# Recipe:: default
#
# Copyright 2015, Dennis Pattmann
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

if node['maxscale']['server'].empty?
  Chef::Log.info 'No backend server specified - exiting'
  return
end

service 'maxscale' do
  supports reload: true, status: true, restart: true
  action :enable
  subscribes :reload, 'template[/usr/local/skysql/maxscale/etc/MaxScale.cnf]', :immediately
end

include_recipe 'maxscale::repo'
include_recipe 'maxscale::install'
include_recipe 'maxscale::configure'
