module Elastic::Response
  class SearchResponse
    include Enumerable
    def initialize(raw_response)
      @raw_response = raw_response
      @records = build_records
    end

    def raw_response
      @raw_response
    end

    def hits_hash
      raw_response['hits']
    end

    def total
      hits_hash['total']
    end

    def hits
      hits_hash['hits']
    end

    def aggs
      raw_response['aggregations']
    end

    def each(&block)
      @records.each { |record| block.call(record) }
    end

    def to_json
      @records.map(&:to_h).to_json
    end

    def to_h
      @records.map(&:to_h)
    end

    private
      def build_records
        hits.map{ |hit| Source.new(hit['_id'], hit['_source'])}
      end
  end
end
