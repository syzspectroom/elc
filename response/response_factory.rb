require 'active_support/inflector'

module Elastic::Response
  RESPONSE_TYPES = [:search, :get, :count, :index, :delete]
  def self.build(raw_response, type)
    type = :basic unless RESPONSE_TYPES.include?(type)
    "Elastic::Response::#{type.capitalize}Response".constantize.new(raw_response)
  end
end
