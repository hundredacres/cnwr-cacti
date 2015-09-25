require 'spec_helper'

describe 'cacti' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "cacti class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('cacti::params') }
        it { should contain_class('cacti::install').that_comes_before('cacti::config') }
        it { should contain_class('cacti::config') }
        it { should contain_class('cacti::service').that_subscribes_to('cacti::config') }

        it { should contain_service('cacti') }
        it { should contain_package('cacti').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'cacti class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('cacti') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
