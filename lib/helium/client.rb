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
                     .get("https://api.helium.io/v1/accounts/#{address.base58}")

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      JSON.parse(response.body.to_s)['data']
    end

    def submit_transaction(transaction)
      raise 'Expected a blockchain transaction' unless transaction.is_a?(Helium::Blockchain_txn)

      encoded_transaction = Base64.strict_encode64(Helium::Blockchain_txn.encode(transaction))

      response = HTTP.headers('Content-Type' => 'application/json', 'Accept' => 'application/json')
                     .post('https://api.helium.io/v1/pending_transactions', json: { txn: encoded_transaction })

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      JSON.parse(response.body.to_s)['data']
    end

    def pending_transaction(transaction_hash)
      response = HTTP.headers('Content-Type' => 'application/json', 'Accept' => 'application/json')
                     .get("https://api.helium.io/v1/pending_transactions/#{transaction_hash}")

      # when a transaction is no longer pending, it's returned as not found search on that endpoint instead.
      return transaction(transaction_hash) if response.status.not_found?

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      JSON.parse(response.body.to_s)['data']
    end

    def transaction(transaction_hash)
      response = HTTP.headers('Content-Type' => 'application/json', 'Accept' => 'application/json')
                     .get("https://api.helium.io/v1/transactions/#{transaction_hash}")

      raise ServiceError, "Unexpected response: #{response.status}: #{response.body}" unless response.status.ok?

      JSON.parse(response.body.to_s)['data']
    end
  end
end
