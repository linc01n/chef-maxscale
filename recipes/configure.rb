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

if node['maxscale']['databag']['enabled']
  # Load filter from Data Bags
  databag_config = data_bag_item(node['maxscale']['databag']['name'], \
                                 node['maxscale']['databag']['item'])
  config_all = node['maxscale']['config'].merge(databag_config['config'])
else
  config_all = node['maxscale']['config']
end

template '/usr/local/mariadb-maxscale/etc/MaxScale.cnf' do
  source 'maxscale.cnf.erb'
  action :create
  notifies :restart, 'service[maxscale]', :delayed
  variables(
    config: config_all
    )
end
