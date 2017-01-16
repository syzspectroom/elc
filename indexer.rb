require_relative 'utils/configurable'

module Elastic
  class Indexer
    include Utils::Configurable

    #see http://www.rubydoc.info/gems/elasticsearch-api/Elasticsearch/API/Actions#index-instance_method
    def index(params)
      Elastic::Response.build(
        Elastic::Client.instance.client.index(basic_query.merge(params)),
        :index
      )
    end

  end
end
