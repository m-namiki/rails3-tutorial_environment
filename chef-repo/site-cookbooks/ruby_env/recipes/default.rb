#
# Cookbook Name:: ruby_env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# for install Ruby
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

service "iptables" do
  action [:disable, :stop]
end
log "done iptables stop."

# add the EPEL repo
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  fastestmirror_enabled true
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end

# add the Remi repo
yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/6/remi/x86_64/'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end

%w{sqlite-devel}.each do |p|
  package p do
    action :install
  end
end
log "done package install."

rbenv_ruby "1.9.3-p545" do
  ruby_version "1.9.3-p545"
  global true
end
log "done ruby install."

gem_package "rbenv-rehash" do
  action :install
end
log "done rehash install."

gem_package "rails" do
  action :install
  version '3.2.14'
end
log "done rails3 install."