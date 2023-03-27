# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: service/poc_mobile.proto

require 'google/protobuf'

require 'mapper_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("service/poc_mobile.proto", :syntax => :proto3) do
    add_message "helium.poc_mobile.speedtest_req_v1" do
      optional :pub_key, :bytes, 1
      optional :serial, :string, 2
      optional :timestamp, :uint64, 3
      optional :upload_speed, :uint64, 4
      optional :download_speed, :uint64, 5
      optional :latency, :uint32, 6
      optional :signature, :bytes, 7
    end
    add_message "helium.poc_mobile.speedtest_resp_v1" do
      optional :id, :string, 1
    end
    add_message "helium.poc_mobile.speedtest_ingest_report_v1" do
      optional :received_timestamp, :uint64, 1
      optional :report, :message, 2, "helium.poc_mobile.speedtest_req_v1"
    end
    add_message "helium.poc_mobile.cell_heartbeat_req_v1" do
      optional :pub_key, :bytes, 1
      optional :hotspot_type, :string, 2
      optional :cell_id, :uint32, 3
      optional :timestamp, :uint64, 4
      optional :lat, :double, 5
      optional :lon, :double, 6
      optional :operation_mode, :bool, 7
      optional :cbsd_category, :string, 8
      optional :cbsd_id, :string, 9
      optional :signature, :bytes, 10
    end
    add_message "helium.poc_mobile.cell_heartbeat_resp_v1" do
      optional :id, :string, 1
    end
    add_message "helium.poc_mobile.cell_heartbeat_ingest_report_v1" do
      optional :received_timestamp, :uint64, 1
      optional :report, :message, 2, "helium.poc_mobile.cell_heartbeat_req_v1"
    end
    add_message "helium.poc_mobile.mapper_attach_ingest_report_v1" do
      optional :received_timestamp, :uint64, 1
      optional :report, :message, 2, "helium.mapper_attach"
    end
    add_message "helium.poc_mobile.file_info" do
      optional :key, :string, 1
      optional :file_type, :enum, 2, "helium.poc_mobile.file_type"
      optional :timestamp, :uint64, 3
      optional :size, :uint64, 4
    end
    add_message "helium.poc_mobile.processed_files" do
      repeated :files, :message, 1, "helium.poc_mobile.file_info"
    end
    add_message "helium.poc_mobile.heartbeat" do
      optional :cbsd_id, :string, 1
      optional :pub_key, :bytes, 2
      optional :reward_multiplier, :float, 3
      optional :timestamp, :uint64, 4
      optional :cell_type, :enum, 5, "helium.poc_mobile.cell_type"
      optional :validity, :enum, 6, "helium.poc_mobile.heartbeat_validity"
    end
    add_message "helium.poc_mobile.speedtest_avg" do
      optional :pub_key, :bytes, 1
      optional :upload_speed_avg_bps, :uint64, 2
      optional :download_speed_avg_bps, :uint64, 3
      optional :latency_avg_ms, :uint32, 4
      optional :validity, :enum, 5, "helium.poc_mobile.speedtest_avg_validity"
      repeated :speedtests, :message, 6, "helium.poc_mobile.speedtest"
      optional :timestamp, :uint64, 7
      optional :reward_multiplier, :float, 8
    end
    add_message "helium.poc_mobile.speedtest" do
      optional :upload_speed_bps, :uint64, 1
      optional :download_speed_bps, :uint64, 2
      optional :latency_ms, :uint32, 3
      optional :timestamp, :uint64, 4
    end
    add_message "helium.poc_mobile.radio_reward_share" do
      optional :owner_key, :bytes, 1
      optional :hotspot_key, :bytes, 2
      optional :cbsd_id, :string, 3
      optional :amount, :uint64, 4
      optional :start_epoch, :uint64, 5
      optional :end_epoch, :uint64, 6
    end
    add_message "helium.poc_mobile.data_transfer_session_req_v1" do
      optional :data_transfer_usage, :message, 1, "helium.poc_mobile.data_transfer_event"
      optional :reward_cancelled, :bool, 2
      optional :pub_key, :bytes, 3
      optional :signature, :bytes, 4
    end
    add_message "helium.poc_mobile.data_transfer_event" do
      optional :pub_key, :bytes, 1
      optional :upload_bytes, :uint64, 2
      optional :download_bytes, :uint64, 3
      optional :radio_access_technology, :enum, 4, "helium.poc_mobile.data_transfer_radio_access_technology"
      optional :event_id, :string, 5
      optional :payer, :bytes, 6
      optional :timestamp, :uint64, 7
      optional :signature, :bytes, 8
    end
    add_message "helium.poc_mobile.data_transfer_session_resp_v1" do
      optional :id, :string, 1
    end
    add_message "helium.poc_mobile.data_transfer_session_ingest_report_v1" do
      optional :received_timestamp, :uint64, 1
      optional :report, :message, 2, "helium.poc_mobile.data_transfer_session_req_v1"
    end
    add_enum "helium.poc_mobile.heartbeat_validity" do
      value :heartbeat_validity_valid, 0
      value :heartbeat_validity_gateway_owner_not_found, 1
      value :heartbeat_validity_heartbeat_outside_range, 2
      value :heartbeat_validity_bad_cbsd_id, 3
      value :heartbeat_validity_not_operational, 4
    end
    add_enum "helium.poc_mobile.speedtest_avg_validity" do
      value :speedtest_avg_validity_valid, 0
      value :speedtest_avg_validity_too_few_samples, 1
      value :speedtest_avg_validity_slow_download_speed, 2
      value :speedtest_avg_validity_slow_upload_speed, 3
      value :speedtest_avg_validity_high_latency, 4
    end
    add_enum "helium.poc_mobile.file_type" do
      value :file_type_heartbeat, 0
      value :file_type_speedtest, 1
    end
    add_enum "helium.poc_mobile.cell_type" do
      value :nova436h, 0
      value :nova430i, 1
      value :neutrino430, 2
      value :sercomm_indoor, 3
      value :sercomm_outdoor, 4
    end
    add_enum "helium.poc_mobile.data_transfer_radio_access_technology" do
      value :UTRAN, 0
      value :GERAN, 1
      value :WLAN, 2
      value :GAN, 3
      value :HSPA_Evolution, 4
      value :EUTRAN, 5
    end
  end
