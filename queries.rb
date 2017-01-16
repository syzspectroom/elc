module Elastic::Queries
  def delete_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.delete(params),
      :delete)
  end

  def search_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.search(params),
      :search)
  end

  def get_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.get(params),
      :get)
  end

  def count_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.count(params),
      :count)
  end

  def exists_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.exists?(params),
      :exists)
  end

  def update_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.update(params),
      :index)
  end

  def delete_by_query(params)
    Elastic::Response.build(
      Elastic::Client.instance.client.delete_by_query(params),
      :delete_by_query)
  end
end
