require_relative 'utils/configurable'

module Elastic
  class Mapper
    include Utils::Configurable
    attr_reader :mapping_params

    def mapping(mapping_param = "", &block)
      @mapping_params =
        if block_given?
          block.call
        else
          mapping_param
        end
    end

    def get_mapping
      res = Elastic::Client.instance.client.indices.get_mapping basic_query
      res[basic_query[:index]]['mappings'][basic_query[:type]]['properties']
    end

    def create_mapping
      Client.instance.index_create unless Client.instance.index_exists?
      Elastic::Client.instance.client.indices.put_mapping basic_query.merge(
                                                          {body: mapping_params})
    end

  end
end
