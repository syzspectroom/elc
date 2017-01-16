Simple ruby library for elastic search.

usage example:

```
class MediaSource
  include Elastic

  id do |source|
    "#{source[:name]}".downcase.gsub(/\s|\,|\.|\/|:|-/,'_')
  end

  mapping do
    {
      "dynamic": false,
      "properties": {
        "name": {
          "index": "not_analyzed",
          "type": "string"
        },
        "type": { # rss/manual/system
          "index": "not_analyzed",
          "type": "string"
        },
        "enabled": {
          "index": "not_analyzed",
          "type": "boolean"
        },
        "url": {
          "index": "not_analyzed",
          "type": "string"
        },
        "created_at": {
          "index": "not_analyzed",
          "type": "date"
        },
        "updated_at": {
          "index": "not_analyzed",
          "type": "date"
        },
        "rss_url": {
          "index": "not_analyzed",
          "type": "string"
        }
      }
    }
  end

  def self.get_enabled_rss
    query_body =
      { query: {
          filtered: {
            filter: {
              bool: {
                must: [
                  {exists: { field: "rss_url" }},
                  {term: { enabled: true }}
                ],
                must_not: [
                  {term: {rss_url: "" }}
                ]
              }
            }
          }
        },
        "size": self.search.total
      }

    self.search body: query_body
  end
end
```
