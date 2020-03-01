# frozen_string_literal: true

require 'http'
require 'json'

require_relative './address'

module Helium
  class Client
    class InputError < StandardError; end
    class ServiceError < StandardError; end

    def account(address)
      raise InputError, 'Expected a Helium address object' unless address.is_a?(Helium::Address)

      response = HTTP.headers('Content-Type' => 'application/json', 'Accept' => 'application/json')
                     .get("https://explorer.helium.foundation/api/accounts/#{address.base58}")

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      JSON.parse(response.body.to_s)['data']
    end

    def submit_transaction(transaction)
      raise 'Expected a blockchain transaction' unless transaction.is_a?(Helium::Blockchain_txn)

      encoded_transaction = Base64.strict_encode64(Helium::Blockchain_txn.encode(transaction))

      response = HTTP.headers('Content-Type' => 'application/json', 'Accept' => 'application/json')
                     .post('https://explorer.helium.foundation/api/transactions', json: { txn: encoded_transaction })

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      response = response.body.to_s
      raise ServiceError, "Unexpected response: #{response}" unless response == 'ok'
    end
  end
end
