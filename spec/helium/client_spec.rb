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

  describe '#submit_transaction' do
    let(:payer_keypair) { Helium::Keypair.generate }
    let(:payee_address) { Helium::Keypair.generate.address }
    let(:amount) { 2 }
    let(:transaction) { Helium.generate_payment_transaction(payer_keypair, payee_address, amount) }

    subject { instance.submit_transaction(transaction) }

    before do
      allow(Helium).to receive(:nonce).with(an_instance_of(Helium::Address)).and_return(1)
      stub_request(:post, 'https://explorer.helium.foundation/api/transactions')
        .to_return(status: 200, body: 'ok')
    end

    it 'calls the Helium API to submit the transaction' do
      expect(subject).to be_nil
    end
  end
end
