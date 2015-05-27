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

all_filters = []
all_servers = []

if node['maxscale']['databag']['filter']['enabled']
  # Load filter from Data Bags
  databag_filter = data_bag_item(node['maxscale']['databag']['filter']['name'], \
                                 node['maxscale']['databag']['filter']['item_name'])
  all_filters = node['maxscale']['filter'] + databag_filter['filter']
else
  all_filters = node['maxscale']['filter']
end

if node['maxscale']['databag']['server']['enabled']
  # Load servers from Data Bags
  databag_server = data_bag_item(node['maxscale']['databag']['server']['name'], \
                                 node['maxscale']['databag']['server']['item_name'])
  all_servers = node['maxscale']['server'] + databag_server['server']
else
  all_servers = node['maxscale']['server']
end

template '/usr/local/skysql/maxscale/etc/MaxScale.cnf' do
  source 'maxscale.cnf.erb'
  action :create
  notifies :restart, 'service[maxscale]', :delayed
  variables(
    maxscale_filters: all_filters,
    maxscale_servers: all_servers
    )
end
