# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain_txn_poc_receipts_v2.proto

require 'google/protobuf'

require 'blockchain_poc_core_v1_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("blockchain_txn_poc_receipts_v2.proto", :syntax => :proto3) do
    add_message "helium.blockchain_txn_poc_receipts_v2" do
      optional :challenger, :bytes, 1
      optional :secret, :bytes, 2
      optional :onion_key_hash, :bytes, 3
      repeated :path, :message, 4, "helium.blockchain_poc_path_element_v1"
      optional :fee, :uint64, 5
      optional :signature, :bytes, 6
      optional :block_hash, :bytes, 7
      optional :timestamp, :uint64, 8
    end
  end
end

module Helium
  Blockchain_txn_poc_receipts_v2 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_txn_poc_receipts_v2").msgclass
end
