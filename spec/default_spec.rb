require 'spec_helper'

describe 'maxscale::default' do
  describe '"Ubuntu 14.04' do
    let(:chef_run) do
      env_options = { platform: 'ubuntu', version: '14.04' }
      ChefSpec::SoloRunner.new(env_options) do |node|
        node.set['maxscale']['conf']['server'] = [
          { name: 'Server1', type: 'server', address: '10.0.0.1', port: 3000, protocol: 'MySQLBackend' },
          { name: 'Server2', type: 'server', address: '10.0.0.2', port: 3000, protocol: 'MySQLBackend' },
          { name: 'Server3', type: 'server', address: '10.0.0.3', port: 3000, protocol: 'MySQLBackend' }
        ]
      end.converge(described_recipe)
    end

    it 'sets up an apt repository for `maxscale`' do
      expect(chef_run).to add_apt_repository('maxscale')
    end

    it 'install maxscale package' do
      expect(chef_run).to install_package('maxscale')
    end

    it 'create maxscale config' do
      expect(chef_run).to create_template('/usr/local/skysql/maxscale/etc/MaxScale.cnf')
    end
  end

  describe 'CentOS 7' do
    let(:chef_run) do
      env_options = { platform: 'centos', version: '7.0' }
      ChefSpec::SoloRunner.new(env_options) do |node|
        node.set['maxscale']['conf']['server'] = [
          { name: 'Server1', type: 'server', address: '10.0.0.1', port: 3000, protocol: 'MySQLBackend' },
          { name: 'Server2', type: 'server', address: '10.0.0.2', port: 3000, protocol: 'MySQLBackend' },
          { name: 'Server3', type: 'server', address: '10.0.0.3', port: 3000, protocol: 'MySQLBackend' }
        ]
      end.converge(described_recipe)
    end

    it 'sets up a yum repository for `maxscale`' do
      expect(chef_run).to create_yum_repository('maxscale')
    end

    it 'install maxscale package' do
      expect(chef_run).to install_package('maxscale')
    end

    it 'create maxscale config' do
      expect(chef_run).to create_template('/usr/local/skysql/maxscale/etc/MaxScale.cnf')
    end
  end
end
