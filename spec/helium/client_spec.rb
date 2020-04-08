# frozen_string_literal: true

RSpec.describe Helium::Client do
  let(:instance) { described_class.new }

  describe '#account' do
    let(:address) { Helium::Address.from_base58('13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH') }
    let(:response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures account.response.json])) }

    subject { instance.account(address) }

    before do
      stub_request(:get, 'https://api.helium.io/v1/accounts/13buBykFQf5VaQtv7mWj2PBY9Lq4i1DeXhg7C4Vbu3ppzqqNkTH')
        .to_return(status: 200, body: response)
    end

    it 'calls the Helium API to fetch account details for an address' do
      expect(subject).to have_key('address')
      expect(subject).to have_key('balance')
      expect(subject).to have_key('nonce')
    end

    it 'has a nonce' do
      expect(subject['nonce']).to eq(15)
    end
  end

  describe '#submit_transaction' do
    let(:payer_keypair) { Helium::Keypair.generate }
    let(:payee_address) { Helium::Keypair.generate.address }
    let(:destinations) do
      destinations = {}
      destinations[payee_address] = 2
      destinations
    end
    let(:transaction) { Helium.generate_payment_transaction(payer_keypair, destinations ) }
    let(:response) { '{"data":{"hash":"ULafJOuW9JsZxspeFFlUwMcW2_nHKjx8B7jDcvuY56Q"}}' }

    subject { instance.submit_transaction(transaction) }

    before do
      allow(Helium).to receive(:speculative_nonce).with(instance_of(Helium::Address)).and_return(1)
      stub_request(:post, 'https://api.helium.io/v1/pending_transactions')
        .to_return(status: 200, body: response)
    end

    it 'calls the Helium API to submit the transaction' do
      expect(subject).to have_key('hash')
    end
  end

  describe '#pending_transaction' do
    let(:transaction_hash) { 'ULafJOuW9JsZxspeFFlUwMcW2_nHKjx8B7jDcvuY56Q' }

    subject { instance.pending_transaction(transaction_hash) }

    before do
      stub_request(:get, "https://api.helium.io/v1/pending_transactions/#{transaction_hash}")
        .to_return(status: pending_status, body: pending_response)
    end

    shared_examples_for 'it is a submitted transaction' do |status|
      it 'returns submitted transaction details' do
        expect(subject).not_to be_empty
      end

      it "is #{status}" do
        expect(subject['status']).to eq(status)
      end
    end

    context 'status = received' do
      let(:pending_status) { 200 }
      let(:pending_response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures pending_transactions.received.response.json])) }

      it_behaves_like 'it is a submitted transaction', 'received'
    end

    context 'status = pending' do
      let(:pending_status) { 200 }
      let(:pending_response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures pending_transactions.pending.response.json])) }

      it_behaves_like 'it is a submitted transaction', 'pending'
    end

    context 'status = cleared' do
      let(:pending_status) { 404 }
      let(:pending_response) { 'Not Found' }
      let(:cleared_response) { File.read(File.join(File.dirname(__FILE__), %w[.. fixtures transactions.cleared.response.json])) }

      before do
        stub_request(:get, "https://api.helium.io/v1/transactions/#{transaction_hash}")
          .to_return(status: 200, body: cleared_response)
      end

      it 'returns cleared transaction details' do
        expect(subject).not_to be_empty
      end

      it 'contains a block height' do
        expect(subject['height']).not_to be_nil
      end
    end
  end
end
