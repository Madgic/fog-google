module Fog
  module Compute
    class Google
      class Mock
        def delete_instance_template(_name)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_instance_template(name)
          api_method = @compute.instance_templates.delete
          parameters = {
            "instanceTemplate" => name,
            "project" => @project,
          }

          request(api_method, parameters)
        end
      end
    end
  end
end
