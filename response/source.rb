require 'active_support/core_ext/hash/indifferent_access'
module Elastic::Response
  class Source
    attr_reader :id
    def initialize(id, response)
      @response = response.with_indifferent_access
      @source = response.with_indifferent_access
      @id = id
    end

    def body
      @response
    end

    def [](key)
      @response[key]
    end

    def method_missing(m, *args, &block)
      if body.key?(m.to_s)
        body[m.to_s]
      else
        raise "unknown key #{m.to_s}"
      end
    end

    def to_s
      body
    end

    def to_h
      body.merge({id: @id})
    end
  end
end
