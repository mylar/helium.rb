# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain_state_channel_v1.proto

require 'google/protobuf'

require 'packet_pb'
require 'region_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("blockchain_state_channel_v1.proto", :syntax => :proto3) do
    add_message "helium.blockchain_state_channel_summary_v1" do
      optional :client_pubkeybin, :bytes, 1
      optional :num_packets, :uint64, 2
      optional :num_dcs, :uint64, 3
    end
    add_message "helium.blockchain_state_channel_v1" do
      optional :id, :bytes, 1
      optional :owner, :bytes, 2
      optional :credits, :uint64, 3
      optional :nonce, :uint64, 4
      repeated :summaries, :message, 5, "helium.blockchain_state_channel_summary_v1"
      optional :root_hash, :bytes, 6
      optional :skewed, :bytes, 7
      optional :state, :enum, 8, "helium.blockchain_state_channel_state_v1"
      optional :expire_at_block, :uint64, 9
      optional :signature, :bytes, 10
    end
    add_message "helium.blockchain_state_channel_response_v1" do
      optional :accepted, :bool, 1
      optional :downlink, :message, 4, "helium.packet"
    end
    add_message "helium.blockchain_state_channel_packet_v1" do
      optional :packet, :message, 1, "helium.packet"
      optional :hotspot, :bytes, 2
      optional :signature, :bytes, 3
      optional :region, :enum, 4, "helium.region"
      optional :hold_time, :uint64, 5
    end
    add_message "helium.blockchain_state_channel_offer_v1" do
      optional :routing, :message, 1, "helium.routing_information"
      optional :packet_hash, :bytes, 2
      optional :payload_size, :uint64, 3
      optional :fcnt, :uint32, 4
      optional :hotspot, :bytes, 5
      optional :signature, :bytes, 6
      optional :region, :enum, 7, "helium.region"
      optional :req_diff, :bool, 8
    end
    add_message "helium.blockchain_state_channel_purchase_v1" do
      optional :sc, :message, 1, "helium.blockchain_state_channel_v1"
      optional :hotspot, :bytes, 2
      optional :packet_hash, :bytes, 3
      optional :region, :enum, 4, "helium.region"
      optional :sc_diff, :message, 5, "helium.blockchain_state_channel_diff_v1"
    end
    add_message "helium.blockchain_state_channel_diff_v1" do
      optional :id, :bytes, 1
      optional :add_nonce, :uint64, 2
      optional :signature, :bytes, 3
      repeated :diffs, :message, 4, "helium.blockchain_state_channel_diff_entry_v1"
    end
    add_message "helium.blockchain_state_channel_diff_entry_v1" do
      oneof :entry do
        optional :append, :message, 1, "helium.blockchain_state_channel_diff_append_summary_v1"
        optional :add, :message, 2, "helium.blockchain_state_channel_diff_update_summary_v1"
      end
    end
    add_message "helium.blockchain_state_channel_diff_append_summary_v1" do
      optional :client_pubkeybin, :bytes, 1
      optional :num_packets, :uint64, 2
      optional :num_dcs, :uint64, 3
    end
    add_message "helium.blockchain_state_channel_diff_update_summary_v1" do
      optional :client_index, :uint64, 1
      optional :add_packets, :uint64, 2
      optional :add_dcs, :uint64, 3
    end
    add_message "helium.blockchain_state_channel_banner_v1" do
      optional :sc, :message, 1, "helium.blockchain_state_channel_v1"
    end
    add_message "helium.blockchain_state_channel_rejection_v1" do
      optional :reject, :uint32, 1
      optional :packet_hash, :bytes, 2
    end
    add_message "helium.blockchain_state_channel_message_v1" do
      oneof :msg do
        optional :response, :message, 2, "helium.blockchain_state_channel_response_v1"
        optional :packet, :message, 4, "helium.blockchain_state_channel_packet_v1"
        optional :offer, :message, 5, "helium.blockchain_state_channel_offer_v1"
        optional :purchase, :message, 6, "helium.blockchain_state_channel_purchase_v1"
        optional :banner, :message, 7, "helium.blockchain_state_channel_banner_v1"
        optional :reject, :message, 8, "helium.blockchain_state_channel_rejection_v1"
      end
    end
    add_enum "helium.blockchain_state_channel_state_v1" do
      value :open, 0
      value :closed, 1
    end
  end
end

module Helium
  Blockchain_state_channel_summary_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_summary_v1").msgclass
  Blockchain_state_channel_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_v1").msgclass
  Blockchain_state_channel_response_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_response_v1").msgclass
  Blockchain_state_channel_packet_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_packet_v1").msgclass
  Blockchain_state_channel_offer_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_offer_v1").msgclass
  Blockchain_state_channel_purchase_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_purchase_v1").msgclass
  Blockchain_state_channel_diff_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_diff_v1").msgclass
  Blockchain_state_channel_diff_entry_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_diff_entry_v1").msgclass
  Blockchain_state_channel_diff_append_summary_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_diff_append_summary_v1").msgclass
  Blockchain_state_channel_diff_update_summary_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_diff_update_summary_v1").msgclass
  Blockchain_state_channel_banner_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_banner_v1").msgclass
  Blockchain_state_channel_rejection_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_rejection_v1").msgclass
  Blockchain_state_channel_message_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_message_v1").msgclass
  Blockchain_state_channel_state_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.blockchain_state_channel_state_v1").enummodule
end
