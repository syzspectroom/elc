require 'active_support/core_ext/hash/deep_merge'

require_relative 'utils/configurable'
require_relative 'queries'
#see http://www.rubydoc.info/gems/elasticsearch-api/Elasticsearch/API/Actions
module Elastic
  class Searcher
    include Utils::Configurable
    include Queries
    def match_all(params = {})
      search_query basic_query.merge(params).merge ({body: { query: { match_all: {} } }})
    end

    def search(params = {})
      search_query basic_query.merge(params)
    end

    def delete(id, params = {})
      delete_query basic_query.merge({id: id}).merge(params)
    end

    def update(id, params)
      update_query basic_query.merge({ id:   id,
                                       body: { doc: params }
                                     })
    end

    #see http://www.rubydoc.info/gems/elasticsearch-api/Elasticsearch/API/Actions#delete_by_query-instance_method
    def delete_by(params)
      delete_by_query basic_query.merge(params)
    end

    def count(params = {})
      count_query basic_query.merge(params)
    end

    def exists?(id, params = {})
      exists_query basic_query.merge({id: id}).merge(params)
    end

    def get_by_id(id, params = {})
      if id.is_a?(Array)
        get_by_ids(id, params)
      else
        get_one_by_id(id, params)
      end
    end

    def get_one_by_id(id, params = {})
      get_query basic_query.merge({id: id}).merge(params)
    end

    def get_by_ids(ids, params = {})
      search_query basic_query.merge(params).deep_merge({body: {query: {ids: {values: ids} }}})
    end
  end
end
