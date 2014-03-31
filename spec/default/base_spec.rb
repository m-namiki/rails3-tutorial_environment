require 'spec_helper'

# for rbenv
describe group('rbenv') do
  it { should exist }
end

describe user('rbenv') do
  it { should exist}
end

describe file('/opt/rbenv') do
  it { should be_directory }
  it { should be_owned_by 'rbenv' }
  it { should be_grouped_into 'rbenv' }
end

# for added yum repo
describe yumrepo('epel') do
  it { should exist }
  it { should be_enabled }
end

describe yumrepo('remi') do
  it { should exist }
  it { should be_enabled }
end

# package for rails3-tutorial
describe package('sqlite-devel') do
  it { should be_installed }
end

# ruby version directory
describe file('/opt/rbenv/versions/1.9.3-p545') do
  it { should be_directory }
end

# ruby versions
describe command('ruby -v') do
  let(:path) { '/opt/rbenv/shims' }
  it { should return_stdout /ruby 1\.9\.3p545.+/ }
end

# for gem packages
describe package('rbenv-rehash') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem') }
end

describe package('rails') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem').with_version('3.2.14') }
end

# for node.js
describe command('node -v') do
  let(:path) { '/usr/local/bin' }
  it { should return_stdout 'v0.10.15' }
end
