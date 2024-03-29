# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: service/gateway.proto

require 'google/protobuf'

require 'blockchain_routing_address_pb'
require 'blockchain_txn_state_channel_close_v1_pb'
require 'blockchain_txn_vars_v1_pb'
require 'blockchain_poc_core_v1_pb'
require 'blockchain_region_param_v1_pb'
require 'region_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("service/gateway.proto", :syntax => :proto3) do
    add_message "helium.gateway_success_resp" do
    end
    add_message "helium.gateway_error_resp" do
      optional :error, :bytes, 1
      optional :details, :bytes, 2
    end
    add_message "helium.gateway_config_req_v1" do
      repeated :keys, :string, 1
    end
    add_message "helium.gateway_config_resp_v1" do
      repeated :result, :message, 1, "helium.blockchain_var_v1"
    end
    add_message "helium.gateway_config_update_req_v1" do
    end
    add_message "helium.gateway_config_update_streamed_resp_v1" do
      repeated :keys, :string, 1
    end
    add_message "helium.gateway_validators_req_v1" do
      optional :quantity, :uint32, 1
    end
    add_message "helium.gateway_validators_resp_v1" do
      repeated :result, :message, 1, "helium.routing_address"
    end
    add_message "helium.gateway_region_params_streamed_resp_v1" do
      optional :address, :bytes, 1
      optional :region, :enum, 2, "helium.region"
      optional :params, :message, 3, "helium.blockchain_region_params_v1"
      optional :gain, :uint64, 4
    end
    add_message "helium.gateway_region_params_update_req_v1" do
      optional :address, :bytes, 1
      optional :signature, :bytes, 2
    end
    add_message "helium.gateway_region_params_req_v1" do
      optional :region, :enum, 1, "helium.region"
      optional :address, :bytes, 2
      optional :signature, :bytes, 3
    end
    add_message "helium.gateway_region_params_resp_v1" do
      optional :region, :enum, 1, "helium.region"
      optional :params, :message, 2, "helium.blockchain_region_params_v1"
      optional :gain, :uint64, 3
    end
    add_message "helium.gateway_resp_v1" do
      optional :height, :uint64, 1
      optional :signature, :bytes, 2
      optional :block_time, :uint64, 10
      optional :block_age, :uint64, 11
      oneof :msg do
        optional :is_active_resp, :message, 3, "helium.gateway_sc_is_active_resp_v1"
        optional :is_overpaid_resp, :message, 4, "helium.gateway_sc_is_overpaid_resp_v1"
        optional :close_resp, :message, 5, "helium.gateway_sc_close_resp_v1"
        optional :follow_streamed_resp, :message, 6, "helium.gateway_sc_follow_streamed_resp_v1"
        optional :routing_streamed_resp, :message, 7, "helium.gateway_routing_streamed_resp_v1"
        optional :config_resp, :message, 8, "helium.gateway_config_resp_v1"
        optional :config_update_streamed_resp, :message, 9, "helium.gateway_config_update_streamed_resp_v1"
        optional :validators_resp, :message, 12, "helium.gateway_validators_resp_v1"
        optional :region_params_streamed_resp, :message, 13, "helium.gateway_region_params_streamed_resp_v1"
        optional :success_resp, :message, 14, "helium.gateway_success_resp"
        optional :error_resp, :message, 15, "helium.gateway_error_resp"
        optional :poc_challenge_resp, :message, 16, "helium.gateway_poc_challenge_notification_resp_v1"
        optional :poc_check_target_resp, :message, 17, "helium.gateway_poc_check_challenge_target_resp_v1"
        optional :public_route, :message, 18, "helium.gateway_public_routing_data_resp_v1"
        optional :version, :message, 19, "helium.gateway_version_resp_v1"
        optional :region_params_resp, :message, 20, "helium.gateway_region_params_resp_v1"
      end
    end
    add_message "helium.gateway_version_req_v1" do
    end
    add_message "helium.gateway_version_resp_v1" do
      optional :version, :uint64, 1
    end
    add_message "helium.gateway_sc_is_active_req_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
    end
    add_message "helium.gateway_sc_is_active_resp_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
      optional :active, :bool, 3
      optional :sc_expiry_at_block, :uint64, 4
      optional :sc_original_dc_amount, :uint64, 5
    end
    add_message "helium.gateway_sc_is_overpaid_req_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
      optional :total_dcs, :uint64, 3
    end
    add_message "helium.gateway_sc_is_overpaid_resp_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
      optional :overpaid, :bool, 3
    end
    add_message "helium.gateway_sc_close_req_v1" do
      optional :close_txn, :message, 1, "helium.blockchain_txn_state_channel_close_v1"
    end
    add_message "helium.gateway_sc_close_resp_v1" do
      optional :sc_id, :bytes, 1
      optional :response, :bytes, 2
    end
    add_message "helium.gateway_sc_follow_req_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
    end
    add_message "helium.gateway_sc_follow_streamed_resp_v1" do
      optional :sc_id, :bytes, 1
      optional :sc_owner, :bytes, 2
      optional :close_state, :enum, 3, "helium.close_state"
    end
    add_message "helium.routing" do
      optional :oui, :uint32, 1
      optional :owner, :bytes, 2
      repeated :addresses, :message, 3, "helium.routing_address"
      repeated :filters, :bytes, 4
      repeated :subnets, :bytes, 5
    end
    add_message "helium.gateway_routing_req_v1" do
      optional :height, :uint64, 1
    end
    add_message "helium.gateway_routing_streamed_resp_v1" do
      repeated :routings, :message, 1, "helium.routing"
    end
    add_message "helium.gateway_poc_req_v1" do
      optional :address, :bytes, 1
      optional :signature, :bytes, 2
    end
    add_message "helium.gateway_poc_challenge_notification_resp_v1" do
      optional :challenger, :message, 1, "helium.routing_address"
      optional :block_hash, :bytes, 2
      optional :onion_key_hash, :bytes, 3
    end
    add_message "helium.gateway_poc_check_challenge_target_req_v1" do
      optional :address, :bytes, 1
      optional :challenger, :bytes, 2
      optional :block_hash, :bytes, 3
      optional :onion_key_hash, :bytes, 4
      optional :height, :uint64, 5
      optional :notifier, :bytes, 6
      optional :notifier_sig, :bytes, 7
      optional :challengee_sig, :bytes, 8
    end
    add_message "helium.gateway_poc_check_challenge_target_resp_v1" do
      optional :target, :bool, 1
      optional :onion, :bytes, 2
    end
    add_message "helium.gateway_poc_report_req_v1" do
      optional :onion_key_hash, :bytes, 1
      oneof :msg do
        optional :receipt, :message, 2, "helium.blockchain_poc_receipt_v1"
        optional :witness, :message, 3, "helium.blockchain_poc_witness_v1"
      end
    end
    add_message "helium.gateway_address_routing_data_req_v1" do
      optional :address, :bytes, 1
    end
    add_message "helium.gateway_poc_key_routing_data_req_v1" do
      optional :key, :bytes, 1
    end
    add_message "helium.gateway_public_routing_data_resp_v1" do
      optional :address, :bytes, 1
      optional :public_uri, :message, 2, "helium.routing_address"
    end
    add_enum "helium.close_state" do
      value :close_state_closable, 0
      value :close_state_closing, 1
      value :close_state_closed, 2
      value :close_state_dispute, 3
    end
  end
