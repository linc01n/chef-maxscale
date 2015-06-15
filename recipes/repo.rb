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

case node['platform_family']
when 'debian'
  include_recipe 'apt'

  package 'apt-transport-https' if node['platform_version'] < '8'

  apt_repository 'maxscale' do
    uri node['mariadb']['apt']['uri']
    arch node['mariadb']['apt']['arch']
    distribution node['lsb']['codename']
    components node['mariadb']['apt']['components']
    key node['mariadb']['apt']['key']
  end

when 'rhel'
  include_recipe 'yum'

  yum_repository 'maxscale' do
    description node['mariadb']['yum']['description']
    baseurl node['mariadb']['yum']['baseurl']
    gpgkey node['mariadb']['yum']['gpgkey']
    gpgcheck node['mariadb']['yum']['gpgcheck']
    sslverify node['mariadb']['yum']['sslverify']
  end
end
