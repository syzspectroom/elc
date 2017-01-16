module Elastic::Response
  class GetResponse
    attr_reader :source
    def initialize(raw_response)
      @raw_response = raw_response
      @source = Source.new(id, raw_source)
    end

    def body
      source.body
    end

    def id
      response['_id']
    end

    def found?
      response['found']
    end

    def raw_source
      response['_source']
    end

    def response
      @raw_response
    end

    def count
      1
    end

    def [](key)
      @source[key]
    end

    def to_h
      source.to_h
    end

    def to_s
      source
    end

    alias_method :total, :count
  end
end
