require_relative 'client'
require_relative 'class_methods'
require_relative 'mapper'
require_relative 'indexer'
require_relative 'searcher'

Dir[File.dirname(__FILE__) + '/response/*.rb'].each {|file| require file }
module Elastic
  def self.included(base)
    base.extend ClassMethods
  end
end
