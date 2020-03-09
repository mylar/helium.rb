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
    let(:nonce) { 1 }
    let(:transaction) { Helium.generate_payment_transaction(payer_keypair, payee_address, amount, nonce) }

    subject { instance.submit_transaction(transaction) }

    before do
      stub_request(:post, 'https://explorer.helium.foundation/api/transactions')
        .to_return(status: 200, body: 'ok')
    end

    it 'calls the Helium API to submit the transaction' do
      expect(subject).to be_nil
    end
  end

  describe '#transactions' do
    let(:address) { Helium::Address.from_base58('149diwz9iE4LyL6kgaPW5iMosbk9PwiBXiDzAa4SXsNU6PPZZ2r') }
    let(:response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures transactions.cleared.response.json])) }

    subject { instance.transactions(address) }

    before do
      stub_request(:get, 'https://explorer.helium.foundation/api/accounts/149diwz9iE4LyL6kgaPW5iMosbk9PwiBXiDzAa4SXsNU6PPZZ2r/transactions?limit=100')
        .to_return(status: 200, body: response)
    end

    it 'calls the Helium API and returns transactions' do
      expect(subject).not_to be_empty
    end

    context 'with pending transactions' do
      let(:response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures transactions.pending.response.json])) }

      it 'contains pending transactions' do
        expect(subject.filter { |txn| txn.include?('status') && txn['status'] == 'pending' }).not_to be_empty
      end
    end
  end
end
