require 'spec_helper'

deps = [ 'httpd', 'httpd-devel', 'php-mysql', 'php-pear',
         'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring',
         'php-cli', 'php-snmp', 'net-snmp-utils', 'net-snmp-libs',
         'rrdtool' ]

describe 'cacti::deps' do
  describe 'cacti' do
    on_supported_os({
      :hardwaremodels => ['x86_64'],
      :supported_os   => [
        {
          "operatingsystem" => "RedHat",
          "operatingsystemrelease" => [
            "7",
          ]
        }
      ],
    }).each do |os, facts|
        context "on #{os}" do
          let(:facts) do
            facts
          end
          let(:params) do
            {
            }
          end
          deps.each do |package|
            it do
              is_expected.to contain_package(package).
                with({"ensure"=>"present"})
          end
        end
       end
    end
  end
end
