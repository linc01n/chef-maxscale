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

# Number of worker threads in MaxScale
default['maxscale']['threads'] = 4

# Definition of the monitor
default['maxscale']['monitor']['module'] = 'mysqlmon'
default['maxscale']['monitor']['user'] = 'myuser'
default['maxscale']['monitor']['pwd'] = 'mypwd'
default['maxscale']['monitor']['interval'] = 10_000
default['maxscale']['monitor']['backend_connect_timeout'] = ''
default['maxscale']['monitor']['backend_read_timeout'] = ''
default['maxscale']['monitor']['backend_write_timeout'] = ''
default['maxscale']['monitor']['detect_replication_lag'] = ''
default['maxscale']['monitor']['detect_stale_master'] = ''
default['maxscale']['monitor']['disable_master_failback'] = ''

# Read Connection Router config
default['maxscale']['read_connection_router']['enabled'] = true
default['maxscale']['read_connection_router']['user'] = 'myuser'
default['maxscale']['read_connection_router']['pwd'] = 'mypwd'
default['maxscale']['read_connection_router']['option'] = 'slave'

# RW Split Router conifg
default['maxscale']['rw_split_router']['enabled'] = true
default['maxscale']['rw_split_router']['user'] = 'myuser'
default['maxscale']['rw_split_router']['pwd'] = 'mypwd'

# read connection listener config
default['maxscale']['read_connection_listener']['enabled'] = true
default['maxscale']['read_connection_listener']['address'] = '127.0.0.1'
default['maxscale']['read_connection_listener']['port'] = '4008'

# rw split listener config
default['maxscale']['rw_split_listener']['enabled'] = true
default['maxscale']['rw_split_listener']['address'] = '127.0.0.1'
default['maxscale']['rw_split_listener']['port'] = '4006'

# debug listener config
default['maxscale']['debug_listener']['enabled'] = true
default['maxscale']['debug_listener']['address'] = '127.0.0.1'
default['maxscale']['debug_listener']['port'] = '4442'

# cli listener config
default['maxscale']['cli_listener']['enabled'] = true
default['maxscale']['cli_listener']['address'] = '127.0.0.1'
default['maxscale']['cli_listener']['port'] = '6603'

# Definition of the servers
default['maxscale']['server'] = []
default['maxscale']['databag']['server']['enabled'] = false
default['maxscale']['databag']['server']['name'] = 'maxscale'
default['maxscale']['databag']['server']['item_name'] = 'server'

# Definition of the filters
default['maxscale']['filter'] = []
default['maxscale']['databag']['filter']['enabled'] = false
default['maxscale']['databag']['filter']['name'] = 'maxscale'
default['maxscale']['databag']['filter']['item_name'] = 'filter'
