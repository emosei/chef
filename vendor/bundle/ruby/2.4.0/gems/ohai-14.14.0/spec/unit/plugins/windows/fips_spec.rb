#
# Author:: Matt Wrock (<matt@mattwrock.com>)
# Copyright:: Copyright (c) 2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative "../../../spec_helper.rb"
require "openssl"

describe Ohai::System, "plugin fips", :windows_only do
  let(:enabled) { 0 }
  let(:plugin) { get_plugin("windows/fips") }
  let(:fips_key) { 'System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy' }
  let(:win_reg_entry) { { "Enabled" => enabled } }
  let(:openssl_test_mode) { true }

  subject do
    plugin.run
    plugin["fips"]["kernel"]["enabled"]
  end

  before(:each) do
    allow(plugin).to receive(:collect_os).and_return(:windows)
    allow(Win32::Registry::HKEY_LOCAL_MACHINE).to receive(:open).with(fips_key, arch).and_yield(win_reg_entry)
  end

  around do |ex|
    begin
      $FIPS_TEST_MODE = openssl_test_mode
      ex.run
    ensure
      $FIPS_TEST_MODE = false
    end
  end

  shared_examples "fips_plugin" do
    context "fips enabled key is set to 1" do
      let(:enabled) { 1 }

      it "sets fips plugin" do
        expect(subject).to be(true)
      end
    end

    context "fips enabled key is set to 0" do
      let(:enabled) { 0 }

      it "does not set fips plugin" do
        expect(subject).to be(false)
      end
    end

    context "fips key does not exist" do
      before do
        allow(Win32::Registry::HKEY_LOCAL_MACHINE).to receive(:open).and_raise(Win32::Registry::Error, 50)
      end

      it "does not set fips plugin" do
        expect(subject).to be(false)
      end
    end
  end

  context "on 32 bit ruby" do
    let(:arch) { Win32::Registry::KEY_READ | 0x100 }

    before { stub_const("::RbConfig::CONFIG", { "target_cpu" => "i386" } ) }

    it_behaves_like "fips_plugin"
  end

  context "on 64 bit ruby" do
    let(:arch) { Win32::Registry::KEY_READ | 0x200 }

    before { stub_const("::RbConfig::CONFIG", { "target_cpu" => "x86_64" } ) }

    it_behaves_like "fips_plugin"
  end

  context "on unknown ruby" do
    let(:arch) { Win32::Registry::KEY_READ }

    before { stub_const("::RbConfig::CONFIG", { "target_cpu" => nil } ) }

    it_behaves_like "fips_plugin"
  end

  context "with Ruby 2.5 or newer", if: defined?(OpenSSL.fips_mode) do
    let(:arch) { Win32::Registry::KEY_READ }
    let(:openssl_test_mode) { false }

    context "with OpenSSL.fips_mode == false" do
      before { allow(OpenSSL).to receive(:fips_mode).and_return(false) }
      it "does not set fips plugin" do
        expect(subject).to be(false)
      end
    end

    context "with OpenSSL.fips_mode == true" do
      before { allow(OpenSSL).to receive(:fips_mode).and_return(true) }
      it "sets fips plugin" do
        expect(subject).to be(true)
      end
    end
  end
end
