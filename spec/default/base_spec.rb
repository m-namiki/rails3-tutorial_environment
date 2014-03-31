require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
  it { should be_enabled }
end

describe yumrepo('remi') do
  it { should exist }
  it { should be_enabled }
end

describe package('sqlite-devel') do
  it { should be_installed }
end

=begin
以下のテストケースは、serverspecが<code>sudo</code>としてコマンドを実行するためすべて失敗する。
rbenvでrubyをインストールしたから？

sudo ruby -v

sudo gem list --local |  grep -w -- 

describe command ('ruby -v') do
  it { should return_stdout /.+ruby 1\.9\.3p545.+/ }
end

describe package('rbenv-rehash') do
  it { should be_installed.by('gem') }
end

describe package('rails') do
  it { should be_installed.by('gem').with_version('3.2.14') }
end

=end
