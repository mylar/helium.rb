# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain_txn_subnetwork_fund_v1.proto

require 'google/protobuf'

require 'blockchain_token_type_v1_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("blockchain_txn_subnetwork_fund_v1.proto", :syntax => :proto3) do
    add_message "helium.blockchain_txn_subnetwork_fund_v1" do
      optional :token_type, :enum, 1, "helium.blockchain_token_type_v1"
      optional :amount, :uint64, 2
      optional :nonce, :uint64, 3
      optional :payer, :bytes, 4
      optional :signature, :bytes, 5
      optional :fee, :uint64, 6
    end
  end
end

module Helium
  Blockchain_txn_subnetwork_fund_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_txn_subnetwork_fund_v1").msgclass
end
