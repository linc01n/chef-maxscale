require 'spec_helper'

describe 'maxscale::default' do
  describe 'Ubuntu 14.04' do
    let(:chef_run) do
      env_options = { platform: 'ubuntu', version: '14.04' }
      ChefSpec::SoloRunner.new(env_options).converge(described_recipe)
    end

    it 'sets up an apt repository for `maxscale`' do
      expect(chef_run).to add_apt_repository('maxscale')
    end

    it 'install maxscale package' do
      expect(chef_run).to install_package('maxscale')
    end

    it 'create links for maxscale bins' do
      expect(chef_run).to create_link('/usr/local/sbin/maxadmin')
      expect(chef_run).to create_link('/usr/local/sbin/maxkeys')
      expect(chef_run).to create_link('/usr/local/sbin/maxpasswd')
      expect(chef_run).to create_link('/usr/local/sbin/maxscale')
    end

    it 'create maxscale config' do
      expect(chef_run).to create_template('/usr/local/mariadb-maxscale/etc/MaxScale.cnf')
    end

    it 'enable maxscale service' do
      expect(chef_run).to enable_service('maxscale')
    end
  end

  describe 'Debian 7.6' do
    let(:chef_run) do
      env_options = { platform: 'debian', version: '7.6' }
      ChefSpec::SoloRunner.new(env_options).converge(described_recipe)
    end

    it 'sets up an apt repository for `maxscale`' do
      expect(chef_run).to add_apt_repository('maxscale')
    end

    it 'install maxscale apt-transport-https' do
      expect(chef_run).to install_package('apt-transport-https')
    end

    it 'install maxscale package' do
      expect(chef_run).to install_package('maxscale')
    end

    it 'create links for maxscale bins' do
      expect(chef_run).to create_link('/usr/local/sbin/maxadmin')
      expect(chef_run).to create_link('/usr/local/sbin/maxkeys')
      expect(chef_run).to create_link('/usr/local/sbin/maxpasswd')
      expect(chef_run).to create_link('/usr/local/sbin/maxscale')
    end

    it 'create maxscale config' do
      expect(chef_run).to create_template('/usr/local/mariadb-maxscale/etc/MaxScale.cnf')
    end

    it 'enable maxscale service' do
      expect(chef_run).to enable_service('maxscale')
    end
  end

  describe 'CentOS 7' do
    let(:chef_run) do
      env_options = { platform: 'centos', version: '7.0' }
      ChefSpec::SoloRunner.new(env_options).converge(described_recipe)
    end

    it 'sets up a yum repository for `maxscale`' do
      expect(chef_run).to create_yum_repository('maxscale')
    end

    it 'install maxscale package' do
      expect(chef_run).to install_package('maxscale')
    end

    it 'create links for maxscale bins' do
      expect(chef_run).to create_link('/usr/local/sbin/maxadmin')
      expect(chef_run).to create_link('/usr/local/sbin/maxkeys')
      expect(chef_run).to create_link('/usr/local/sbin/maxpasswd')
      expect(chef_run).to create_link('/usr/local/sbin/maxscale')
    end

    it 'create maxscale config' do
      expect(chef_run).to create_template('/usr/local/mariadb-maxscale/etc/MaxScale.cnf')
    end

    it 'enable maxscale service' do
      expect(chef_run).to enable_service('maxscale')
    end
  end
end
