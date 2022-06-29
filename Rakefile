# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'down/http'
require 'rspec/core/rake_task'

namespace :wordlist do
  WORDLIST_URL = 'https://raw.githubusercontent.com/helium/helium-wallet-rs/master/src/mnemonic/wordlists/english.txt'
  WORDLIST_FILENAME = File.join(File.dirname(__FILE__), %w[config wordlist.txt])

  desc 'Cleans file'
  task :clean do
    FileUtils.rm_f(WORDLIST_FILENAME)
    FileUtils.mkdir_p(File.join(File.dirname(__FILE__), 'config'))
  end

  desc 'Updates wordlist from upstream'
  task update: :clean do
    tempfile = Down::Http.download(WORDLIST_URL)
    FileUtils.copy_file(tempfile, WORDLIST_FILENAME)
  end
end

namespace :protos do
  PROTO_REPO_URL = 'https://github.com/helium/proto.git'
  PROTO_DIR = 'protos/src'
  PROTO_FILES = Dir.glob("#{PROTO_DIR}/blockchain_txn_*.proto") + %W[
    #{PROTO_DIR}/blockchain_poc_core_v1.proto
    #{PROTO_DIR}/blockchain_token_type_v1.proto
    #{PROTO_DIR}/blockchain_txn.proto
    #{PROTO_DIR}/blockchain_state_channel_v1.proto
    #{PROTO_DIR}/packet.proto
    #{PROTO_DIR}/region.proto
  ]
  PROTOS_RB_DIR = 'lib/helium/protos'

  desc 'Add proto git subtree'
  task :add do
    sh "git subtree add --prefix protos #{PROTO_REPO_URL} master --squash"
  end

  desc 'Update proto git subtree'
  task :update do
    sh "git subtree pull --prefix protos #{PROTO_REPO_URL} master --squash"
  end

  desc 'Compile protos'
  task :compile do
    Dir.glob("#{PROTOS_RB_DIR}/*_pb.rb").each { |f| FileUtils.rm(f) }
    sh "protoc --ruby_out=#{PROTOS_RB_DIR} --proto_path=#{PROTO_DIR} #{PROTO_FILES.join(' ')}"
  end
end

RSpec::Core::RakeTask.new(:spec)

task default: :spec
