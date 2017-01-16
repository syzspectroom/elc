module Elastic::Response
  class DeleteResponse < BasicResponse

  def found?
    response['found']
  end

  alias_method :deleted?, :found?
  end
end
