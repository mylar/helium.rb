# frozen_string_literal: true

RSpec.describe Helium do
  it 'has a version number' do
    expect(Helium::VERSION).not_to be nil
  end

  describe '.balance' do
    let(:address) { Helium::Address.from_base58('13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH') }
    let(:response) { File.read(File.join(File.dirname(__FILE__), %w[fixtures account.response.json])) }

    subject { described_class.balance(address) }

    before do
      stub_request(:get, 'https://api.helium.io/v1/accounts/13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH')
        .to_return(status: 200, body: response, headers: {})
    end

    it 'returns the balance' do
      expect(subject).to eq(37_130_301_716_760)
    end
  end

  describe '.generate_payment_transaction' do
    let(:payer_words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }
    let(:payee_words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }
    let(:payer) { Helium.generate_keypair(payer_words) }
    let(:payee) { Helium.generate_keypair(payee_words).address }
    let(:amount) { 100_000_000 } # 1 HNT
    let(:nonce) { 7 }
    let(:destinations) do
      destinations = {}
      destinations[payee] = amount
      destinations
    end

    subject { described_class.generate_payment_transaction(payer, destinations) }

    before do
      allow(Helium).to receive(:speculative_nonce).and_return(nonce)
    end

    it 'generates a payment transaction' do
      expect(subject).to be_a(Helium::Blockchain_txn)
    end
  end
end
