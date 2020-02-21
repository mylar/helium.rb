# frozen_string_literal: true

RSpec.describe Helium::Address do
  describe '.from_base58' do
    let(:address) { '3RrA1FDa6mdw5JwKbUxEbZbMcJgSyWjhNwxsbX5pSos8' }
    subject { described_class.from_base58(address) }

    it 'generates a wrapped address' do
      expect(subject).to be_a(Helium::Address)
    end
  end

  describe '#base58' do
    let(:address) { '3RrA1FDa6mdw5JwKbUxEbZbMcJgSyWjhNwxsbX5pSos8' }
    subject { described_class.from_base58(address).base58 }

    it 'provides a base58 readable address' do
      expect(subject).to eq(address)
    end
  end

  describe '#bytes' do
    let(:address) { '3RrA1FDa6mdw5JwKbUxEbZbMcJgSyWjhNwxsbX5pSos8' }
    let(:bytes) { [36, 20, 228, 174, 58, 204, 4, 238, 56, 84, 250, 113, 3, 236, 26, 171, 36, 20, 228, 174, 58, 204, 4, 238, 56, 84, 250, 113, 3, 236, 26, 171] }
    subject { described_class.from_base58(address).bytes }

    it 'provides a base58 readable address' do
      expect(subject).to eq(bytes)
    end
  end
end
