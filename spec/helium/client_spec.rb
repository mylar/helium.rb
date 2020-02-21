# frozen_string_literal: true

RSpec.describe Helium::Client do
  let(:instance) { described_class.new }

  describe '#account' do
    let(:address) { Helium::Address.from_base58('13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH') }
    let(:response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures account.response.json])) }

    subject { instance.account(address) }

    before do
      stub_request(:get, 'https://explorer.helium.foundation/api/accounts/13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH')
        .to_return(status: 200, body: response)
    end

    it 'calls the Helium API to fetch account details for an address' do
      expect(subject).to have_key('address')
      expect(subject).to have_key('balance')
      expect(subject).to have_key('nonce')
    end

    it 'has a nonce' do
      expect(subject['nonce']).to eq(6)
    end
  end
end
