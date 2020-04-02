# frozen_string_literal: true

module Helium
end

require 'helium/address'
require 'helium/client'
require 'helium/keypair'
require 'helium/mnemonic'
require 'helium/version'

# Needed because the generated protos assume a lot about load path
proto_path = File.join(File.dirname(__FILE__), %w[helium protos])
$LOAD_PATH << proto_path

require 'rubygems'
require 'warning'

# Suppress warnings on generated protobuf code
Warning.ignore(/rb_define_const: invalid name `\w+' for constant/, proto_path)
Warning.ignore(/Enum value '\w+' does not start with an uppercase letter/, proto_path)

require 'helium/protos/blockchain_txn_pb'
require 'helium/protos/blockchain_txn_payment_v1_pb'

module Helium
  def self.generate_keypair(mnemonic = [])
    Helium::Keypair.generate(mnemonic)
  end

  def self.bones_to_hnt(bones)
    bones / 100_000_000.to_f
  end

  def self.account(address)
    Helium::Client.new.account(address)
  end

  def self.balance(address)
    account = account(address)
    account['balance']
  end

  def self.nonce(address)
    account = account(address)
    account['nonce']
  end

  def self.speculative_nonce(address)
    account = account(address)
    account['speculative_nonce']
  end

  def self.generate_payment_transaction(payer_keypair, destinations = {})
    raise 'Expected a payer keypair' unless payer_keypair.is_a?(Helium::Keypair)
    raise 'Expected at least one payee/amount destination pair' if destinations.empty?
    raise 'Expected payee addresses in destinations' unless destinations.all? { |k, _| k.is_a?(Helium::Address) }
    raise 'Expected positive amounts in destinations' unless destinations.all? { |_, v| v > 0 }

    payer_pubkey_bytes = payer_keypair.signing_key.verify_key.to_bytes.unpack('C*')
    payer_pubkey_bytes.unshift(Helium::Keypair::KEYTYPE_ED25519)

    payment_v2 = Helium::Blockchain_txn_payment_v2.new
    payment_v2.payer = payer_pubkey_bytes.pack('C*')
    payment_v2.fee = 0
    payment_v2.nonce = speculative_nonce(payer_keypair.address) + 1

    destinations.each do |payee_address, amount|
      payee_pubkey_bytes = payee_address.bytes

      # NB: Remove check bytes
      payee_pubkey_bytes.slice!(-Helium::Keypair::CHECK_LENGTH, Helium::Keypair::CHECK_LENGTH)

      # NB: Remove address version and key type
      payee_pubkey_bytes.shift
      payee_pubkey_bytes.shift

      # NB: Add key type
      payee_pubkey_bytes.unshift(Helium::Keypair::KEYTYPE_ED25519)


      payment = Helium::Payment.new
      payment.payee = payee_pubkey_bytes.pack('C*')
      payment.amount = amount

      payment_v2.payments << payment
    end

    payment_v2.signature = payer_keypair.sign(Helium::Blockchain_txn_payment_v2.encode(payment_v2))

    txn = Helium::Blockchain_txn.new
    txn.payment_v2 = payment_v2

    txn
  end

  def self.submit_transaction(transaction)
    raise 'Expected a blockchain transaction' unless transaction.is_a?(Helium::Blockchain_txn)

    Helium::Client.new.submit_transaction(transaction)['hash']
  end

  def self.pending_transaction(transaction_hash)
    Helium::Client.new.pending_transaction(transaction_hash)
  end

  def self.transaction(transaction_hash)
    Helium::Client.new.transaction(transaction_hash)
  end
end
