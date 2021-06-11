# frozen_string_literal: true

class RefResolver
    def call(uri)
      if uri.host == 'api.common-eats.com'
        get_local(uri)
      else
        get_http(uri)
      end
    end
  
    private
  
    def get_http(uri)
      JSON.parse(Net::HTTP.get(uri))
    end
  
    def get_local(uri)
      JSON.load_file(Rails.root.join('spec', uri.path.delete_prefix('/')))
    end
  end
  
  RSpec::Matchers.define :conform_to_json_schema do |schema|
    schema_path = Rails.root.join('spec', 'schemas', "#{schema}.json")
    schemer = JSONSchemer.schema(schema_path, ref_resolver: RefResolver.new)
  
    match do |obj|
      schemer.valid?(obj)
    end
  
    failure_message do |obj|
      "#{obj} did not conform to JSON schema with the following errors:\n" +
        schemer
        .validate(obj)
        .map { |m| "\t- #{m}" }
        .join("\n")
    end
end