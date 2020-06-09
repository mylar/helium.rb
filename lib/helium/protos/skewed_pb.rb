# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: skewed.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("skewed.proto", :syntax => :proto3) do
    add_message "helium.leaf" do
      optional :hash, :bytes, 1
      optional :value, :bytes, 2
    end
    add_message "helium.empty" do
      optional :hash, :bytes, 1
    end
    add_message "helium.node" do
      optional :hash, :bytes, 1
      optional :height, :uint64, 2
      optional :right, :message, 3, "helium.leaf"
      oneof :left do
        optional :node, :message, 4, "helium.node"
        optional :empty, :message, 5, "helium.empty"
      end
    end
    add_message "helium.skewed" do
      optional :count, :uint32, 3
      oneof :root do
        optional :node, :message, 1, "helium.node"
        optional :empty, :message, 2, "helium.empty"
      end
    end
  end
end

module Helium
  Leaf = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.leaf").msgclass
  Empty = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.empty").msgclass
  Node = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.node").msgclass
  Skewed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helium.skewed").msgclass
end
