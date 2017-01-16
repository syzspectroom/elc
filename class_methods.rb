require 'active_support/core_ext/module/delegation'

module Elastic
  module ClassMethods

    delegate :mapping, :get_mapping, to: :mapper
    delegate :match_all,
             :get_by_id,
             :count,
             :search,
             :exists?,
             :update,
             :delete_by_query,
             :delete, to: :searcher

    def configure(params)
      mapper.configure(params)
      indexer.configure(params)
      searcher.configure(params)
    end

    def id(&block)
      @id_generator = block
    end

    def index(body, id = nil)

      indexer.index(id:   id || @id_generator.call(body),
                    body: body)
    end

    def mapper
      @mapper ||= Mapper.new type: self.name
    end

    def indexer
      @indexer ||= Indexer.new type: self.name
    end

    def searcher
      @searcher ||= Searcher.new type: self.name
    end

  end
end
