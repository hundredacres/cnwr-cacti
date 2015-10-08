require 'spec_helper'


describe 'cacti' do
  context 'supported operating systems' do
    describe "cacti class without any parameters on RHEL 7" do
      let(:params) {{ }}
      let(:facts) {{
        :osfamily => "Redhat",
        :operatingsystemmajrelease => "7",
      }}

      it { should compile.with_all_deps }

      it { should contain_class('cacti::deps').that_comes_before('cacti::install') }
      it { should contain_class('cacti::params') }
      it { should contain_class('cacti::install').that_comes_before('cacti::mysql') }
      it { should contain_class('cacti::mysql').that_comes_before('cacti::config') }
      it { should contain_class('cacti::config') }
      it { should contain_class('cacti::service') }

    end
  end
end
