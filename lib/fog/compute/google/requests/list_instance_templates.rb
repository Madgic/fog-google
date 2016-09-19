module Fog
  module Compute
    class Google

      class Mock
        def list_instance_templates()
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_instance_templates()
          api_method = @compute.instance_templates.list
          parameters = {
            "project" => @project,
          }

          request(api_method, parameters)
        end
      end
    end
  end
end
