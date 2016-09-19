module Fog
  module Compute
    class Google
      class Mock
        def insert_instance_template(_name, _properties, _description)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def insert_instance_template(name, properties, description)
          api_method = @compute.instance_templates.insert
          parameters = {
            "project" => @project
          }
          body_object = {
            "name" => name,
            "description" => description,
            "properties" => properties,
          }

          request(api_method, parameters, body_object)
        end
      end
    end
  end
end
