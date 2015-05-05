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

# Currently valid options for all monitors are:
# module=[mysqlmon|galeramon]
# Definition of the monitor
default['maxscale']['monitor']['module'] = 'mysqlmon'
default['maxscale']['monitor']['user'] = 'myuser'
default['maxscale']['monitor']['pwd'] = 'mypwd'
default['maxscale']['monitor']['interval'] = 10_000

# Read Connection Router config
default['maxscale']['read_connection_router']['enabled'] = true
default['maxscale']['read_connection_router']['user'] = 'myuser'
default['maxscale']['read_connection_router']['pwd'] = 'mypwd'
default['maxscale']['read_connection_router']['option'] = 'slave' #	router_options = master|slave|synced

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
# default['maxscale']['server'] = [
#  { name: 'Server1', type: 'server', address: '10.0.0.1', port: 3000, protocol: 'MySQLBackend' },
#  { name: 'Server2', type: 'server', address: '10.0.0.2', port: 3000, protocol: 'MySQLBackend' },
#  { name: 'Server3', type: 'server', address: '10.0.0.3', port: 3000, protocol: 'MySQLBackend' }
# ]

default['maxscale']['server'] = []
