# frozen_string_literal: true

RSpec.describe Helium::Keypair do
  describe '.generate' do
    shared_examples_for 'a valid keypair' do
      it 'generates a keypair' do
        expect(subject).to be_a(Helium::Keypair)
      end

      it 'contains a signing key' do
        expect(subject.signing_key).to be_a(RbNaCl::SigningKey)
      end

      it 'has access to a verify key' do
        expect(subject.signing_key.verify_key).to be_a(RbNaCl::VerifyKey)
      end

      it 'has an address' do
        expect(subject.address).to be_a(Helium::Address)
      end
    end

    context 'with mnemonic' do
      let(:words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }
      let(:address) { '14VZN1zLxw7vmGSUNDRCNWvBK8FteHFvDEqmjmRvRmqHP7v72Vw' }

      subject { described_class.generate(words) }

      it_should_behave_like 'a valid keypair'

      it 'has a predictable address' do
        expect(subject.address.base58).to eq(address)
      end
    end

    context 'without a mnemonic' do
      subject { described_class.generate }

      it_should_behave_like 'a valid keypair'
    end
  end
end
