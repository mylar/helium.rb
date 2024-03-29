# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain_txn_subnetwork_rewards_v1.proto

require 'google/protobuf'

require 'blockchain_token_type_v1_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("blockchain_txn_subnetwork_rewards_v1.proto", :syntax => :proto3) do
    add_message "helium.subnetwork_reward" do
      optional :account, :bytes, 1
      optional :amount, :uint64, 2
    end
    add_message "helium.subnetwork_rewards" do
      optional :start_epoch, :uint64, 1
      optional :end_epoch, :uint64, 2
      repeated :rewards, :message, 3, "helium.subnetwork_reward"
    end
    add_message "helium.blockchain_txn_subnetwork_rewards_v1" do
      optional :token_type, :enum, 1, "helium.blockchain_token_type_v1"
      optional :start_epoch, :uint64, 2
      optional :end_epoch, :uint64, 3
      optional :reward_server_signature, :bytes, 4
      repeated :rewards, :message, 5, "helium.subnetwork_reward"
    end
  end
end

module Helium
  Subnetwork_reward = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.subnetwork_reward").msgclass
  Subnetwork_rewards = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.subnetwork_rewards").msgclass
  Blockchain_txn_subnetwork_rewards_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_txn_subnetwork_rewards_v1").msgclass
end
