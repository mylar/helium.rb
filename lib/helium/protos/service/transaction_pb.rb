# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: service/transaction.proto

require 'google/protobuf'

require 'blockchain_routing_address_pb'
require 'blockchain_txn_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("service/transaction.proto", :syntax => :proto3) do
    add_message "helium.transaction.acceptor" do
      optional :height, :uint64, 1
      optional :queue_pos, :uint32, 2
      optional :queue_len, :uint32, 3
      optional :pub_key, :bytes, 4
    end
    add_message "helium.transaction.rejector" do
      optional :height, :uint64, 1
      optional :reason, :bytes, 2
      optional :pub_key, :bytes, 3
    end
    add_message "helium.transaction.txn_submit_req_v1" do
      optional :txn, :message, 1, "helium.blockchain_txn"
      optional :key, :bytes, 2
    end
    add_message "helium.transaction.txn_submit_resp_v1" do
      optional :key, :bytes, 1
      optional :recv_height, :uint64, 2
      optional :validator, :message, 3, "helium.routing_address"
      optional :signature, :bytes, 4
    end
    add_message "helium.transaction.txn_query_req_v1" do
      optional :key, :bytes, 1
    end
    add_message "helium.transaction.txn_query_resp_v1" do
      optional :status, :enum, 1, "helium.transaction.txn_status"
      optional :key, :bytes, 2
      repeated :acceptors, :message, 3, "helium.transaction.acceptor"
      repeated :rejectors, :message, 4, "helium.transaction.rejector"
      optional :recv_height, :uint64, 5
      optional :height, :uint64, 6
      optional :signature, :bytes, 7
    end
    add_enum "helium.transaction.txn_status" do
      value :pending, 0
      value :not_found, 1
    end
  end
end

module Helium
  module Transaction
    Acceptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.acceptor").msgclass
    Rejector = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.rejector").msgclass
    Txn_submit_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.txn_submit_req_v1").msgclass
    Txn_submit_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.txn_submit_resp_v1").msgclass
    Txn_query_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.txn_query_req_v1").msgclass
    Txn_query_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.txn_query_resp_v1").msgclass
    Txn_status = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.transaction.txn_status").enummodule
  end
end
