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

  def self.generate_payment_transaction(payer_keypair, payee_address, amount)
    raise 'Expected a payer keypair' unless payer_keypair.is_a?(Helium::Keypair)
    raise 'Expected a payee address' unless payee_address.is_a?(Helium::Address)

    payer_address = payer_keypair.address
    payer_account = Helium::Client.new.account(payer_address)

    payment = Helium::Blockchain_txn_payment_v1.new
    payment.payer = payer_address.base58
    payment.payee = payee_address.base58
    payment.amount = amount
    payment.fee = 0
    payment.nonce = payer_account['nonce'] + 1
    payment.signature = payer_keypair.sign(Helium::Blockchain_txn_payment_v1.encode(payment))

    txn = Helium::Blockchain_txn.new
    txn.payment = payment

    txn
  end
end
