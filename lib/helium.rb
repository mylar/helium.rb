# frozen_string_literal: true

module Helium
end

require 'helium/address'
require 'helium/client'
require 'helium/keypair'
require 'helium/mnemonic'
require 'helium/version'

module Helium
  def self.generate_keypair(mnemonic = [])
    Helium::Keypair.generate(mnemonic)
  end
end
