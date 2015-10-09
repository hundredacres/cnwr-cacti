require 'spec_helper'

services = [ 'httpd', 'snmpd' ]

describe 'cacti::service' do
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
        services.each do |service|
          it do
            is_expected.to contain_service(service).
              with({"ensure"=>"running",
                    "enable"=>"true",
                    "hasstatus"=>"true",
                    "hasrestart"=>"true"})
          end
        end
      end
  end
end
