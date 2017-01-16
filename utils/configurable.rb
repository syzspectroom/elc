module Elastic::Utils
  module Configurable
    def initialize(params)
      configure(params)
    end

    def configure(params)
      @index_type = params[:type]
    end

    def index_type
      @index_type.downcase
    end

    private
      def basic_query
        {index: Elastic::Client.instance.index_name,
         type:  index_type}
      end
  end
end
