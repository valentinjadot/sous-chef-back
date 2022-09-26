# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
ActionDispatch::Request.parameter_parsers[:json] = lambda { |raw_post|
  # Modified from action_dispatch/http/parameters.rb
  data = ActiveSupport::JSON.decode(raw_post)

  # Transform camelCase param keys to snake_case
  if data.is_a?(Array)
    data.map { |item| transform_keys(item) }
  else
   transform_keys(data)
  end

  # Return data
  data.is_a?(Hash) ? data : { '_json': data }
}


def transform_keys(item)
  item.deep_transform_keys!(&:underscore)
  item.deep_transform_keys! do |key|
    key.split("is_").last
  end
end
