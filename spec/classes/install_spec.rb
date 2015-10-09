require 'spec_helper'

describe 'cacti::install' do
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
          case os
          when "redhat-7-x86_64"
            it do
              is_expected.to contain_package('cacti').
                with({"ensure"=>"present"})
          end

        end
        end
    end
  end
end
