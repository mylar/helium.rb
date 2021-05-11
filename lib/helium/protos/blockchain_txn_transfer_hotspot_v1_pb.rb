# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain_txn_transfer_hotspot_v1.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("blockchain_txn_transfer_hotspot_v1.proto", :syntax => :proto3) do
    add_message "helium.blockchain_txn_transfer_hotspot_v1" do
      optional :gateway, :bytes, 1
      optional :seller, :bytes, 2
      optional :buyer, :bytes, 3
      optional :seller_signature, :bytes, 4
      optional :buyer_signature, :bytes, 5
      optional :buyer_nonce, :uint64, 6
      optional :amount_to_seller, :uint64, 7
      optional :fee, :uint64, 8
    end
  end
end

module Helium
  Blockchain_txn_transfer_hotspot_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_txn_transfer_hotspot_v1").msgclass
end