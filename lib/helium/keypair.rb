# frozen_string_literal: true

require 'rbnacl'
require_relative './mnemonic'

module Helium
  class Keypair
    KEYTYPE_ED25519 = 1 # Tag for ed25519 keys
    ADDRESS_VERSION = 0 # Tag for libp2p address versions
    CHECK_LENGTH = 4 # Length for checksum in Base58Check algorithm

    attr_reader :signing_key

    def initialize(signing_key)
      raise 'Expected a Signing Key' unless signing_key.is_a?(RbNaCl::SigningKey)

      @signing_key = signing_key
    end

    def address
      public_key_bytes = @signing_key.verify_key.to_bytes.unpack('C*')
      public_key_bytes.unshift(KEYTYPE_ED25519)
      public_key_bytes.unshift(ADDRESS_VERSION)

      first_hash = Digest::SHA2.digest(public_key_bytes.pack('C*'))
      second_hash = Digest::SHA2.digest(first_hash)

      public_key_bytes += (second_hash[0, CHECK_LENGTH]).unpack('C*')

      Helium::Address.new(public_key_bytes)
    end

    def self.generate(mnemonic = [])
      return new(RbNaCl::SigningKey.generate) if mnemonic.empty?

      entropy = Helium::Mnemonic.to_entropy(mnemonic)
      new(RbNaCl::SigningKey.new(entropy))
    end
  end
end