end

module Helium
  module PocMobile
    Speedtest_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest_req_v1").msgclass
    Speedtest_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest_resp_v1").msgclass
    Speedtest_ingest_report_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest_ingest_report_v1").msgclass
    Cell_heartbeat_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.cell_heartbeat_req_v1").msgclass
    Cell_heartbeat_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.cell_heartbeat_resp_v1").msgclass
    Cell_heartbeat_ingest_report_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.cell_heartbeat_ingest_report_v1").msgclass
    Mapper_attach_ingest_report_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.mapper_attach_ingest_report_v1").msgclass
    File_info = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.file_info").msgclass
    Processed_files = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.processed_files").msgclass
    Heartbeat = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.heartbeat").msgclass
    Speedtest_avg = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest_avg").msgclass
    Speedtest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest").msgclass
    Radio_reward_share = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.radio_reward_share").msgclass
    Data_transfer_session_req_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.data_transfer_session_req_v1").msgclass
    Data_transfer_event = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.data_transfer_event").msgclass
    Data_transfer_session_resp_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.data_transfer_session_resp_v1").msgclass
    Data_transfer_session_ingest_report_v1 = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.data_transfer_session_ingest_report_v1").msgclass
    Heartbeat_validity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.heartbeat_validity").enummodule
    Speedtest_avg_validity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.speedtest_avg_validity").enummodule
    File_type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.file_type").enummodule
    Cell_type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.cell_type").enummodule
    Data_transfer_radio_access_technology = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.poc_mobile.data_transfer_radio_access_technology").enummodule
  end
end