end

module Helium
  Gateway_success_resp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_success_resp").msgclass
  Gateway_error_resp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_error_resp").msgclass
  Gateway_config_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_config_req_v1").msgclass
  Gateway_config_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_config_resp_v1").msgclass
  Gateway_config_update_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_config_update_req_v1").msgclass
  Gateway_config_update_streamed_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_config_update_streamed_resp_v1").msgclass
  Gateway_validators_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_validators_req_v1").msgclass
  Gateway_validators_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_validators_resp_v1").msgclass
  Gateway_region_params_streamed_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_region_params_streamed_resp_v1").msgclass
  Gateway_region_params_update_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_region_params_update_req_v1").msgclass
  Gateway_region_params_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_region_params_req_v1").msgclass
  Gateway_region_params_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_region_params_resp_v1").msgclass
  Gateway_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_resp_v1").msgclass
  Gateway_version_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_version_req_v1").msgclass
  Gateway_version_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_version_resp_v1").msgclass
  Gateway_sc_is_active_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_is_active_req_v1").msgclass
  Gateway_sc_is_active_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_is_active_resp_v1").msgclass
  Gateway_sc_is_overpaid_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_is_overpaid_req_v1").msgclass
  Gateway_sc_is_overpaid_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_is_overpaid_resp_v1").msgclass
  Gateway_sc_close_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_close_req_v1").msgclass
  Gateway_sc_close_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_close_resp_v1").msgclass
  Gateway_sc_follow_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_follow_req_v1").msgclass
  Gateway_sc_follow_streamed_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_sc_follow_streamed_resp_v1").msgclass
  Routing = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.routing").msgclass
  Gateway_routing_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_routing_req_v1").msgclass
  Gateway_routing_streamed_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_routing_streamed_resp_v1").msgclass
  Gateway_poc_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_req_v1").msgclass
  Gateway_poc_challenge_notification_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_challenge_notification_resp_v1").msgclass
  Gateway_poc_check_challenge_target_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_check_challenge_target_req_v1").msgclass
  Gateway_poc_check_challenge_target_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_check_challenge_target_resp_v1").msgclass
  Gateway_poc_report_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_report_req_v1").msgclass
  Gateway_address_routing_data_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_address_routing_data_req_v1").msgclass
  Gateway_poc_key_routing_data_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_poc_key_routing_data_req_v1").msgclass
  Gateway_public_routing_data_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.gateway_public_routing_data_resp_v1").msgclass
  Close_state = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.close_state").enummodule
end
