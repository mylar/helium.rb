# frozen_string_literal: true

require 'rbnacl'

module Helium
  module Mnemonic
    WORD_LIST = File.readlines(File.join(File.dirname(__FILE__), %w[.. .. config wordlist.txt]))
                    .map(&:strip)

    WORD_LIST_INDEX = WORD_LIST.map
                               .with_index { |word, idx| [word, idx] }
                               .to_h
                               .freeze

    def self.generate_mnemonic
      to_mnemonic(RbNaCl::Random.random_bytes(RbNaCl::Signatures::Ed25519::SEEDBYTES))
    end

    def self.to_entropy(words = [])
      raise 'Invalid number of words' if words.length != 12

      mnemonic_binary = words.map do |word|
        index = WORD_LIST_INDEX[word]
        raise IndexError, "Word not found in words list: #{word}" if index.nil?

        index.to_s(2).rjust(11, '0')
      end.join.to_s

      entropy_binary = mnemonic_binary.slice(0, mnemonic_binary.length * 32 / 33)
      checksum_bits = mnemonic_binary.slice(-(entropy_binary.length / 32), (entropy_binary.length / 32))

      raise 'Invalid checksum' if checksum_bits != '0000'

      binary_bytes = entropy_binary.scan(/(\d{1,8})/).map(&:first)
      entropy_base = binary_bytes.map { |s| s.to_i(2) }.pack('C*')
      entropy_base + entropy_base
    end

    def self.to_mnemonic(entropy = '')
      raise 'Invalid entropy length' if entropy.length != 32

      entropy_binary = entropy[0, 16].unpack('C*').map { |s| s.to_s(2).rjust(8, '0') }
      entropy_binary << ['0000']

      entropy_binary.join
                    .scan(/(\d{1,11})/)
                    .map(&:first)
                    .map { |s| s.to_i(2) }
                    .map { |i| WORD_LIST[i] }
    end
  end
end
