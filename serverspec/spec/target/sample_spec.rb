require 'spec_helper'

# Rubyの指定バージョンがインストールされていること
describe command('ruby -v') do
  its(:stdout) { should match /3\.2\.3/ }
end

# Nginxがインストールされていること
describe package('nginx') do
  it { should be_installed }
end

# Nginxが起動しており、自動起動設定されていること
describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

# Pumaが起動していること
describe service('nginx') do
  it { should be_running }
end

# 80番ポートでリッスンしていること
describe port(80) do
  it { should be_listening }
end

# curlで接続してステータスコード200が返ること
describe command('curl http://127.0.0.1 -o /dev/null -w "%{http_code}" -s') do
  its(:stdout) { should match /^200$/ }
end
