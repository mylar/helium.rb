# frozen_string_literal: true

RSpec.describe Helium::Mnemonic do
  let(:words) { %w[catch poet clog intact scare jacket throw palm illegal buyer allow figure] }

  describe '.to_mnemonic' do
    let(:entropy) { Base58.base58_to_binary('3RrA1FDa6mdw5JwKbUxEbZbMcJgSyWjhNwxsbX5pSos8', :bitcoin) }
    subject { described_class.to_mnemonic(entropy) }

    it 'generates a mnemonic' do
      expect(subject).to eq(words)
    end

    context 'unexpected entropy length' do
      let(:entropy) { Base58.base58_to_binary('3') }

      it 'throws an error' do
        expect { subject }.to raise_error(/invalid entropy length/i)
      end
    end
  end

  describe '.to_entropy' do
    subject { described_class.to_entropy(words) }

    it 'generates entropy bytes' do
      expect(subject).to be_a(String)
      expect(subject.length).to eq(32)
      expect(subject.unpack1('H*')).to eq('2414e4ae3acc04ee3854fa7103ec1aab2414e4ae3acc04ee3854fa7103ec1aab')
    end

    context 'unexpected word length' do
      let(:words) { %w[one two three] }

      it 'throws an error' do
        expect { subject }.to raise_error(/invalid number of words/i)
      end
    end

    context 'unknown words' do
      let(:words) { %w[one two three four five six seven eight nine ten eleven twelve] }

      it 'throws an error' do
        expect { subject }.to raise_error(/word not found in words list: four/i)
      end
    end
  end
end
