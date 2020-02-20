#
# Cookbook:: mongo_ami
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo_ami::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install apt from a recipe' do
       expect(chef_run).to include_recipe 'apt'
    end

    it 'should create a mongod.conf template in ...' do
      expect(chef_run).to create_template('/etc/mongod.conf').with_variables(bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
      port: node['mongodb']['config']['mongod']['net']['port'])
    end

    it 'should create a mongod.service template in ...' do
      expect(chef_run).to create_template('/lib/systemd/system/mongod.service')
    end

    it 'enables mongod service' do
      expect(chef_run).to enable_service 'mongod'
    end

    it 'start mongod service' do
      expect(chef_run).to start_service 'mongod'
    end

  end

  # context 'When all attributes are default, on CentOS 7' do
  #   # for a complete list of available platforms and versions see:
  #   # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
  #   platform 'centos', '7'
  #
  #   it 'converges successfully' do
  #     expect { chef_run }.to_not raise_error
  #   end
  # end
end
