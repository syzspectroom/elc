require_relative 'basic_response'
module Elastic::Response
  class CountResponse < BasicResponse

  def count
    response['count']
  end

  def to_s
    count
  end

  alias_method :total, :count
  end
end
