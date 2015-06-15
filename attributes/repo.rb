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

# Apt
case node['platform']
when 'ubuntu'
  default['mariadb']['apt']['uri'] = 'https://downloads.mariadb.com/software/mariadb-maxscale/1.1/repo/ubuntu/'
when 'debian'
  default['mariadb']['apt']['uri'] = 'https://downloads.mariadb.com/software/mariadb-maxscale/1.1/repo/debian/'
end

default['mariadb']['apt']['arch'] = 'amd64'
default['mariadb']['apt']['components'] =  ['main']
default['mariadb']['apt']['key'] = 'https://downloads.mariadb.com/software/mariadb-maxscale/1.1/Maxscale-GPG-KEY.public'
default['mariadb']['apt']['package'] = 'maxscale'

# Yum
default['mariadb']['yum']['description'] = 'MaxScale'
default['mariadb']['yum']['baseurl'] = 'https://downloads.mariadb.com/software/mariadb-maxscale/1.1/yum/centos7/x86_64/'
default['mariadb']['yum']['gpgkey'] = 'https://downloads.mariadb.com/software/mariadb-maxscale/1.1/Maxscale-GPG-KEY.public'
default['mariadb']['yum']['gpgcheck'] = true
default['mariadb']['yum']['sslverify'] = true
default['mariadb']['yum']['package'] = 'maxscale'
