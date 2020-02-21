# frozen_string_literal: true

RSpec.describe Helium do
  it 'has a version number' do
    expect(Helium::VERSION).not_to be nil
  end

  describe '.generate_payment_transaction' do
    let(:payer_words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }
    let(:payee_words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }
    let(:payer) { Helium.generate_keypair(payer_words) }
    let(:payee) { Helium.generate_keypair(payee_words).address }
    let(:amount) { 100_000_000 } # 1 HNT
    let(:response) { File.read(File.join(File.dirname(__FILE__), %w[fixtures account.response.json])) }

    subject { described_class.generate_payment_transaction(payer, payee, amount) }

    before do
      stub_request(:get, 'https://explorer.helium.foundation/api/accounts/14VZN1zLxw7vmGSUNDRCNWvBK8FteHFvDEqmjmRvRmqHP7v72Vw')
        .to_return(status: 200, body: response)
    end

    it 'generates a payment transaction' do
      expect(subject).to be_a(Helium::Blockchain_txn)
    end
  end
end
