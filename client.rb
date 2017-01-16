require 'singleton'

module Elastic
  class Client
    attr_reader :index_name
    include Singleton
    def configure(params)
      @host = params[:host]
      @log = params[:log] || false
      @index_name = params[:index_name]
    end

    def index_create
      client.indices.create index: @index_name
    end

    def index_delete
      client.indices.delete index: @index_name
    end

    def index_exists?
      client.indices.exists? index: @index_name
    end

    #Elasticsearch::Transport::Client
    def client
      @client ||= Elasticsearch::Client.new host: @host,
                                            log:  @log
    end

  end
end
