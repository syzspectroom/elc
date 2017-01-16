module Elastic::Response
  class IndexResponse < BasicResponse

    def id
      response['_id']
    end

    def created?
      response['created']
    end

    def updated?
      ! created?
    end

    def to_s
      response
    end

    def to_h
      response
    end

    alias_method :new?, :created?

  end
end
