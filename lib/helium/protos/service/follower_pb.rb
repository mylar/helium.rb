# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: service/follower.proto

require 'google/protobuf'

require 'blockchain_token_type_v1_pb'
require 'blockchain_txn_pb'
require 'gateway_staking_mode_pb'
require 'region_pb'
require 'blockchain_region_param_v1_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("service/follower.proto", :syntax => :proto3) do
    add_message "helium.follower.gateway_not_found" do
      optional :address, :bytes, 1
    end
    add_message "helium.follower.follower_error" do
      oneof :type do
        optional :not_found, :message, 1, "helium.follower.gateway_not_found"
      end
    end
    add_message "helium.follower.follower_txn_stream_req_v1" do
      optional :height, :uint64, 1
      optional :txn_hash, :bytes, 2
      repeated :txn_types, :string, 3
    end
    add_message "helium.follower.follower_txn_stream_resp_v1" do
      optional :height, :uint64, 1
      optional :txn_hash, :bytes, 2
      optional :txn, :message, 3, "helium.blockchain_txn"
      optional :timestamp, :uint64, 4
    end
    add_message "helium.follower.gateway_info" do
      optional :location, :string, 1
      optional :address, :bytes, 2
      optional :owner, :bytes, 3
      optional :staking_mode, :enum, 4, "helium.gateway_staking_mode"
      optional :gain, :int32, 5
      optional :region, :enum, 6, "helium.region"
      optional :region_params, :message, 7, "helium.blockchain_region_params_v1"
    end
    add_message "helium.follower.follower_gateway_req_v1" do
      optional :address, :bytes, 1
    end
    add_message "helium.follower.follower_gateway_resp_v1" do
      optional :height, :uint64, 1
      oneof :result do
        optional :info, :message, 2, "helium.follower.gateway_info"
        optional :error, :message, 3, "helium.follower.follower_error"
      end
    end
    add_message "helium.follower.follower_gateway_stream_req_v1" do
      optional :batch_size, :uint32, 1
    end
    add_message "helium.follower.follower_gateway_stream_resp_v1" do
      repeated :gateways, :message, 1, "helium.follower.follower_gateway_resp_v1"
    end
    add_message "helium.follower.follower_subnetwork_last_reward_height_req_v1" do
      optional :token_type, :enum, 1, "helium.blockchain_token_type_v1"
    end
    add_message "helium.follower.follower_subnetwork_last_reward_height_resp_v1" do
      optional :height, :uint64, 1
      optional :reward_height, :uint64, 2
    end
  end
end

module Helium
  module Follower
    Gateway_not_found = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.gateway_not_found").msgclass
    Follower_error = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_error").msgclass
    Follower_txn_stream_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_txn_stream_req_v1").msgclass
    Follower_txn_stream_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_txn_stream_resp_v1").msgclass
    Gateway_info = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.gateway_info").msgclass
    Follower_gateway_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_gateway_req_v1").msgclass
    Follower_gateway_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_gateway_resp_v1").msgclass
    Follower_gateway_stream_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_gateway_stream_req_v1").msgclass
    Follower_gateway_stream_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_gateway_stream_resp_v1").msgclass
    Follower_subnetwork_last_reward_height_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_subnetwork_last_reward_height_req_v1").msgclass
    Follower_subnetwork_last_reward_height_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.follower.follower_subnetwork_last_reward_height_resp_v1").msgclass
  end
end
